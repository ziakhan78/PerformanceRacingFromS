using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DealersAccounts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["did"] != null)
            {
                int dealerId = int.Parse(Session["did"].ToString());
                GetDealerDetails(dealerId);
            }
        }
    }

    private void GetDealerDetails(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetDealers";
            obj.AddParam("@id", id);
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                lblCompany.Text = "Dealers: "+dt.Rows[0]["CompanyName"].ToString();
                lblAddress.Text = "Address: "+dt.Rows[0]["Address1"].ToString() + " <br/>" + dt.Rows[0]["Address2"].ToString();
                //lblLandmark.Text = dt.Rows[0]["Landmark"].ToString();
                //lblPin.Text = dt.Rows[0]["Pin"].ToString();
                //lblCity.Text = dt.Rows[0]["City"].ToString();
                //lblState.Text = dt.Rows[0]["State"].ToString();

                //lblmob1.Text = dt.Rows[0]["MobileCc1"].ToString() + " " + dt.Rows[0]["Mobile1"].ToString();
                //lblMob2.Text = dt.Rows[0]["MobileCc2"].ToString() + " " + dt.Rows[0]["Mobile2"].ToString();

                //lblPhone1.Text = dt.Rows[0]["PhoneCC1"].ToString() + " " + dt.Rows[0]["PhoneAC1"].ToString() + " " + dt.Rows[0]["Phone1"].ToString();
                //lblPhone2.Text = dt.Rows[0]["PhoneCC2"].ToString() + " " + dt.Rows[0]["PhoneAC2"].ToString() + " " + dt.Rows[0]["Phone2"].ToString();
                //lblFax.Text = dt.Rows[0]["FaxCC"].ToString() + " " + dt.Rows[0]["FaxAC"].ToString() + " " + dt.Rows[0]["Fax"].ToString();

                //lblVatNo.Text = dt.Rows[0]["Vat"].ToString();
                //lblPanNo.Text = dt.Rows[0]["Pan"].ToString();

                //try
                //{
                //    DateTime dtstart = DateTime.Parse(dt.Rows[0]["WorkingTimeStart"].ToString());
                //    DateTime dtend = DateTime.Parse(dt.Rows[0]["WorkingTimeEnd"].ToString());

                //    lblWorkingTime.Text = dtstart.ToString("hh:mm tt") + " " + dtend.ToString("hh:mm tt");
                //}
                //catch { }

                //lblWorkingDays.Text = dt.Rows[0]["WorkingDayStart"].ToString() + " - " + dt.Rows[0]["WorkingDayEnd"].ToString();
                // lblWorkingTime.Text = dt.Rows[0]["WorkingTimeStart"].ToString() + " " + dt.Rows[0]["WorkingTimeEnd"].ToString();
               // lblClosedOn.Text = dt.Rows[0]["ClosedOn"].ToString();
                lblCreditFacility.Text = "Credit Facility: "+dt.Rows[0]["CreditFacility"].ToString();



                //string website = dt.Rows[0]["Website"].ToString();
                //if (website == "http://www.")
                //{
                //    lblWebsite.Text = "";
                //}
                //else
                //{
                //    lblWebsite.Text = website;
                //}


                //lblBrand.Text = dt.Rows[0]["BrandRepresented"].ToString();
                // lblEmail.Text = dt.Rows[0]["EmailId"].ToString();

                if (dt.Rows[0]["CreditFacility"].ToString() == "Yes")
                {
                    lblCreditPeriod.Text = "Credit Period: "+dt.Rows[0]["CreditPeriod"].ToString();
                    lblCreditLimit.Text = "Credit Limit: "+dt.Rows[0]["CreditLimit"].ToString();
                    lblDealerBalanceAmt.Text = "Balance Credit: " + dt.Rows[0]["CreditBalanceAmt"].ToString();
                }
                



                //string logo = dt.Rows[0]["Logo"].ToString();

                //if (logo != "")
                //{
                //    CompLogo.Visible = true;
                //    CompLogo.ImageUrl = "../images/" + logo.ToString();
                //}
                //else
                //{
                //    CompLogo.Visible = false;
                //}

            }
        }
        catch { }
    }

}
