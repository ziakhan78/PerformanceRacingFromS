using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_view_courier_company_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetDealerDetails(id);
            }
        }
    }
    private void GetDealerDetails(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetCourierCompany";
            obj.AddParam("@id", id);
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                DateTime dts, dte;
                lblCompany.Text = dt.Rows[0]["CompanyName"].ToString();
                lblAddress.Text = dt.Rows[0]["Address1"].ToString() + " <br/>" + dt.Rows[0]["Address2"].ToString();
                lblLandmark.Text = dt.Rows[0]["Landmark"].ToString();
                lblPin.Text = dt.Rows[0]["Pin"].ToString();
                lblCity.Text = dt.Rows[0]["City"].ToString();               

                lblmob1.Text = dt.Rows[0]["MobileCc1"].ToString() + " " + dt.Rows[0]["Mobile1"].ToString();
                lblMob2.Text = dt.Rows[0]["MobileCc2"].ToString() + " " + dt.Rows[0]["Mobile2"].ToString();

                lblPhone1.Text = dt.Rows[0]["PhoneCC1"].ToString() + " " + dt.Rows[0]["PhoneAC1"].ToString() + " " + dt.Rows[0]["Phone1"].ToString();
                lblPhone2.Text = dt.Rows[0]["PhoneCC2"].ToString() + " " + dt.Rows[0]["PhoneAC2"].ToString() + " " + dt.Rows[0]["Phone2"].ToString();

                try
                {
                    dts = new DateTime();
                    dts = DateTime.Parse(dt.Rows[0]["WorkingTimeStart"].ToString());


                    dte = new DateTime();
                    dte = DateTime.Parse(dt.Rows[0]["WorkingTimeEnd"].ToString());
                    lblWorkingTime.Text = dts.ToString("hh:mm tt") + " - " + dte.ToString("hh:mm tt");
                }
                catch { }

                lblWorkingDays.Text = dt.Rows[0]["WorkingDayStart"].ToString() + " - " + dt.Rows[0]["WorkingDayEnd"].ToString();
              

                                
                string website = dt.Rows[0]["Website"].ToString();
                if (website == "http://www.")
                {
                    lblWebsite.Text = "";
                }
                else
                {
                    lblWebsite.Text = website;
                }

              
                lblEmail.Text = dt.Rows[0]["EmailId"].ToString();

                lblShipTo.Text = dt.Rows[0]["ShipTo"].ToString();
                

            }
        }
        catch { }
    }
}