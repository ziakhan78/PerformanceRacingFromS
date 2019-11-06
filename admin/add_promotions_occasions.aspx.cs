using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_promotions_occasions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetPromotionOccasion(id);
            }
        }
    }
    private void GetPromotionOccasion(int id)
    {
        MastersBLL objPromotionOccasions = new MastersBLL();
        objPromotionOccasions.Id = id;
        DataTable dt = new DataTable();
        dt = objPromotionOccasions.GetPromotionOccasion();
        if (dt.Rows.Count > 0)
        {
            txtName.Text = dt.Rows[0]["occasion_name"].ToString();
            txtAbbri.Text = dt.Rows[0]["occasion_abbri"].ToString();

        }

    }
    private void AddPromotionOccasion()
    {
        try
        {
            MastersBLL objPromotionOccasion = new MastersBLL();
            objPromotionOccasion.PromotionOccasion = objPromotionOccasion.ToTitleCase(txtName.Text.Trim().ToString());
            objPromotionOccasion.OccasionAbbre = txtAbbri.Text.Trim().ToString();
            int i = objPromotionOccasion.AddPromotionOccasion();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Promotion Occasion Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdatePromotionOccasion(int id)
    {
        try
        {
            MastersBLL objPromotionOccasion = new MastersBLL();
            objPromotionOccasion.Id = id;
            objPromotionOccasion.PromotionOccasion = objPromotionOccasion.ToTitleCase(txtName.Text.Trim().ToString());
            objPromotionOccasion.OccasionAbbre = txtAbbri.Text.Trim().ToString();

            int i = objPromotionOccasion.UpdatePromotionOccasion();

            if (i > 0)
            {
                Clear();
                showmsg("Promotion Occasion Has Been Updated Successfully", "view_promotions_occasion.aspx");

                //string jv = "<script>alert('Promotion Occasion Has Been Updated Successfully');</script>";
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
        txtName.Text = "";
        txtAbbri.Text = "";
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdatePromotionOccasion(id);
            }
            else
            {
                AddPromotionOccasion();
            }
        }
    }

   
    protected void CVProOcc_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVProOcc.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select occasion_name from promotion_occasion_master_tbl where occasion_name='" + txtName.Text.Trim().ToString() + "'";
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