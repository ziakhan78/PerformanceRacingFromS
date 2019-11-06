using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net;
using Telerik.Web.UI;

public partial class forgot_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DBconnection con = new DBconnection();
            DataTable obj = new DataTable();
            con.SetCommandSP = "z_dealer_forgot_password";
            con.AddParam("@emailid", txtEmail.Text.Trim().ToString());

            obj = con.ExecuteTable();
            if (obj.Rows.Count > 0)
            {
                //string email_verification_code = GetCode();

                string name = obj.Rows[0]["Name"].ToString();
                string username = obj.Rows[0]["EmailId"].ToString();
                string password = obj.Rows[0]["Password"].ToString();
                string code = obj.Rows[0]["email_verification_code"].ToString();

                SendMailtoClient(name, txtEmail.Text.Trim(), username, password, code);

            }
            else
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
        }
    }
    private void SendMailtoClient(string name, string emailid, string username, string password, string code)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(emailid);         
            //mail.To.Add("info@performanceracing.in");
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.From = new MailAddress("mail@performanceracing.in");

            mail.Subject = "Your Request from performanceracing.in";

            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            string ReadFileName = PathVal + "/Mail/forgot_password.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();

            strMessage = strMessage.Replace("xxxCode", code);
            strMessage = strMessage.Replace("xxxName", name);
            strMessage = strMessage.Replace("xxxUsername", username);
            strMessage = strMessage.Replace("xxxPassword", password);



            mail.Body = strMessage;
            sr1.Close();

            //Create the credentials to login to the gmail account associated with my custom domain 

            //SmtpClient emailClient = new SmtpClient();
            //emailClient.Credentials = new NetworkCredential("mail@performanceracing.in", "T8p%3fh#9");
            //emailClient.Port = 587;
            //emailClient.Host = "smtp.zoho.com";
            //emailClient.EnableSsl = true;
            //emailClient.Send(mail);

            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("mail@performanceracing.in", "D+85Hy9V*");
            emailClient.Port = 587;
            emailClient.Host = "smtp.zoho.com";
            emailClient.EnableSsl = true;
            emailClient.Send(mail);


            Panel1.Visible = false;
            Panel2.Visible = true;

            //string jv = "<script>alert('Mail has been sent successfully');</script>";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }
    }

    public string GetCode()
    {
        string guidResult = System.Guid.NewGuid().ToString();
        guidResult = guidResult.Replace("-", string.Empty);
        return guidResult;
    }
    protected void CVEmail_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "select EmailId from View_DealersContacts where EmailId='" + txtEmail.Text.Trim().ToString() + "' and is_email_verified='True'";
            object res = obj.ExecuteScalar();
            if (res == null)
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
