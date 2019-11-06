using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;


public partial class Admin_add_model_master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblHeading.Text = "Add Motorcycle Model";
            BindYears();
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetModel(id);
            }
        }
    }

    private void BindYears()
    {
        try
        {
            int dt = DateTime.Now.Year;
            for (Int32 i = Convert.ToInt32(dt); i >= 1980; i--)
            {
                string dtt = i.ToString();
                DDLYearsFrom.Items.Add(dtt.ToString());
                DDLYearsTo.Items.Add(dtt.ToString());
            }

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void GetModel(int id)
    {
        lblHeading.Text = "Edit Motorcycle Model";
        MastersBLL obj = new MastersBLL();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetManufacturerModel();
        if (dt.Rows.Count > 0)
        {
            BindYears();

            DDLManufacturer.SelectedValue = dt.Rows[0]["manufacturer_id"].ToString();
            txtModel.Text = dt.Rows[0]["model"].ToString();
            try
            {
                DateTime dtYear = DateTime.Parse(dt.Rows[0]["year_from"].ToString());
                DDLYearsFrom.SelectedItem.Text = dtYear.ToString("yyyy");
                DDLYearsFrom.SelectedValue = dtYear.ToString("yyyy");
            }
            catch { }

            try
            {
                DateTime dtYearTo = DateTime.Parse(dt.Rows[0]["year_to"].ToString());
                DDLYearsTo.SelectedItem.Text = dtYearTo.ToString("yyyy");
                DDLYearsTo.SelectedValue= dtYearTo.ToString("yyyy");
            }
            catch { }
        }

    }
    private void AddModel()
    {
        try
        {
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            MastersBLL obj = new MastersBLL();
            obj.ManufacturerId = int.Parse(DDLManufacturer.SelectedValue.ToString());
            obj.ManufacturerModel = txtModel.Text.Trim().ToString();
            obj.ModelYear = DDLYearsFrom.SelectedItem.Text.Trim().ToString();
            obj.ModelYearTo = DDLYearsTo.SelectedItem.Text.Trim().ToString();
            obj.Ipaddress = ipaddress;
            int i = obj.AddManufacturerModel();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Manufacturer Model Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateModel(int id)
    {
        try
        {
            MastersBLL obj = new MastersBLL();
            obj.Id = id;
            obj.ManufacturerId = int.Parse(DDLManufacturer.SelectedValue.ToString());
            obj.ManufacturerModel = txtModel.Text.Trim().ToString();
            obj.ModelYear = DDLYearsFrom.SelectedItem.Text.Trim().ToString();
            obj.ModelYearTo = DDLYearsTo.SelectedItem.Text.Trim().ToString();

            int i = obj.UpdateManufacturerModel();

            if (i > 0)
            {

                Clear();
                showmsg("Manufacturer Model Has Been Updated Successfully", "view_model_master.aspx");


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
        txtModel.Text = "";
        DDLManufacturer.SelectedIndex=0;
        DDLYearsFrom.SelectedIndex = 0;
        DDLYearsTo.SelectedIndex = 0;
    }   
   
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateModel(id);
            }
            else
            {
                AddModel();
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
    protected void CVBrand_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
           // CVBrand.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select brand_name from brand_master_tbl where brand_name='" + txtModel.Text.Trim().ToString() + "'";
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