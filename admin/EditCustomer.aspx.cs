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

public partial class Admin_EditCustomer : System.Web.UI.Page
{
    int countryID = 0;
    int cust_id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Admin"] != null)
            {
               // BindDDLCountry(countryID);
              //  BindDDLState(countryID);
              //  BindDDLSCountry(countryID);
              //  BindDDLSState(countryID);

                if (Request.QueryString["custID"] != null)
                {
                    cust_id = Int32.Parse(Request.QueryString["custID"].ToString());
                    GetCustomer(cust_id);
                }
            }

            else
            {
                Response.Redirect("../Admin/Default.aspx");
            }
        }
    }
    protected void btnUpdate_Click1(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            int cust_id = Int32.Parse(Request.QueryString["custID"].ToString());
            UpdateCustomer(cust_id);
        }
    }

    private void BindDDLCountry(int countryID)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sp_GetCountry";
        obj.AddParam("@country_id", countryID);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            DDLCountry.DataTextField = "country_name";
            DDLCountry.DataValueField = "country_id";
            DDLCountry.DataSource = dr;
            DDLCountry.DataBind();
        }
    }
    private void BindDDLState(int countryID)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sp_GetStates";
        obj.AddParam("@country_id", countryID);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            DDLState.DataTextField = "state_Name";
            DDLState.DataValueField = "state_id";
            DDLState.DataSource = dr;
            DDLState.DataBind();
        }
    }

    private void BindDDLSCountry(int countryID)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sp_GetCountry";
        obj.AddParam("@country_id", countryID);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            DDLSCountry.DataTextField = "country_name";
            DDLSCountry.DataValueField = "country_id";
            DDLSCountry.DataSource = dr;
            DDLSCountry.DataBind();
        }
    }
    private void BindDDLSState(int countryID)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sp_GetStates";
        obj.AddParam("@country_id", countryID);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            DDLSState.DataTextField = "state_Name";
            DDLSState.DataValueField = "state_id";
            DDLSState.DataSource = dr;
            DDLSState.DataBind();
        }
    }

    private void GetCustomer(int cust_id)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetRegisterdCust";
        obj.AddParam("@CustomerID", cust_id);
        dr = obj.ExecuteReader();

        if (dr.Read())
        {
            txtBCompanyName.Text = dr["CompanyName"].ToString();
            //txtSecondPhone1.Text = dr["BillSecondPhone1"].ToString();
            //txtSecondPhone2.Text = dr["BillSecondPhone2"].ToString();
            //txtSecondPhone3.Text = dr["BillSecondPhone3"].ToString();

            //txtSecondSPhone1.Text = dr["SecondSPhone1"].ToString();
            //txtSecondSPhone2.Text = dr["SecondSPhone2"].ToString();
            //txtSecondSPhone3.Text = dr["SecondSPhone3"].ToString();          



            DDLTitle.SelectedValue = dr["Title"].ToString();
            txtFName.Text = dr["FirstName"].ToString();
            txtLNmae.Text = dr["LastName"].ToString();           
            txtAddress1.Text = dr["BillAddress1"].ToString();
            txtAddress2.Text = dr["BillAddress2"].ToString();
            txtZip.Text = dr["BillZip"].ToString();
            txtCity.Text = dr["BillCity"].ToString();
           
            //DDLCountry.SelectedValue = dr["BillCountry"].ToString();
            //DDLState.SelectedValue = dr["BillState"].ToString();

            txtBCountry.Text = dr["BillCountry"].ToString();
            txtBState.Text = dr["BillState"].ToString();
            
            txtPhone1.Text = dr["BillPhone1"].ToString();
            txtPhone2.Text = dr["BillPhone2"].ToString();
            txtPhone3.Text = dr["BillPhone3"].ToString();
            //txtFax1.Text = dr["BillFax1"].ToString();
            //txtFax2.Text = dr["BillFax2"].ToString();
            //txtFax3.Text = dr["BillFax3"].ToString();
            txtMobile1.Text = dr["BillMobile1"].ToString();
            txtMobile2.Text = dr["BillMobile2"].ToString();

            txtSFname.Text = dr["sFName"].ToString();
            txtSLName.Text = dr["sLName"].ToString();            
            txtSAddress1.Text = dr["sAddress1"].ToString();
            txtSAddress2.Text = dr["sAddress2"].ToString();
            txtSZip.Text = dr["sZip"].ToString();
            txtSCity.Text = dr["sCity"].ToString();
            
            //DDLSCountry.SelectedValue = dr["sCountry"].ToString();
            //DDLSState.SelectedValue = dr["sState"].ToString();

            txtSCountry.Text = dr["sCountry"].ToString();
            txtSState.Text = dr["sState"].ToString();
           
            txtSPhone1.Text = dr["sPhone1"].ToString();
            txtSPhone2.Text = dr["sPhone2"].ToString();
            txtSPhone3.Text = dr["sPhone3"].ToString();
            //txtSFax1.Text = dr["sFax1"].ToString();
            //txtSFax2.Text = dr["sFax2"].ToString();
            //txtSFax3.Text = dr["sFax3"].ToString();
            txtSMobile1.Text = dr["sMobile1"].ToString();
            txtSMobile2.Text = dr["sMobile2"].ToString();
            txtEmailId.Text = dr["Email"].ToString();
           string status= dr["Status"].ToString();

           string mailing = dr["mailing"].ToString();
           if (mailing == "Yes")
           {
               radBtnMailing.SelectedIndex = 0;
           }
           else
           {
               radBtnMailing.SelectedIndex = 1;
           }

          
           // if (status == "True")
           //{
           //    ckpublish.Checked = true;
           //}
           //else
           //{
           //    ckpublish.Checked = false;
           //}
            
            string strShippSameAsBill = dr["ShippAddSameAsBillAdd"].ToString();
            if (strShippSameAsBill == "True")
            {
                CheckBox1.Checked = true;
            }
            else
            {
                CheckBox1.Checked = false;
            }
        }
    }

    int conid = 0;
    int stid = 0;
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
       // conid = Int32.Parse(DDLCountry.SelectedValue.ToString());
       // stid = Int32.Parse(DDLState.SelectedValue.ToString());

        txtSCompanyName.Text = txtBCompanyName.Text.Trim().ToString();
        txtSFname.Text = txtFName.Text.Trim().ToString();
        txtSLName.Text = txtLNmae.Text.Trim().ToString();        
        txtSAddress1.Text = txtAddress1.Text.Trim().ToString();
        txtSAddress2.Text = txtAddress2.Text.Trim().ToString();
        txtSZip.Text = txtZip.Text.Trim().ToString();

        //DDLSCountry.SelectedValue = conid.ToString();
        //DDLSState.SelectedValue = stid.ToString();

        txtSCountry.Text = txtBCountry.Text;
        txtSState.Text = txtBState.Text;

        txtSCity.Text = txtCity.Text.Trim().ToString();

        txtSPhone1.Text = txtPhone1.Text.Trim().ToString();
        txtSPhone2.Text = txtPhone2.Text.Trim().ToString();
        txtSPhone3.Text = txtPhone3.Text.Trim().ToString();

        //txtSecondSPhone1.Text = txtSecondPhone1.Text.Trim().ToString();
        //txtSecondSPhone2.Text = txtSecondPhone2.Text.Trim().ToString();
        //txtSecondSPhone3.Text = txtSecondPhone3.Text.Trim().ToString();

        //txtSFax1.Text = txtFax1.Text.Trim().ToString();
        //txtSFax2.Text = txtFax2.Text.Trim().ToString();
        //txtSFax3.Text = txtFax3.Text.Trim().ToString();

        txtSMobile1.Text = txtMobile1.Text.Trim().ToString();
        txtSMobile2.Text = txtMobile2.Text.Trim().ToString();
    }

    private void UpdateCustomer(int cust_id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateCustomer";
        obj.AddParam("@CustomerID", cust_id);
        obj.AddParam("@Title", DDLTitle.SelectedValue.ToString());
        obj.AddParam("@CompanyName", txtBCompanyName.Text.Trim().ToString());
        obj.AddParam("@FirstName", txtFName.Text.ToString());
        obj.AddParam("@LastName", txtLNmae.Text.ToString());       
        obj.AddParam("@BillAddress1", txtAddress1.Text.ToString());
        obj.AddParam("@BillAddress2", txtAddress2.Text.ToString());
        obj.AddParam("@BillZip", txtZip.Text.ToString());
        obj.AddParam("@BillCity", txtCity.Text.ToString());

        //obj.AddParam("@BillCountryId", DDLCountry.SelectedValue.ToString());
        //obj.AddParam("@BillCountry", DDLCountry.SelectedItem.ToString());
        //obj.AddParam("@BillStateId", DDLState.SelectedValue.ToString());
        //obj.AddParam("@BillState", DDLState.SelectedItem.ToString());


        obj.AddParam("@BillCountryId", "");
        obj.AddParam("@BillCountry", txtBCountry.Text.Trim().ToString());
        obj.AddParam("@BillStateId", "");
        obj.AddParam("@BillState", txtBState.Text.Trim().ToString());

        obj.AddParam("@BillPhone1", txtPhone1.Text.ToString());
        obj.AddParam("@BillPhone2", txtPhone2.Text.ToString());
        obj.AddParam("@BillPhone3", txtPhone3.Text.ToString());

        //obj.AddParam("@BillSecondPhone1", txtSecondPhone1.Text.Trim().ToString());
        //obj.AddParam("@BillSecondPhone2", txtSecondPhone2.Text.Trim().ToString());
        //obj.AddParam("@BillSecondPhone3", txtSecondPhone3.Text.Trim().ToString());
        //obj.AddParam("@BillFax1", txtFax1.Text.ToString());
        //obj.AddParam("@BillFax2", txtFax2.Text.ToString());
        //obj.AddParam("@BillFax3", txtFax3.Text.ToString());

        obj.AddParam("@BillSecondPhone1", "");
        obj.AddParam("@BillSecondPhone2", "");
        obj.AddParam("@BillSecondPhone3", "");
        obj.AddParam("@BillFax1", "");
        obj.AddParam("@BillFax2", "");
        obj.AddParam("@BillFax3", "");



        obj.AddParam("@BillMobile1", txtMobile1.Text.ToString());
        obj.AddParam("@BillMobile2", txtMobile2.Text.ToString());

        obj.AddParam("@sCompanyName", txtSCompanyName.Text.Trim().ToString());
        obj.AddParam("@sFName", txtSFname.Text.ToString());
        obj.AddParam("@sLName", txtSLName.Text.ToString());        
        obj.AddParam("@sAddress1", txtSAddress1.Text.ToString());
        obj.AddParam("@sAddress2", txtSAddress2.Text.ToString());
        obj.AddParam("@sZip", txtSZip.Text.ToString());
        obj.AddParam("@sCity", txtSCity.Text.ToString());
       
        //obj.AddParam("@sCountryId", DDLCountry.SelectedValue.ToString());
        //obj.AddParam("@sCountry", DDLCountry.SelectedItem.ToString());
        //obj.AddParam("@sStateId", DDLState.SelectedValue.ToString());
        //obj.AddParam("@sState", DDLState.SelectedItem.ToString());


        obj.AddParam("@sCountryId", "");
        obj.AddParam("@sCountry", txtSCountry.Text.Trim().ToString());
        obj.AddParam("@sStateId", "");
        obj.AddParam("@sState", txtSState.Text.Trim().ToString());

        obj.AddParam("@sPhone1", txtSPhone1.Text.ToString());
        obj.AddParam("@sPhone2", txtSPhone2.Text.ToString());
        obj.AddParam("@sPhone3", txtSPhone3.Text.ToString());

        //obj.AddParam("@SecondSPhone1", txtSecondSPhone1.Text.Trim().ToString());
        //obj.AddParam("@SecondSPhone2", txtSecondSPhone2.Text.Trim().ToString());
        //obj.AddParam("@SecondSPhone3", txtSecondSPhone3.Text.Trim().ToString());
        //obj.AddParam("@sFax1", txtSFax1.Text.ToString());
        //obj.AddParam("@sFax2", txtSFax2.Text.ToString());
        //obj.AddParam("@sFax3", txtSFax3.Text.ToString());


        obj.AddParam("@SecondSPhone1", "");
        obj.AddParam("@SecondSPhone2", "");
        obj.AddParam("@SecondSPhone3", "");
        obj.AddParam("@sFax1", "");
        obj.AddParam("@sFax2", "");
        obj.AddParam("@sFax3", "");


        obj.AddParam("@sMobile1", txtSMobile1.Text.ToString());
        obj.AddParam("@sMobile2", txtSMobile2.Text.ToString());

        obj.AddParam("@Email", txtEmailId.Text.ToString());

        obj.AddParam("@mailing", radBtnMailing.SelectedItem.Text.Trim());
        obj.AddParam("@Status", 1);

        //if (ckpublish.Checked)
        //{
        //    obj.AddParam("@Status", 1);
        //}
        //else
        //{
        //    obj.AddParam("@Status", 0);
        //}
      

        if (CheckBox1.Checked)
        {
            obj.AddParam("@ShippAddSameAsBillAdd", "True");
        }
        else
        {
            obj.AddParam("@ShippAddSameAsBillAdd", "False");
        }


        int exe = obj.ExecuteNonQuery();

        if (exe > 0)
        {
            //lblMsg.Text = "Customer Information Updated Successfully";

            showmsg("Customer Information Updated Successfully", "ViewCustomer.aspx");

        }

    }

    protected void btnUpdate1_Click(object sender, EventArgs e)
    {
        int cust_id = Int32.Parse(Request.QueryString["custID"].ToString());
        UpdateCustomer(cust_id);
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
}
