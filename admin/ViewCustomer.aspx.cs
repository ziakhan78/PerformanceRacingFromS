using System;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net;
using Telerik.Web.UI;

public partial class Admin_ViewCustomer : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                //rbtnSearch.ClearSelection();

                bool b;
                if (b = true)
                {
                    Session["SearchField"] = null;
                    Session["SearchBy"] = null;                   
                    Session["SearchByAlfhabetic"] = null;

                    b = false;
                }

                lblError.Visible = false;
                permission();
                ManageGrid();
            }
        }
        else
        {
            Session.Abandon();
            Server.Transfer("Default.aspx");
        }
    }

    private void BindGrid()
    {
        DataTable dt;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_ViewCustomer";

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            txtName.Text = "";
            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }

    }      
    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        int custID = 0;
        if (e.CommandName == "Delete")
        {
            custID = Int32.Parse(e.CommandArgument.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteCustomer";
            obj.AddParam("@CustomerID", custID);

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                ManageGrid();
            }
        }
    }
    //protected void btnLoginInfo_Click(object sender, EventArgs e)
    //{
    //    int cid = 0;
    //    string email, Pass = "";

    //    foreach (GridViewRow item in RadGrid1.Items)
    //    {
    //        CheckBox chkbox = (CheckBox)item.FindControl("chkActive");
    //        Label lblcid = (Label)item.FindControl("lblcid");
    //        Label lblEmail = (Label)item.FindControl("lblEmail");
    //        Label lblPassword = (Label)item.FindControl("lblPassword");


    //        if (chkbox.Checked)
    //        {
    //            cid = Int32.Parse(lblcid.Text.ToString());
    //            email = lblEmail.Text.ToString();
    //            Pass = lblPassword.Text.ToString();
    //           // SendMailtoClient(email, Pass);
    //        }
    //    }
    //}  


    protected void btnSendLoginPass_Click(object sender, EventArgs e)
    {
        int pid = 0;
        string email, Pass = "";
        foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
        {
            try
            {
                CheckBox chkbox = (CheckBox)item.FindControl("chkActive");
                Label lblcid = (Label)item.FindControl("lblcid");
                Label lblEmail = (Label)item.FindControl("lblEmail");
                if (chkbox.Checked)
                {
                    pid = Int32.Parse(lblcid.Text.ToString());
                    email = lblEmail.Text.ToString();
                    if (email != "")
                    {
                        try
                        {
                            DBconnection con = new DBconnection();
                            con.SetCommandQry = "select Password from View_Customers where  email='" + email + "' and status='True'";
                            DataTable dt = con.ExecuteTable();
                            Pass = dt.Rows[0]["Password"].ToString();


                            SendMailtoClient(email, Pass);

                        }
                        catch { }
                    }
                }
                chkbox.Checked = false;
            }
            catch { }

        }
    }


    private void SendMailtoClient(string email, string password)
    {
        try
        {

            MailMessage mail = new MailMessage();
            mail.To.Add(email);

            mail.From = new MailAddress("mail@performanceracing.in");
            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.Subject = "Performance Racing Customer Login Information";


            mail.IsBodyHtml = true;
            string PathVal = Server.MapPath("~");
            string ReadFileName = PathVal + "/Mail/LoginPassword.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(ReadFileName);

            strMessage = sr1.ReadToEnd();
            strMessage = strMessage.Replace("xxxLoginID", email);
            strMessage = strMessage.Replace("xxxPassword", password);


            mail.Body = strMessage;
            sr1.Close();

            // Create the credentials to login to the gmail account associated with my custom domain 

            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("mail@performanceracing.in", "to5X6g1?");
            emailClient.Port = 2525;
            emailClient.Host = "mail.performanceracing.in";
            emailClient.EnableSsl = false;
            emailClient.Send(mail);


            string jv = "<script>alert('Mail has been sent successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }



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
    public void permission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_ViewCustomer";

            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();


            if (dt.Rows.Count > 0)
            {
                string st = Session["Edit"].ToString();
                if (Convert.ToBoolean(Session["Edit"]) == false)
                    RadGrid1.Columns[4].Visible = false;

                if (Convert.ToBoolean(Session["Delete"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 1].Visible = false;
            }
        }
        catch (Exception ex)
        {
            string ss = ex.Message;
        }

    }

    // search Start 

    #region Search Start

    protected void LnkA_Click(object sender, EventArgs e)
    {
        string val = "A";
        SearchByAlphabet(val);
    }
    protected void LnkB_Click(object sender, EventArgs e)
    {
        string val = "B";
        SearchByAlphabet(val);
    }
    protected void LnkC_Click(object sender, EventArgs e)
    {
        string val = "C";
        SearchByAlphabet(val);
    }
    protected void LnkD_Click(object sender, EventArgs e)
    {
        string val = "D";
        SearchByAlphabet(val);
    }
    protected void LnkE_Click(object sender, EventArgs e)
    {
        string val = "E";
        SearchByAlphabet(val);
    }
    protected void LnkF_Click(object sender, EventArgs e)
    {
        string val = "F";
        SearchByAlphabet(val);
    }
    protected void LnkG_Click(object sender, EventArgs e)
    {
        string val = "G";
        SearchByAlphabet(val);
    }
    protected void LnkH_Click(object sender, EventArgs e)
    {
        string val = "H";
        SearchByAlphabet(val);
    }
    protected void LnkI_Click(object sender, EventArgs e)
    {
        string val = "I";
        SearchByAlphabet(val);
    }
    protected void LnkJ_Click(object sender, EventArgs e)
    {
        string val = "J";
        SearchByAlphabet(val);
    }
    protected void LnkK_Click(object sender, EventArgs e)
    {
        string val = "K";
        SearchByAlphabet(val);
    }
    protected void LnkL_Click(object sender, EventArgs e)
    {
        string val = "L";
        SearchByAlphabet(val);
    }
    protected void LnkM_Click(object sender, EventArgs e)
    {
        string val = "M";
        SearchByAlphabet(val);
    }
    protected void LnkN_Click(object sender, EventArgs e)
    {
        string val = "N";
        SearchByAlphabet(val);
    }
    protected void LnkO_Click(object sender, EventArgs e)
    {
        string val = "O";
        SearchByAlphabet(val);
    }
    protected void LnkP_Click(object sender, EventArgs e)
    {
        string val = "P";
        SearchByAlphabet(val);
    }
    protected void LnkQ_Click(object sender, EventArgs e)
    {
        string val = "Q";
        SearchByAlphabet(val);
    }
    protected void LnkR_Click(object sender, EventArgs e)
    {
        string val = "R";
        SearchByAlphabet(val);
    }
    protected void LnkS_Click(object sender, EventArgs e)
    {
        string val = "S";
        SearchByAlphabet(val);
    }
    protected void LnkT_Click(object sender, EventArgs e)
    {
        string val = "T";
        SearchByAlphabet(val);
    }
    protected void LnkU_Click(object sender, EventArgs e)
    {
        string val = "U";
        SearchByAlphabet(val);
    }
    protected void LnkV_Click(object sender, EventArgs e)
    {
        string val = "V";
        SearchByAlphabet(val);
    }
    protected void LnkW_Click(object sender, EventArgs e)
    {
        string val = "W";
        SearchByAlphabet(val);
    }
    protected void LnkX_Click(object sender, EventArgs e)
    {
        string val = "X";
        SearchByAlphabet(val);
    }
    protected void LnkY_Click(object sender, EventArgs e)
    {
        string val = "Y";
        SearchByAlphabet(val);
    }
    protected void LnkZ_Click(object sender, EventArgs e)
    {
        string val = "Z";
        SearchByAlphabet(val);
    }
    protected void Linkbutton1_Click(object sender, EventArgs e)
    {
        string val = "ALL";
        SearchByAlphabet(val);
    }
   

    #endregion


    private void SearchByAlphabet(string title)
    {
       // rbtnSearch.ClearSelection();       

        Session["SearchField"] = null;
        Session["SearchBy"] = null;      
        Session["SearchByAlfhabetic"] = title;

        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabetCust";
        obj.AddParam("@FirstName", title);

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["SearchField"] = null;
        Session["SearchBy"] = null;       
        Session["SearchByAlfhabetic"] = null;

        string searchField = "";
        int i = int.Parse(rbtnSearch.SelectedValue.ToString());
        if (i == 0)
        {
            searchField = "billFName";
        }
        if (i == 1)
        {
            searchField = "email";
        }

        if (i == 2)
        {
            searchField = "billMobile";
        }

        string val = txtName.Text.Trim().ToString();

        Session["SearchField"] = searchField;
        Session["SearchBy"] = val;
        SearchGrid(searchField, val);
    }


    private void SearchGrid(string searchField, string pname)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_Customers  where " + searchField + " like  '%'+'" + pname + "'+ '%' ";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtName.Text = "";
            lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    protected void RadGrid1_SortCommand(object source, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        ManageGrid();
    }
    private void ManageGrid()
    {
        try
        {
            if (Session["SearchField"] != null)
            {
                SearchGrid(Session["SearchField"].ToString(), Session["SearchBy"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }

            else if (Session["SearchByAlfhabetic"] != null)
            {
                SearchByAlphabet(Session["SearchByAlfhabetic"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }

            else
            {
                BindGrid();
            }
        }
        catch
        {
            BindGrid();
        }
    }
    protected void RadGrid1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
    {
        ManageGrid();
    }
   
}

