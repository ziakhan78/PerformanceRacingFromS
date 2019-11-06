using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_courier_company : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDays();
           

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetCourier(id);
            }
        }
    }

    private void BindDays()
    {
        try
        {
            for (int i = 1; i <= 7; i++)
            {
                ListItem item = new ListItem();
                item.Text = new DateTime(1900, 1, i).ToString("dddd");
                item.Value = i.ToString();
                ddlFromDays.Items.Add(item);
                ddlToDays.Items.Add(item);
            }
            ddlFromDays.Items.Insert(0, "Select");
            ddlToDays.Items.Insert(0, "Select");

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void GetCourier(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetCourierCompany";

        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            chkShipTo.DataSourceID = "ds_states";
            chkShipTo.DataBind();

            txtCompanyName.Text = dt.Rows[0]["CompanyName"].ToString();
            txtAddress1.Text = dt.Rows[0]["Address1"].ToString();
            txtAddress2.Text = dt.Rows[0]["Address2"].ToString();
            txtLandmark.Text = dt.Rows[0]["Landmark"].ToString();

            txtMobileCc1.Text = dt.Rows[0]["MobileCc1"].ToString();
            txtMobile1.Text = dt.Rows[0]["Mobile1"].ToString();

            txtMobileCc2.Text = dt.Rows[0]["MobileCc2"].ToString();
            txtMobile2.Text = dt.Rows[0]["Mobile2"].ToString();

            txtPhCC1.Text = dt.Rows[0]["PhoneCC1"].ToString();
            txtPhAC1.Text = dt.Rows[0]["PhoneAC1"].ToString();
            txtPhone1.Text = dt.Rows[0]["Phone1"].ToString();

            txtPhCC2.Text = dt.Rows[0]["PhoneCC2"].ToString();
            txtPhAC2.Text = dt.Rows[0]["PhoneAC2"].ToString();
            txtPhone2.Text = dt.Rows[0]["Phone2"].ToString();

            txtPin.Text = dt.Rows[0]["Pin"].ToString();
            txtCity.Text = dt.Rows[0]["City"].ToString();

            txtWebsite.Text = dt.Rows[0]["Website"].ToString();
            txtEmailId.Text = dt.Rows[0]["EmailId"].ToString();

            try
            {
                timeFrom.DbSelectedDate = DateTime.Parse(dt.Rows[0]["WorkingTimeStart"].ToString());
                timeTo.DbSelectedDate = DateTime.Parse(dt.Rows[0]["WorkingTimeEnd"].ToString());

            }
            catch { }

            ddlFromDays.SelectedItem.Text = dt.Rows[0]["WorkingDayStart"].ToString();
            ddlToDays.SelectedItem.Text = dt.Rows[0]["WorkingDayEnd"].ToString();

            // string strShipTo = dt.Rows[0]["ShipTo"].ToString();

            string strShipTo = dt.Rows[0]["ShipTo"].ToString();
            if (strShipTo != "")
            {
                string[] arrShipTo = strShipTo.ToString().Split(',');
                for (int i = 0; i <= arrShipTo.Length - 1; i++)
                {
                    foreach (ListItem li in chkShipTo.Items)
                    {
                        if (li.Text == arrShipTo[i].Trim().ToString())
                        {
                            li.Selected = true;
                        }
                    }
                }
            }
        }
    }
    private void AddCourier()
    {
        try
        {
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/
            

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddCourierCompany";
            obj.AddParam("@CompanyName", txtCompanyName.Text.Trim().ToString());
            obj.AddParam("@Address1", txtAddress1.Text.Trim().ToString());
            obj.AddParam("@Address2", txtAddress2.Text.Trim().ToString());
            obj.AddParam("@Landmark", txtLandmark.Text.Trim().ToString());
            obj.AddParam("@Pin", txtPin.Text.Trim().ToString());
            obj.AddParam("@City", txtCity.Text.Trim().ToString());
           

            obj.AddParam("@MobileCc1", txtMobileCc1.Text.Trim().ToString());
            obj.AddParam("@Mobile1", txtMobile1.Text.Trim().ToString());
            obj.AddParam("@MobileCc2", txtMobileCc2.Text.Trim().ToString());
            obj.AddParam("@Mobile2", txtMobile2.Text.Trim().ToString());


            obj.AddParam("@PhoneCC1", txtPhCC1.Text.Trim().ToString());
            obj.AddParam("@PhoneAC1", txtPhAC1.Text.Trim().ToString());
            obj.AddParam("@Phone1", txtPhone1.Text.Trim().ToString());
            obj.AddParam("@PhoneCC2", txtPhCC2.Text.Trim().ToString());
            obj.AddParam("@PhoneAC2", txtPhAC2.Text.Trim().ToString());
            obj.AddParam("@Phone2", txtPhone2.Text.Trim().ToString());

            obj.AddParam("@WorkingDayStart", ddlFromDays.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@WorkingDayEnd", ddlToDays.SelectedItem.Text.Trim().ToString());

            obj.AddParam("@WorkingTimeStart", DateTime.Parse(timeFrom.SelectedDate.ToString()));
            obj.AddParam("@WorkingTimeEnd", DateTime.Parse(timeTo.SelectedDate.ToString()));

            obj.AddParam("@Website", txtWebsite.Text.Trim().ToString());
            obj.AddParam("@EmailId", txtEmailId.Text.Trim().ToString());

            
            string strShipTo = "";
            foreach (ListItem li in chkShipTo.Items)
            {
                if (li.Selected == true)
                {
                    strShipTo = strShipTo + li.Text + ", ";
                }
            }
            obj.AddParam("@ShipTo", strShipTo.TrimEnd(',').ToString());




            obj.AddParam("@IpAddress", ipaddress);

          


            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();

                string jv = "<script>alert('Courier Company Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateCourier(int id)
    {
        try
        {

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateCourierCompany";
            obj.AddParam("@id", id);
            obj.AddParam("@CompanyName", txtCompanyName.Text.Trim().ToString());
            obj.AddParam("@Address1", txtAddress1.Text.Trim().ToString());
            obj.AddParam("@Address2", txtAddress2.Text.Trim().ToString());
            obj.AddParam("@Landmark", txtLandmark.Text.Trim().ToString());
            obj.AddParam("@Pin", txtPin.Text.Trim().ToString());
            obj.AddParam("@City", txtCity.Text.Trim().ToString());
            

            obj.AddParam("@MobileCc1", txtMobileCc1.Text.Trim().ToString());
            obj.AddParam("@Mobile1", txtMobile1.Text.Trim().ToString());
            obj.AddParam("@MobileCc2", txtMobileCc2.Text.Trim().ToString());
            obj.AddParam("@Mobile2", txtMobile2.Text.Trim().ToString());
        
            obj.AddParam("@PhoneCC1", txtPhCC1.Text.Trim().ToString());
            obj.AddParam("@PhoneAC1", txtPhAC1.Text.Trim().ToString());
            obj.AddParam("@Phone1", txtPhone1.Text.Trim().ToString());
            obj.AddParam("@PhoneCC2", txtPhCC2.Text.Trim().ToString());
            obj.AddParam("@PhoneAC2", txtPhAC2.Text.Trim().ToString());
            obj.AddParam("@Phone2", txtPhone2.Text.Trim().ToString());

            obj.AddParam("@WorkingDayStart", ddlFromDays.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@WorkingDayEnd", ddlToDays.SelectedItem.Text.Trim().ToString());

            obj.AddParam("@WorkingTimeStart", DateTime.Parse(timeFrom.SelectedDate.ToString()));
            obj.AddParam("@WorkingTimeEnd", DateTime.Parse(timeTo.SelectedDate.ToString()));


            obj.AddParam("@Website", txtWebsite.Text.Trim().ToString());
            obj.AddParam("@EmailId", txtEmailId.Text.Trim().ToString());

            string strShipTo = "";
            foreach (ListItem li in chkShipTo.Items)
            {
                if (li.Selected == true)
                {
                    strShipTo = strShipTo + li.Text + ", ";
                }
            }
            obj.AddParam("@ShipTo", strShipTo.TrimEnd(',').ToString());


            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();

                //string jv = "<script>alert('Courier Has Been Added Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

                Showmsg("Courier Company Has Been Updated Successfully", "view_courier_company.aspx");

            }
        }
        catch { throw; }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateCourier(id);
            }
            else
            {
                AddCourier();
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
        txtAddress1.Text = "";
        txtAddress2.Text = "";
        txtCity.Text = "";
        txtCompanyName.Text = "";
        txtLandmark.Text = "";
       
        txtPhAC1.Text = "";
        txtPhAC2.Text = "";
        txtPhCC1.Text = "";
        txtPhCC2.Text = "";
        txtPhone1.Text = "";
        txtPhone2.Text = "";
       
       
        txtWebsite.Text = "";
        txtPin.Text = "";
      
        Session["PanImg"] = null;
        Session["VatImg"] = null;
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
}