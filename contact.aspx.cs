using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SendMailtoClient();
            //  SubmitFeedback();

            reset();
        }
    }
    private void SendMailtoClient()
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(txtEmail.Text.Trim().ToString());
            mail.To.Add("sales@performanceracing.in");
            mail.Bcc.Add("zia@goradiainfotech.com");          
            mail.From = new MailAddress("mail@performanceracing.in");
            mail.Subject = "Feedback from Website";

            mail.IsBodyHtml = true;

            string PathVal = Server.MapPath("~");
            string ReadFileName = PathVal + "/mail/feedback.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();

            strMessage = strMessage.Replace("XXXname", txtName.Text.ToString());
            strMessage = strMessage.Replace("XXXcomp", txtCompany.Text.ToString());            
            strMessage = strMessage.Replace("XXXmobile", txtContactNumber.Text.ToString());
            strMessage = strMessage.Replace("XXXemail", txtEmail.Text.ToString());
            strMessage = strMessage.Replace("XXXcomments", txtMessage.Text.ToString());

            mail.Body = strMessage;
            sr1.Close();



            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("mail@performanceracing.in", "D+85Hy9V*");
            emailClient.Port = 587;
            emailClient.Host = "smtp.zoho.com";
            emailClient.EnableSsl = true;
            emailClient.Send(mail);




            string jv = "<script>alert('Thank you for submitting your feedback, we will revert back to you shortly.');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);


        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
            string jv = "<script>alert('" + ex.ToString() + "');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }
    private void reset()
    {
        txtName.Text = "";
        txtCompany.Text = "";
        txtEmail.Text = "";       
        txtContactNumber.Text = "";
        txtMessage.Text = "";
    }  
   
}