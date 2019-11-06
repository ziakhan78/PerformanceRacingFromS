using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net;

public partial class admin_PasswordRecovery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }    
    protected void cvisvaliduser_ServerValidate(object source, ServerValidateEventArgs args)
    {
        MailMessage mail = new MailMessage();
        try
        {
            DBconnection con = new DBconnection();
            con.SetCommandSP = "Sp_ForgotPasswordAdmin";
            con.AddParam("@username", txtuname.Text.Trim()); 
            con.AddParam("@emailid", txtemail.Text.Trim());

            DataTable dt = new DataTable();
            dt = con.ExecuteTable();
            
            if (dt.Rows.Count>0)
            {
                string pass = dt.Rows[0]["Password"].ToString();
                    
                args.IsValid = true;                
                try
                {
                    mail.IsBodyHtml = true;
                    string email = txtemail.Text;                    
                    mail.To.Add(email);
                    mail.From = new MailAddress("admin@rcbp.org.in");
                    mail.Subject = "RI Dist.3140 Administration Password Recovery";
                    string msg = "<p>Dear User,</p><p>Your Login Information is: </p>";
                    msg += "<p> Username: " + txtuname.Text + "<br />";
                    msg += "</n> Password: " + pass + "<br />";
                    msg += "<p>Kindly keep the above information securely to prevent misuse.</p><p>Thanking You,<br />Admin Team <br />RI Dist.3140</p>";
                    mail.Body = msg;

                    SmtpClient emailClient = new SmtpClient();

                    emailClient.Credentials = new NetworkCredential("admin@rcbp.org.in", "omshanti2012");
                    emailClient.Port = 587;
                    emailClient.Host = "smtp.gmail.com";
                    emailClient.EnableSsl = true;
                    emailClient.Send(mail);

                    //lblmsg.Text = "Your Password has been sent to your emailid .";
                    showmsg("Your Password has been sent to your email-id .");
                }
                catch (Exception exp)
                {
                    lblmsg.Text = "Error : " + exp.Message;
                    lblmsg.Visible = true;
                }

            }
            else
            {
                args.IsValid = false;
            }
        }
        catch { args.IsValid = false; }
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
    public void showmsg(string msg)
    {
        try
        {
            lblmsg.Visible = true;
            lblmsg.Text = msg;
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
    protected void btnok_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            txtemail.Text = "";
            txtuname.Text = "";
         
        }
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtemail.Text = "";
        txtuname.Text = "";
        txtuname.Focus();
    }
}
