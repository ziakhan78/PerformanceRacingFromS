using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;


public partial class Admin_add_brand_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblHeading.Text = "Add Brand Details";

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetBrandDetails(id);
            }
        }
    }
    private void GetBrandDetails(int id)
    {
        chkComponents.DataSourceID = "SqlDataSource2";
        chkComponents.DataBind();

        lblHeading.Text = "Edit Brand Details";
        MastersBLL obj = new MastersBLL();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetBrandDetails();
        if (dt.Rows.Count > 0)
        {
            string strComponents = dt.Rows[0]["components"].ToString();
            if (strComponents != "")
            {
                string[] arrComponents = strComponents.ToString().Split(',');
                for (int i = 0; i <= arrComponents.Length - 1; i++)
                {
                    foreach (ListItem li in chkComponents.Items)
                    {
                        if (li.Text == arrComponents[i].Trim().ToString())
                        {
                            li.Selected = true;
                        }
                    }
                }
            }

            DDLBrandName.SelectedValue = dt.Rows[0]["brand_id"].ToString();
        }

    }
    private void AddBrandDetails()
    {
        try
        {
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            string strComponents="";
            foreach (ListItem li in chkComponents.Items)
            {
                if (li.Selected == true)
                {
                    strComponents = strComponents + li.Text + ", ";
                }
            }
            strComponents = strComponents.Remove(strComponents.Length - 2);

            MastersBLL obj = new MastersBLL();
            obj.BrandId = int.Parse(DDLBrandName.SelectedValue.ToString());
            obj.Component = strComponents;
            obj.Ipaddress = ipaddress;

            int i = obj.AddBrandDetails();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Brand Details Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateBrandDetails(int id)
    {
        try
        {
            string strComponents = "";
            foreach (ListItem li in chkComponents.Items)
            {
                if (li.Selected == true)
                {
                    strComponents = strComponents + li.Text + ", ";
                }
            }
            strComponents = strComponents.Remove(strComponents.Length - 2);

            MastersBLL obj = new MastersBLL();
            obj.Id = id;
            obj.BrandId = int.Parse(DDLBrandName.SelectedValue.ToString());
            obj.Component = strComponents;

            int i = obj.UpdateBrandDetails();

            if (i > 0)
            {

                Clear();
                Showmsg("Brand Details Has Been Updated Successfully", "view_brand_details.aspx");
                //string jv = "<script>alert('Occasion Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
       // txtBrand.Text = "";
    }   
   
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateBrandDetails(id);
            }
            else
            {
                AddBrandDetails();
            }
        }
    }
    public void Showmsg(string msg, string redirectUrl)
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
    protected void CVBrand_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            //CVBrand.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select brand_name from brand_master_tbl where brand_name='" + DDLBrandName.SelectedItem.Text.Trim().ToString() + "'";
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
}