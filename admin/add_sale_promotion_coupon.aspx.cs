using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_add_sale_promotion_coupon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {       
        int cid = 0;
        int sid = 0;

        //startDate.MinDate = DateTime.Today.Date;
        //endDate.MinDate = DateTime.Today.Date;

        startDate.MinDate = new System.DateTime();
        endDate.MinDate = new System.DateTime();


        if (!IsPostBack)
        {
            BindDDLCategory();
            BindDDLSubCategory(cid);
            BindDDLSubSubCategory(cid, sid);

            lblMsg.Visible = false;
            //TRPrice.Visible = false;
            string coupon_no = GetRandomPasswordUsingGUID(8);
            // txtCouponCode.Text = coupon_no.ToUpper();

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetDiscountPrice(id);
            }
        }
    }

    private void BindDDLCategory()
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetCategory";
        obj.AddParam("@cid", "");
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlCat.DataTextField = "cat_name";
            ddlCat.DataValueField = "cid";
            ddlCat.DataSource = dr;
            ddlCat.DataBind();
            //ddlCat.Items.Insert(0, "Select");

        }
    }
    private void BindDDLSubCategory(int cid)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetSubCategorybyCatId";
        obj.AddParam("@cid", cid);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlSubcategory.DataTextField = "subcat_name";
            ddlSubcategory.DataValueField = "sid";
            ddlSubcategory.DataSource = dr;
            ddlSubcategory.DataBind();
            ddlSubcategory.Items.Insert(0, "Select");
        }
    }

    private void BindDDLSubSubCategory(int cid, int sid)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetSubSubCategorybyCatSubCatId";
        obj.AddParam("@cid", cid);
        obj.AddParam("@sid", sid);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            //ddlSubSubcategory.DataTextField = "subsubcat_name";
            //ddlSubSubcategory.DataValueField = "ssid";
            //ddlSubSubcategory.DataSource = dr;
            //ddlSubSubcategory.DataBind();
            //ddlSubSubcategory.Items.Insert(0, "Select");
        }
    }

    private void GetDiscountPrice(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetSalesPromotionDiscount";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
         
            startDate.DbSelectedDate = DateTime.Parse(dt.Rows[0]["start_date"].ToString());
            endDate.DbSelectedDate = DateTime.Parse(dt.Rows[0]["end_date"].ToString());

            ddlCat.SelectedValue = dt.Rows[0]["cat_id"].ToString();
            ddlSubcategory.SelectedValue = dt.Rows[0]["subcat_id"].ToString();
           // txtPercentage.Text = dt.Rows[0]["product_id"].ToString();
           // txtPercentage.Text = dt.Rows[0]["cat_name"].ToString();
           // txtPercentage.Text = dt.Rows[0]["subcat_name"].ToString();
            //txtPercentage.Text = dt.Rows[0]["product_name"].ToString();

            txtPercentage.Text = dt.Rows[0]["percentage"].ToString();
            txtCouponDesc.Text = dt.Rows[0]["description"].ToString();
           
        }
    }
    //protected void rbtnMode_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string mode = rbtnMode.SelectedValue.ToString();
    //    if (mode == "0")
    //    {
    //        TRPercentage.Visible = true;
    //        TRPrice.Visible = false;
    //    }
    //    else
    //    {
    //        TRPercentage.Visible = false;
    //        TRPrice.Visible = true;
    //    }
    //}
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

            string strSKU = "";
            string intSKU = "";

            foreach (ListItem li in chkSKU.Items)
            {
                if (li.Selected)
                {
                   // strSKU += li.Text + ";";
                   // intSKU += li.Value + ";";

                    strSKU = li.Text;
                    intSKU = li.Value;

                    DBconnection obj = new DBconnection();
                    obj.SetCommandSP = "z_AddSalesPromotionDiscount";
                    obj.AddParam("@cat_id", int.Parse(ddlCat.SelectedValue.Trim().ToString()));
                    obj.AddParam("@subcat_id", int.Parse(ddlSubcategory.SelectedValue.Trim().ToString()));
                   // obj.AddParam("@subsubcat_id", int.Parse(ddlSubSubcategory.SelectedValue.Trim().ToString()));
                    obj.AddParam("@product_id", intSKU);

                    obj.AddParam("@cat_name", ddlCat.SelectedItem.Text.Trim().ToString());
                    obj.AddParam("@subcat_name", ddlSubcategory.SelectedItem.Text.Trim().ToString());
                    obj.AddParam("@product_name", strSKU);

                    //obj.AddParam("@coupon_no", txtCouponCode.Text.Trim().ToString());
                    obj.AddParam("@start_date", DateTime.Parse(startDate.SelectedDate.ToString()));
                    obj.AddParam("@end_date", DateTime.Parse(endDate.SelectedDate.ToString()));
                    string mode = "Percentage";// rbtnMode.SelectedItem.Text.Trim().ToString();
                    obj.AddParam("@price_change_mode", mode);

                    if (mode == "Percentage")
                    {
                        obj.AddParam("@percentage", decimal.Parse(txtPercentage.Text.Trim().ToString()));
                        obj.AddParam("@discount_amt", DBNull.Value);
                    }
                    else
                    {
                        obj.AddParam("@percentage", DBNull.Value);
                        obj.AddParam("@discount_amt", 0);
                        //obj.AddParam("@discount_amt", decimal.Parse(txtPrice.Text.Trim().ToString()));
                    }

                    obj.AddParam("@description", txtCouponDesc.Text.Trim().ToString());


                    obj.AddParam("@ipaddress", ipaddress);

                    int exe = obj.ExecuteNonQuery();
                    if (exe > 0)
                    {                        
                        string jv = "<script>alert('Discount Has Been Created Successfully');</script>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                    }
                }
            }

            Clear();
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
            string mode = "Percentage";// rbtnMode.SelectedItem.Text.Trim().ToString();
            obj.AddParam("@price_change_mode", mode);

            if (mode == "By Percentage")
            {
                obj.AddParam("@percentage", decimal.Parse(txtPercentage.Text.Trim().ToString()));
                obj.AddParam("@price", DBNull.Value);
            }
            else
            {
                obj.AddParam("@percentage", DBNull.Value);
                obj.AddParam("@discount_amt", 0);
                //obj.AddParam("@discount_amt", decimal.Parse(txtPrice.Text.Trim().ToString()));
            }

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();
                string jv = "<script>alert('Discount Has Been Updated Successfully');</script>";
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
       // rbtnMode.SelectedIndex = 0;
        txtPercentage.Text = "";
       // txtPrice.Text = "";
        ddlCat.ClearSelection();
        ddlSubcategory.ClearSelection();
        chkSKU.ClearSelection();
        txtCouponDesc.Text = "";
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
            //CVCoupon.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                //obj.SetCommandQry = "select coupon_no from coupon_tbl_tbl where coupon_no='" + txtCouponCode.Text.Trim().ToString() + "'";
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

    protected void ddlPromotion_SelectedIndexChanged(object sender, EventArgs e)
    {
        // string pName = ddlProducts.SelectedItem.Text.Trim();
        //  string proAbbri = ddlPromotion.SelectedItem.Text.Trim();
        string coupon_no = GetRandomPasswordUsingGUID(4);

        //lblCouponCode.Text = pName + "_" + proAbbri + "_" + coupon_no;
    }
    protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSubcategory.ClearSelection();
        //ddlSubSubcategory.ClearSelection();
        ddlSubcategory.Items.Clear();
       // ddlSubSubcategory.Items.Clear();
        ddlSubcategory.Items.Insert(0, "Select");
       // ddlSubSubcategory.Items.Insert(0, "Select");

        chkSKU.Items.Clear();

        int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
        BindDDLSubCategory(cid);
    }
    protected void ddlSubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
        int sid = Int32.Parse(ddlSubcategory.SelectedValue.ToString());
        //int ssid = Int32.Parse(ddlSubSubcategory.SelectedValue.ToString());


        string coupon_no = GetRandomPasswordUsingGUID(4);
        string pName = ddlCat.SelectedItem.Text.Trim();
        string proAbbri = ddlSubcategory.SelectedItem.Text.Trim();       
        

        BindSku(cid, sid);


       // BindDDLSubSubCategory(cid, sid);
    }
    protected void chkSKU_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bool b = true;
            int pid = int.Parse(chkSKU.SelectedValue.ToString());
            b = IsAlreadyExist(pid);
            if (b == false)
            {
                foreach (ListItem li in chkSKU.Items)
                {
                    if (pid == int.Parse(li.Value.ToString()))
                    {
                        li.Selected = false;
                    }
                }

                string jv = "<script>alert('This product is already use to this date range with other promotions. Try to add another date range');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private bool IsAlreadyExist(int pid)
    {
        bool b = true;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_IsPromotionAlreadyExist";
        obj.AddParam("@product_id", pid);       
        obj.AddParam("@start_date", DateTime.Parse(startDate.SelectedDate.ToString()));
        obj.AddParam("@end_date", DateTime.Parse(endDate.SelectedDate.ToString()));

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            b = false;            
        }
        return b;
    }
    protected void ddlSubSubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        string coupon_no = GetRandomPasswordUsingGUID(4);
        string pName = ddlCat.SelectedItem.Text.Trim();
        string proAbbri = ddlSubcategory.SelectedItem.Text.Trim();

       // int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
       // int sid = Int32.Parse(ddlSubcategory.SelectedValue.ToString());
       // int ssid = Int32.Parse(ddlSubSubcategory.SelectedValue.ToString());

       // BindSku(ssid);
    }

    private void BindSku(int ssid)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM View_Products where ssid="+ssid+" order by sku";      
       
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            chkSKU.DataTextField = "product_name";
            chkSKU.DataValueField = "pid";
            chkSKU.DataSource = dr;
            chkSKU.DataBind();            
        }
    }
    private void BindSku(int cid, int sid)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM View_Products where cid=" + cid + " and sid=" + sid + " order by sku";


        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            chkSKU.DataTextField = "product_name";
            chkSKU.DataValueField = "pid";
            chkSKU.DataSource = dr;
            chkSKU.DataBind();
        }
        else
        {
            chkSKU.Items.Clear();
        }
    }
}