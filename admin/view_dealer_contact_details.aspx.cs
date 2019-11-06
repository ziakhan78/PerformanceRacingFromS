using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_view_dealer_contact_details : System.Web.UI.Page
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
            obj.SetCommandSP = "z_GetDealersContacts";

            obj.AddParam("@id", id);
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                lblCompany.Text = dt.Rows[0]["CompanyName"].ToString();
                lblName.Text = dt.Rows[0]["Name"].ToString();
                lblDesignation.Text = dt.Rows[0]["Designation"].ToString();
               

                lblMobile.Text = dt.Rows[0]["MobileCC"].ToString() + " " + dt.Rows[0]["Mobile"].ToString();
              
                lblPhone.Text = dt.Rows[0]["PhoneCC"].ToString() + " " + dt.Rows[0]["PhoneAC"].ToString() + " " + dt.Rows[0]["Phone"].ToString();

                lblPhoneExt.Text = dt.Rows[0]["Ext"].ToString();


                lblEmail.Text = dt.Rows[0]["EmailId"].ToString();
                
            }
        }
        catch { }
    }
}