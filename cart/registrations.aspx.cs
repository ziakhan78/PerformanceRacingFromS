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

public partial class cart_registrations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        // lblBcomp.Visible = false;
        // txtBCompanyName.Visible = false;
        //lblSComp.Visible = false;
        // txtSCompanyName.Visible = false;

        //int countryID = 0;
        if (!IsPostBack)
        {
            compDiv.Visible = false;
            rfvCompName.Enabled = false;
            rfvGstin.Enabled = false;

            BindYears();
            chkShippAsBill.Checked = false;
            //shippAddress.Visible = true;
            btnAdd.Visible = true;
            btnUpdate.Visible = false;

            try
            {
                txtFName.Text = Session["Fname"].ToString();
                txtLName.Text = Session["Lname"].ToString();
                txtEmailId.Text = Session["EmailId"].ToString();

                txtMobileCc.Text = Session["MobileCC"].ToString();//"+91";
                txtMobile.Text = Session["Mobile"].ToString();
               
            }
            catch { }


            BindDDLCountry();
            BindDDLSCountry();

            if (Session["CustomerID"] != null)
            {
                btnAdd.Visible = false;
                btnUpdate.Visible = true;
               // shippAddress.Visible = true;
                chkShippAsBill.Visible = false;
                GetCustomerDetails();
            }
        }
    }
    private void BindYears()
    {
        try
        {
            int dt = DateTime.Now.Year;           

            for (Int32 i = Convert.ToInt32(dt); i >= 1990; i--)
            {
              
                DDLYears.Items.Add(i.ToString());
            }

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    protected void GetCustomerDetails()
    {
        try
        {
            if (Session["CustomerID"] != null)
            {
                DataTable dt = new DataTable();
                CustomersBLL obj = new CustomersBLL();
                obj.Id = int.Parse(Session["CustomerID"].ToString());
                dt = obj.GetCustomer();

                if (dt.Rows.Count > 0)
                {

                    string type= dt.Rows[0]["Customer_Type"].ToString();
                    if (type == "Individual")
                    {
                        rbtnCustType.SelectedIndex = 0;
                        compDiv.Visible = false;
                        rfvCompName.Enabled = false;
                        rfvGstin.Enabled = false;
                    }
                    else
                    {
                        rbtnCustType.SelectedIndex = 1;
                        compDiv.Visible = true;
                        rfvCompName.Enabled = true;
                        rfvGstin.Enabled = true;
                    }
                  
                    txtCompName.Text = dt.Rows[0]["Company_Name"].ToString();
                    txtGstin.Text = dt.Rows[0]["GSTIN"].ToString();

                    txtFName.Text = dt.Rows[0]["billFName"].ToString();
                    txtLName.Text = dt.Rows[0]["billLName"].ToString();
                    rbtnGender.SelectedItem.Text = dt.Rows[0]["gender"].ToString();
                    //txtFName.Text = dt.Rows[0]["dob"].ToString();
                    //txtFName.Text = dt.Rows[0]["anniversary"].ToString();
                    txtAddress1.Text = dt.Rows[0]["billAddress1"].ToString();
                    txtAddress2.Text = dt.Rows[0]["billAddress2"].ToString();
                    txtCity.Text = dt.Rows[0]["billCity"].ToString();
                    txtZip.Text = dt.Rows[0]["billZip"].ToString();
                    txtMobileCc.Text = dt.Rows[0]["billMobileCC"].ToString();
                    txtMobile.Text = dt.Rows[0]["billMobile"].ToString();
                    txtPhoneCc.Text = dt.Rows[0]["billPhoneCC"].ToString();
                    txtPhoneAc.Text = dt.Rows[0]["billPhoneAC"].ToString();
                    txtPhone.Text = dt.Rows[0]["billPhone"].ToString();
                    txtEmailId.Text = dt.Rows[0]["email"].ToString();
                    // txtpa.Text = dt.Rows[0]["password"].ToString();
                    int countryId = int.Parse(dt.Rows[0]["billCountryId"].ToString());
                    DDLCountry.SelectedValue = countryId.ToString();
                    BindDDLState(countryId);
                    DDLState.SelectedValue = dt.Rows[0]["billStateId"].ToString();

                    //txtBState.Text = dt.Rows[0]["billState"].ToString();

                    //string strIsBillAsShip = dt.Rows[0]["shippAddSameAsBillAdd"].ToString();

                    //if (strIsBillAsShip == "Checked")
                    //{
                    //    chkShippAsBill.Checked = true;
                    //    shippAddress.Visible = true;
                    //}
                    //else
                    //{
                    //    chkShippAsBill.Checked = false;
                    //    shippAddress.Visible = false;
                    //}

                    txtSFname.Text = dt.Rows[0]["sFName"].ToString();
                    txtSLName.Text = dt.Rows[0]["sLName"].ToString();
                    txtSAddress1.Text = dt.Rows[0]["sAddress1"].ToString();
                    txtSAddress2.Text = dt.Rows[0]["sAddress2"].ToString();
                    txtSCity.Text = dt.Rows[0]["sCity"].ToString();
                    txtSZip.Text = dt.Rows[0]["sZip"].ToString();
                    txtSMobileCc.Text = dt.Rows[0]["sMobileCc"].ToString();
                    txtSMobile.Text = dt.Rows[0]["sMobile"].ToString();
                    txtSPhoneCc.Text = dt.Rows[0]["sPhoneCc"].ToString();
                    txtSPhoneAc.Text = dt.Rows[0]["sPhoneAc"].ToString();
                    txtSPhone.Text = dt.Rows[0]["sPhone"].ToString();

                    int sCountryId = int.Parse(dt.Rows[0]["sCountryId"].ToString());
                    DDLSCountry.SelectedValue = sCountryId.ToString();

                    BindDDLSState(sCountryId);
                    DDLSState.SelectedValue = dt.Rows[0]["sStateId"].ToString();
                }
            }
        }
        catch { }
    }
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
        obj.CustomerType = rbtnCustType.SelectedItem.Text.Trim().ToString();
        obj.CompanyName = txtCompName.Text.Trim().ToString();
        obj.GSTIN = txtGstin.Text.Trim().ToString();

        obj.BillFName = txtFName.Text.Trim().ToString();
        obj.BillLName = txtLName.Text.Trim().ToString();
        obj.Gender = rbtnGender.SelectedItem.Text.Trim().ToString();
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
            SendMailtoClient(name, txtEmailId.Text.Trim(), strEmailVerificationCode);
            string email = txtEmailId.Text.Trim().ToString();
            ShowMsg("Your account has been created. To set your password, a message has been sent to you on " + email + ".", "../cart/login.aspx");
            Reset();
        }
    }
    private void SendMailtoClient(string name, string emailid, string code)
    {
        try
        {
             MailMessage mail = new MailMessage();
            mail.To.Add(emailid);
            mail.From = new MailAddress("mail@performanceracing.in");           
            mail.Bcc.Add("zia@goradiainfotech.com");
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
            emailClient.Credentials = new NetworkCredential("mail@performanceracing.in", "D+85Hy9V*");
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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            AddCustomer();
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
        else
        {
            //shippAddress.Visible = false;
        }
    }
    private void Reset()
    {
        //txtBCompanyName.Text = "";
        // txtSCompanyName.Text = "";
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
    public void ShowMsg(string msg, string redirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + redirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
    protected void CVEmail_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVEmail.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select email from Customers_tbl where email='" + txtEmailId.Text.Trim().ToString() + "'";
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
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        UpdateCustomer();
    }
    private void UpdateCustomer()
    {
        System.Data.SqlTypes.SqlDateTime nullDate;
        nullDate = SqlDateTime.Null;

        CustomersBLL obj = new CustomersBLL();
        obj.Id = int.Parse(Session["CustomerID"].ToString());

        obj.CustomerType = rbtnCustType.SelectedItem.Text.Trim().ToString();
        obj.CompanyName = txtCompName.Text.Trim().ToString();
        obj.GSTIN = txtGstin.Text.Trim().ToString();

        obj.BillFName = txtFName.Text.Trim().ToString();
        obj.BillLName = txtLName.Text.Trim().ToString();
        obj.Gender = rbtnGender.SelectedItem.Text.Trim().ToString();
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
       // obj.Password = "abcd1234$";

        // Shipping
        string chkBillAsShip = "";
        if (chkShippAsBill.Checked == true)
        { chkBillAsShip = "Checked"; }
        else { chkBillAsShip = "UnChecked"; }

        obj.ShippAddSameAsBillAdd = chkBillAsShip;

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


        int exe = obj.UpdateCustomer();

        if (exe > 0)
        {
            Response.Redirect("../cart/viewcart.aspx");
        }
    }
    protected void DDLCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        int intCountryId = int.Parse(DDLCountry.SelectedValue.ToString());
        BindDDLState(intCountryId);
    }
    protected void DDLSCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        int intSCountryId = int.Parse(DDLSCountry.SelectedValue.ToString());
        BindDDLSState(intSCountryId);
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

    protected void rbtnCustType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string type = rbtnCustType.SelectedItem.Text;
        if(type== "Individual")
        {
            compDiv.Visible = false;
            rfvCompName.Enabled = false;
            rfvGstin.Enabled = false;
        }
        else
        {
            compDiv.Visible = true;
            rfvCompName.Enabled = true;
            rfvGstin.Enabled = true;
        }
    }
}
