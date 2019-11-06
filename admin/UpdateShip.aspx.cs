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

public partial class admin_UpdateShip : System.Web.UI.Page
{
    int ShipID = Convert.ToInt32(HttpContext.Current.Request.QueryString["ShipID"]);
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                Shipping shobj = new Shipping();
                shobj.ShippingMethodId = ShipID;
                dt = shobj.SelectShippingDetails();
                foreach (DataRow dr in dt.Rows)
                {
                    txtminwt.Text = dt.Rows[0]["min_wt"].ToString();
                    txtmaxwt.Text = dt.Rows[0]["max_wt"].ToString();
                    txtCharges.Text = dt.Rows[0]["ShipCharge"].ToString();
                   // txtCharges0.Text = dt.Rows[0]["NoFrameShip"].ToString();
                   // txtCharges1.Text = dt.Rows[0]["BookShip"].ToString();
                    //txtpinstart.Text = dt.Rows[0]["PincodeStart"].ToString();
                    //txtpinend.Text = dt.Rows[0]["PincodeEnd"].ToString();
                   // txtCharges.Text = dt.Rows[0]["ShippingChargeAmount"].ToString();
                    ddlcountry.DataBind();
                    try
                    {
                        ddlcountry.Items.FindByValue(dt.Rows[0]["country_id"].ToString().Trim()).Selected=true;
                    }
                    catch { }
                }
            }
            catch
            {

            }
        }
    }
   
    protected void BtnCancel_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ManageShip.aspx");
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

    private void clearfields()
    {
        try
        {
            txtminwt.Text = "";
            txtmaxwt.Text = "";
            //txtpinstart.Text = "";
            //txtpinend.Text = "";
            txtCharges.Text = "";
        }
        catch
        {

        }
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
    //        minpin = Convert.ToInt32(txtpinstart.Text.Trim());
    //        maxpin = Convert.ToInt32(txtpinend.Text.Trim());
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
    protected void BtnEdit_Click(object sender, EventArgs e)
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
                shobj.country_id = Convert.ToInt32(ddlcountry.SelectedItem.Value.Trim());
                shobj.Ship_map_id = ShipID;

                int i = 0;
                if (shobj.UpdateShipping())
                {
                    showmsg("Record updated successfully !", "ManageShip.aspx");
                }
                else
                {
                    showmsg("Error...while updating record,please try again");
                }
            }
            catch
            {

            }
        }
    }
}
