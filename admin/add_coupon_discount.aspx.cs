using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_coupon_discount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        startDate.MinDate = new System.DateTime();
        endDate.MinDate = new System.DateTime();

        //startDate.MinDate = DateTime.Today.Date;
        //endDate.MinDate = DateTime.Today.Date;

        if (!IsPostBack)
        {           
            lblMsg.Visible = false;           
            TRPrice.Visible = false; 
            string coupon_no = GetRandomPasswordUsingGUID(8);
           // txtCouponCode.Text = coupon_no.ToUpper();
           
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetDiscountPrice(id);
            }
        }
    }

    private void GetDiscountPrice(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetCouponNo";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {           
           // txtCouponCode.Text = dt.Rows[0]["coupon_no"].ToString();

            ddlCat.SelectedItem.Text = dt.Rows[0]["cat_name"].ToString();
           // ddlPromotion.SelectedItem.Text = dt.Rows[0]["promotion"].ToString();        

            lblCouponCode.Text = dt.Rows[0]["coupon_no"].ToString();

            //DateTime dttt = DateTime.Parse(dt.Rows[0]["start_date"].ToString());
            //startDate.SelectedDate = DateTime.Parse(dt.Rows[0]["start_date"].ToString());
            //endDate.SelectedDate = DateTime.Parse(dt.Rows[0]["end_date"].ToString());

            startDate.DbSelectedDate = DateTime.Parse(dt.Rows[0]["start_date"].ToString());
            endDate.DbSelectedDate = DateTime.Parse(dt.Rows[0]["end_date"].ToString());
          
            txtPercentage.Text = dt.Rows[0]["percentage"].ToString();          
            txtPrice.Text = dt.Rows[0]["price"].ToString();           

            string mode = dt.Rows[0]["price_change_mode"].ToString();
            if (mode == "By Percentage")
            {
                txtPrice.Text = "";
                rbtnMode.SelectedIndex = 0;
            }
            else
            {
                rbtnMode.SelectedIndex = 1;
                TRPrice.Visible = true;
            }
        }
    }

    protected void rbtnMode_SelectedIndexChanged(object sender, EventArgs e)
    {
        string mode = rbtnMode.SelectedValue.ToString();
        if (mode == "0")
        {
            TRPercentage.Visible = true;
            TRPrice.Visible = false;
        }
        else
        {
            TRPercentage.Visible = false;
            TRPrice.Visible = true;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateDiscountPrice(id);
                //bool b = CheckAlreadyDiscount();
                //if (b == true)
                //    UpdateDiscountPrice(id);
                //else
                //    lblMsg.Visible = true;
            }
            else
            {
                AddDiscountPrice();
                //bool b = CheckAlreadyDiscount();
                //if (b == true)
                //    AddDiscountPrice();
                //else
                //    lblMsg.Visible = true;
            }
        }
    }

    private bool CheckAlreadyDiscount()
    {
        bool b = true;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_CheckExistingDate_coupon";
        obj.AddParam("@start_date", DateTime.Parse(startDate.SelectedDate.ToString()));
        obj.AddParam("@end_date", DateTime.Parse(endDate.SelectedDate.ToString()));

        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            b = false;
        }

        return b;
    }
    private void AddDiscountPrice()
    {
        try
        {
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/   


            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddCouponNo";

            //obj.AddParam("@coupon_no", txtCouponCode.Text.Trim().ToString());
            obj.AddParam("@coupon_no", lblCouponCode.Text.Trim().ToString());
            obj.AddParam("@start_date", DateTime.Parse(startDate.SelectedDate.ToString()));
            obj.AddParam("@end_date", DateTime.Parse(endDate.SelectedDate.ToString()));
            string mode = rbtnMode.SelectedItem.Text.Trim().ToString(); 
            obj.AddParam("@price_change_mode", mode);

            if (mode == "Percentage")
            {
                obj.AddParam("@percentage", decimal.Parse(txtPercentage.Text.Trim().ToString()));
                obj.AddParam("@price", DBNull.Value);
            }
            else
            {
                obj.AddParam("@percentage", DBNull.Value);
                obj.AddParam("@price", decimal.Parse(txtPrice.Text.Trim().ToString()));              
            }

            obj.AddParam("@login_user", Session["user"].ToString());
            obj.AddParam("@ipaddress", ipaddress);
            
            obj.AddParam("@cat_name", ddlCat.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@promotion", "");

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();
                string jv = "<script>alert('Coupon No. Has Been Created Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateDiscountPrice(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateCouponNo";

            obj.AddParam("@id", id);

            //obj.AddParam("@coupon_no", txtCouponCode.Text.Trim().ToString());
            obj.AddParam("@start_date", DateTime.Parse(startDate.SelectedDate.ToString()));
            obj.AddParam("@end_date", DateTime.Parse(endDate.SelectedDate.ToString()));
            string mode = rbtnMode.SelectedItem.Text.Trim().ToString();
            obj.AddParam("@price_change_mode", mode);

            if (mode == "By Percentage")
            {
                obj.AddParam("@percentage", decimal.Parse(txtPercentage.Text.Trim().ToString()));
                obj.AddParam("@price", DBNull.Value);
            }
            else
            {
                obj.AddParam("@percentage", DBNull.Value);
                obj.AddParam("@price", decimal.Parse(txtPrice.Text.Trim().ToString()));
            }

            obj.AddParam("@cat_name", ddlCat.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@promotion", "");


            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();
                string jv = "<script>alert('Coupon No. Has Been Updated Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void Clear()
    {
       // txtCouponCode.Text = "";
        startDate.Clear();
        endDate.Clear();
        rbtnMode.SelectedIndex = 0;
        txtPercentage.Text = ""; 
        txtPrice.Text = "";
        lblCouponCode.Text = "";
        ddlCat.ClearSelection();
       // ddlPromotion.ClearSelection();
    }

    public string GetRandomPasswordUsingGUID(int length)
    {
        string guidResult = System.Guid.NewGuid().ToString();
        guidResult = guidResult.Replace("-", string.Empty);

        if (length <= 0 || length > guidResult.Length)
        {
            throw new ArgumentException("Length must be between 1 and " + guidResult.Length);
        }
        else
        {
            return guidResult.Substring(0, 4);
        }
    }
    protected void CVCoupon_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            //CVCoupon_ServerValidate.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select coupon_no from coupon_tbl_tbl where coupon_no='" + lblCouponCode.Text.Trim().ToString() + "'";
                object res = obj.ExecuteScalar();
                if (res != null)
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }
            catch
            {
                args.IsValid = true;
            }
        }
    }   

    //protected void ddlPromotion_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string pName = ddlCat.SelectedItem.Text.Trim();
    //    int intAbbri=int.Parse(ddlPromotion.SelectedValue.ToString());

    //    string proAbbri = GetAbbri(intAbbri);
    //   // string proAbbri = ddlPromotion.SelectedItem.Text.Trim();
    //    string coupon_no = GetRandomPasswordUsingGUID(4);

    //    lblCouponCode.Text = pName + "-" + proAbbri + "-" + coupon_no;
    //}

    //private string GetAbbri(int abbri)
    //{
    //    string strAbbri="";

    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandQry = "select occasion_abbri from Promotions_Occasion_tbl where id=" + abbri;
    //    strAbbri = obj.ExecuteScalar().ToString();        
    //    return strAbbri;
    //}
    protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        string pName = ddlCat.SelectedItem.Text.Trim();
       // int intAbbri = int.Parse(ddlCat.SelectedValue.ToString());

        //string proAbbri = GetAbbri(intAbbri);
        // string proAbbri = ddlPromotion.SelectedItem.Text.Trim();
        string couponNo = GetRandomPasswordUsingGUID(6);
        lblCouponCode.Text = pName + "-" + couponNo;
    }
}