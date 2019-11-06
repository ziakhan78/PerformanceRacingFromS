using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net;
using Telerik.Web.UI;

public partial class Admin_AddCustomer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // BindYears();
        chkShippAsBill.Checked = false;
        if (!IsPostBack)
        {
            BindDDLCountry();
            BindDDLSCountry();
        }
    }

    //private void BindYears()
    //{
    //    try
    //    {
    //        int dt = DateTime.Now.Year;

    //        for (Int32 i = Convert.ToInt32(dt); i >= 1990; i--)
    //        {

    //            DDLYears.Items.Add(i.ToString());
    //        }

    //    }
    //    catch (Exception E)
    //    {
    //        Response.Write(E.Message.ToString());
    //    }
    //}
    private void BindDDLCountry()
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetCountry1";
        //obj.AddParam("@country_id", countryID);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            DDLCountry.DataTextField = "country_name";
            DDLCountry.DataValueField = "country_id";
            DDLCountry.DataSource = dr;
            DDLCountry.DataBind();
            DDLCountry.Items.Insert(0, "Select");
        }
    }
    private void BindDDLState(int countryID)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetStates";
        obj.AddParam("@country_id", countryID);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            DDLState.DataTextField = "state_Name";
            DDLState.DataValueField = "state_id";
            DDLState.DataSource = dr;
            DDLState.DataBind();
        }
        else
        {
            DDLState.Items.Clear();
            DDLState.Items.Insert(0, "Select");
        }
    }
    private void BindDDLSCountry()
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetCountry1";
        // obj.AddParam("@country_id", countryID);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            DDLSCountry.DataTextField = "country_name";
            DDLSCountry.DataValueField = "country_id";
            DDLSCountry.DataSource = dr;
            DDLSCountry.DataBind();
            DDLSCountry.Items.Insert(0, "Select");
        }
    }
    private void BindDDLSState(int countryID)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_GetStates";
        obj.AddParam("@country_id", countryID);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            DDLSState.DataTextField = "state_Name";
            DDLSState.DataValueField = "state_id";
            DDLSState.DataSource = dr;
            DDLSState.DataBind();

        }
        else
        {
            DDLSState.Items.Clear();
            DDLSState.Items.Insert(0, "Select");
        }
    }
    string countryName = "";
    string stateName = "";
    int countryId = 0;
    int stateId = 0;
    private void AddCustomer()
    {
        System.Data.SqlTypes.SqlDateTime nullDate;
        nullDate = SqlDateTime.Null;

        /************Code for find IP address of user's machine**********/
        string ipaddress;
        // Look for a proxy address first
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        // If there is no proxy, get the standard remote address
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        /***************************************************************/


        string strEmailVerificationCode = GetRandomCodeUsingGuid();
        string strPassword = GetRandomPasswordUsingGuid();


        CustomersBLL obj = new CustomersBLL();
        obj.BillFName = txtFName.Text.Trim().ToString();
        obj.BillLName = txtLName.Text.Trim().ToString();
        obj.Gender = "";// rbtnGender.SelectedItem.Text.Trim().ToString();
        try
        {
            obj.Dob = nullDate;
        }
        catch { obj.Dob = nullDate; }

        try
        {
            obj.Anniversary = nullDate;
        }
        catch { obj.Anniversary = nullDate; }

        obj.BillAddress1 = txtAddress1.Text.Trim().ToString();
        obj.BillAddress2 = txtAddress2.Text.Trim().ToString();
        obj.BillCity = txtCity.Text.Trim().ToString();
        obj.BillZip = txtZip.Text.Trim().ToString();

        obj.BillStateId = int.Parse(DDLState.SelectedValue.ToString());
        obj.BillCountryId = int.Parse(DDLCountry.SelectedValue.ToString());

        obj.BillMobileCC = txtMobileCc.Text.Trim().ToString();
        obj.BillMobile = txtMobile.Text.Trim().ToString();
        obj.BillPhoneCC = txtPhoneCc.Text.Trim().ToString();
        obj.BillPhoneAC = txtPhoneAc.Text.Trim().ToString();
        obj.BillPhone = txtPhone.Text.Trim().ToString();
        obj.Email = txtEmailId.Text.Trim().ToString();
        obj.EmailVerificationCode = strEmailVerificationCode;
        obj.Password = strPassword;

        // Shipping
        string chkBillAsShip = "";
        if (chkShippAsBill.Checked == true)
        {
            chkBillAsShip = "Checked";
            obj.SFName = txtFName.Text.Trim().ToString();
            obj.SLName = txtLName.Text.Trim().ToString();
            obj.SAddress1 = txtAddress1.Text.Trim().ToString();
            obj.SAddress2 = txtAddress2.Text.Trim().ToString();
            obj.SCity = txtCity.Text.Trim().ToString();
            obj.SStateId = int.Parse(DDLState.SelectedValue.ToString());
            obj.SCountryId = int.Parse(DDLCountry.SelectedValue.ToString());
            obj.SZip = txtZip.Text.Trim().ToString();
            obj.SMobileCc = txtMobileCc.Text.Trim().ToString();
            obj.SMobile = txtMobile.Text.Trim().ToString();
            obj.SPhoneCc = txtPhoneCc.Text.Trim().ToString();
            obj.SPhoneAc = txtPhoneAc.Text.Trim().ToString();
            obj.SPhone = txtPhone.Text.Trim().ToString();
        }
        else
        {
            chkBillAsShip = "UnChecked";
            obj.SFName = txtSFname.Text.Trim().ToString();
            obj.SLName = txtSLName.Text.Trim().ToString();
            obj.SAddress1 = txtSAddress1.Text.Trim().ToString();
            obj.SAddress2 = txtSAddress2.Text.Trim().ToString();
            obj.SCity = txtSCity.Text.Trim().ToString();
            obj.SStateId = int.Parse(DDLSState.SelectedValue.ToString());
            obj.SCountryId = int.Parse(DDLSCountry.SelectedValue.ToString());
            obj.SZip = txtSZip.Text.Trim().ToString();
            obj.SMobileCc = txtSMobileCc.Text.Trim().ToString();
            obj.SMobile = txtSMobile.Text.Trim().ToString();
            obj.SPhoneCc = txtSPhoneCc.Text.Trim().ToString();
            obj.SPhoneAc = txtSPhoneAc.Text.Trim().ToString();
            obj.SPhone = txtSPhone.Text.Trim().ToString();
        }

        obj.ShippAddSameAsBillAdd = chkBillAsShip;
        obj.Ipaddress = ipaddress;


        int exe = obj.AddCustomer();

        if (exe > 0)
        {
            string name = txtFName.Text.Trim() + " " + txtLName.Text.Trim();
            //SendMailtoClient(name, txtEmailId.Text.Trim(), strEmailVerificationCode);


            string email = txtEmailId.Text.Trim().ToString();
           
            // ShowMsg("Your account has been created. To set your password, a message has been sent to you on " + email + ".", "../cart/login.aspx");
            Reset();

            string jv = "<script>alert('Customer Has Been Added Successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            AddCustomer();
        }
    }
    int conid = 0;
    int stid = 0;
   
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Reset();
    }
    private void Reset()
    {
        txtAddress1.Text = "";
        txtAddress2.Text = "";
        txtCity.Text = "";
        txtEmailId.Text = "";
        txtFName.Text = "";
        txtLName.Text = "";
        txtMobileCc.Text = "";
        txtMobile.Text = "";
        txtPhoneAc.Text = "";
        txtPhone.Text = "";
        txtSAddress1.Text = "";
        txtSAddress2.Text = "";
        txtSCity.Text = "";
        txtSFname.Text = "";
        txtSLName.Text = "";
        txtSMobileCc.Text = "";
        txtSMobile.Text = "";
        txtSPhoneAc.Text = "";
        txtSPhone.Text = "";
        txtSZip.Text = "";
        txtZip.Text = "";
        chkShippAsBill.Checked = false;
        txtPhoneCc.Text = "";
        txtSPhoneCc.Text = "";
        txtSPhoneAc.Text = "";

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
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            SqlConnection cn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnString"].ToString());
            cn.Open();

            SqlCommand com2 = new SqlCommand("select count(*) from customer where email='" + args.Value + "'", cn);
            object res = com2.ExecuteScalar();
            cn.Close();
            if (Convert.ToInt32(res) == 0)
                args.IsValid = true;
            else
                args.IsValid = false;
        }
        catch
        {
            args.IsValid = false;
        }
    }
  
    protected void rbtnSAddType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnSAddType.SelectedItem.Text == "Home")
            trSCompName.Visible = false;
        else
            trSCompName.Visible = true;
    }
   
    protected void rbtnBAddType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnBAddType.SelectedItem.Text == "Home")
            trBCompName.Visible = false;
        else
            trBCompName.Visible = true;
    }

    public string GetRandomPasswordUsingGuid()
    {
        string guidResult = System.Guid.NewGuid().ToString();
        guidResult = guidResult.Replace("-", string.Empty);
        return guidResult.Substring(0, 8);
    }
    public string GetRandomCodeUsingGuid()
    {
        string guidResult = System.Guid.NewGuid().ToString();
        guidResult = guidResult.Replace("-", string.Empty);
        return guidResult;
    }
    private void SendMailtoClient(string name, string emailid, string code)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(emailid);
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.From = new MailAddress("mail@performanceracing.in");
            mail.Subject = "Registration for Performance Racing";

            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            string ReadFileName = PathVal + "/Mail/signup_verification_mail.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();
            strMessage = strMessage.Replace("xxxCode", code);

            strMessage = strMessage.Replace("xxxName", name);


            mail.Body = strMessage;
            sr1.Close();

            // Create the credentials to login to the gmail account associated with my custom domain 

            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("mail@performanceracing.in", "T8p%3fh#9");
            emailClient.Port = 587;
            emailClient.Host = "smtp.zoho.com";
            emailClient.EnableSsl = true;
            emailClient.Send(mail);
        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }
    }

    protected void chkShippAsBill_CheckedChanged(object sender, EventArgs e)
    {
        if (chkShippAsBill.Checked == true)
        {
            BindDDLSCountry();
            //int sCountryId = int.Parse(DDLSCountry.SelectedValue.ToString());
            DDLSCountry.SelectedValue = DDLCountry.SelectedValue.ToString();

            BindDDLSState(int.Parse(DDLSCountry.SelectedValue.ToString()));
            DDLSState.SelectedValue = DDLState.SelectedValue.ToString();

            txtSFname.Text = txtFName.Text.Trim().ToString();
            txtSLName.Text = txtLName.Text.Trim().ToString();
            txtSAddress1.Text = txtAddress1.Text.Trim().ToString();
            txtSAddress2.Text = txtAddress2.Text.Trim().ToString();
            txtSCity.Text = txtCity.Text.Trim().ToString();
            DDLSState.SelectedValue = DDLState.SelectedValue.ToString();
            DDLSCountry.SelectedValue = DDLCountry.SelectedValue.ToString();
            txtSZip.Text = txtZip.Text.Trim().ToString();
            txtSMobileCc.Text = txtMobileCc.Text.Trim().ToString();
            txtSMobile.Text = txtMobile.Text.Trim().ToString();
            txtSPhoneCc.Text = txtPhoneCc.Text.Trim().ToString();
            txtSPhoneAc.Text = txtPhoneAc.Text.Trim().ToString();
            txtSPhone.Text = txtPhone.Text.Trim().ToString();
        }

    }
}
