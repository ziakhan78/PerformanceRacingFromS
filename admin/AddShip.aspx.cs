using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data.SqlClient;
using System.Data.SqlTypes;

public partial class admin_AddShip : System.Web.UI.Page
{
    int ShipID = Convert.ToInt32(HttpContext.Current.Request.QueryString["ShipID"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
           
            SqlConnection dbConn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnString"].ToString());
            // define the sql to perform the database insert
            dbConn.Open();
            if (ShipID == 0)
            {
                BtnAdd.Visible = true;
            }
            else
            {
                
            }
        }
    }

    private void clearfields()
    {
        txtminwt.Text = "";
        txtmaxwt.Text = "";
        //txtpinstart.Text = "";
        //txtpinend.Text = "";
        txtCharges.Text = "";
    }

   

    public void showmsg(string msg)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
    public void showmsg(string msg, string RedirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + RedirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
        
    

    protected void cvship_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            Shipping shobj = new Shipping();
            //shobj.StateId = Convert.ToInt32(ddlstate.SelectedValue);
            shobj.MinimumWeight = Convert.ToDecimal(txtminwt.Text.Trim());
            shobj.MaximumWeight = Convert.ToDecimal(txtmaxwt.Text.Trim());
            DataTable dt = new DataTable();

            dt = shobj.SelectShippingCharge();
            if (dt.Rows.Count > 0)
            {
                args.IsValid =false ;
            }
            else
            {
                args.IsValid = true;
            }            
        }
        catch { args.IsValid = false; }

    }

    protected void txtCharges_TextChanged(object sender, EventArgs e)
    {

    }
    protected void custwt_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            int maxwt, minwt;
            minwt = Convert.ToInt32(txtminwt.Text.Trim());
            maxwt = Convert.ToInt32(txtmaxwt.Text.Trim());
            if (maxwt > minwt)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
        catch
        {

        }
    }
    //protected void custpin_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    try
    //    {
    //        int maxpin, minpin;
    //        minpin = Convert.ToInt32(txtpinstart.Text .Trim ());
    //        maxpin = Convert.ToInt32(txtpinend.Text .Trim ());
    //        if (maxpin > minpin)
    //        {
    //            args.IsValid = true;
    //        }
    //        else
    //        {
    //            args.IsValid = false;
    //        }
    //    }
    //    catch
    //    {

    //    }
    //}


    protected void BtnAdd_Click1(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                Shipping shobj = new Shipping();

                shobj.min_wt = Convert.ToDecimal(txtminwt.Text.Trim());
                shobj.max_wt = Convert.ToDecimal(txtmaxwt.Text.Trim());
                //shobj.PincodeStart = Convert.ToInt32(txtpinstart.Text.Trim());
                //shobj.PincodeEnd = Convert.ToInt32(txtpinend.Text.Trim());
                shobj.FrameShip = Convert.ToDecimal(txtCharges.Text.Trim());
                //shobj.NoFrameShip = Convert.ToDecimal(txtCharges0.Text.Trim());
                // shobj.BookShip = Convert.ToDecimal(txtCharges1.Text.Trim());

                //shobj.country_id = Convert.ToInt32(DDLState.SelectedItem.Value.Trim());
                shobj.StateId = Convert.ToInt32(DDLState.SelectedItem.Value.Trim());
                //shobj.country_id = Convert.ToInt32(ddlcountry.SelectedItem.Value.Trim());

                if (shobj.AddShipping())
                {
                    showmsg("Record added successfully !", "ManageShip.aspx");
                    clearfields();
                }
                else
                {
                    showmsg("Error...while adding record,please try again");
                }
            }
            catch
            {

            }
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageShip.aspx");
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (DDLState.SelectedIndex == 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
}
