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

public partial class admin_view_dealers_contacts : System.Web.UI.Page
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
                bool b = true;
                if (b == true)
                {
                    Session["searchField"] = null;
                    Session["name"] = null;
                    Session["value"] = null;
                    b = false;
                }
                lblMsg.Visible = false;
                CheckUserPermission();
                ManageGrid();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

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

    protected void btnSearch_Click(object sender, EventArgs e)
    {

        Session["SearchField"] = null;
        Session["SearchBy"] = null;
        Session["SortBy"] = null;
        Session["SearchByAlfhabetic"] = null;

        string searchField = "";
        string val = "";
        int i = int.Parse(rbtnSearch.SelectedValue.ToString());
        if (i == 0)
        {
            searchField = "Name";
            val = txtName.Text.Trim();
        }
        if (i == 1)
        {
            searchField = "CompanyName";
            val = txtName.Text.Trim();
        }

       

        Session["SearchField"] = searchField;
        Session["SearchBy"] = val;
        SearchGrid(searchField, val);
    }
    private void SearchGrid(string searchField, string pname)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_DealersContacts  where " + searchField + " like  '%'+'" + pname + "'+ '%' ";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            // lblError.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            // lblError.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void SearchByAlphabet(string name)
    {
        Session["searchField"] = null;
        Session["value"] = null;
        Session["name"] = name;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabetDealerContacts";
        obj.AddParam("@name", name);

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
        private void ManageGrid()
    {
        try
        {

            if (Session["searchField"] != null)
            {
                SearchGrid(Session["SearchField"].ToString(), Session["SearchBy"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }

            if (Session["name"] != null)
            {
                SearchByAlphabet(Session["name"].ToString());
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
    protected void RadGrid1_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        ManageGrid();
    }
    private void BindGrid()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetDealersContactsList";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    public void CheckUserPermission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetAdminUsersList";

            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();

            if (dt.Rows.Count > 0)
            {
                string st = Session["Edit"].ToString();
                if (Convert.ToBoolean(Session["Edit"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 2].Visible = false;

                if (Convert.ToBoolean(Session["Delete"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 1].Visible = false;
            }
        }
        catch (Exception ex)
        {
            string ss = ex.Message;
        }
    }
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        int id = 0;
        if (e.CommandName == "Delete")
        {
            id = Int32.Parse(e.CommandArgument.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteDealersContacts";
            obj.AddParam("@id", id);

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }

    protected void btnSendLoginPass_Click(object sender, EventArgs e)
    {
        int pid = 0;
        string email, Pass = "";
        foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
        {
            try
            {
                CheckBox chkbox = (CheckBox)item.FindControl("chkActive");
                Label lblid = (Label)item.FindControl("lblid");
                Label lblEmail = (Label)item.FindControl("lblEmail");
                if (chkbox.Checked)
                {
                    pid = Int32.Parse(lblid.Text.ToString());
                    email = lblEmail.Text.ToString();
                    if (email != "")
                    {
                        try
                        {
                            DBconnection con = new DBconnection();
                            con.SetCommandQry = "select Password from View_DealersContacts where  EmailId='" + email + "' and status='True'";
                            DataTable dt = con.ExecuteTable();
                            Pass = dt.Rows[0]["password"].ToString();

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

            mail.Bcc.Add("zia@goradiainfotech.com");
            mail.From = new MailAddress("mail@performanceracing.in");
            mail.Subject = "Performance Racing - Dealer Login Details";


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
            emailClient.Credentials = new NetworkCredential("mail@performanceracing.in", "D+85Hy9V*");
            emailClient.Port = 587;
            emailClient.Host = "smtp.zoho.com";
            emailClient.EnableSsl = true;
            emailClient.Send(mail);

            string jv = "<script>alert('Mail has been sent successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }
    }

}