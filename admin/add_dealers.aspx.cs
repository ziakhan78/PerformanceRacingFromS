using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;

public partial class admin_add_dealers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            rfvState.Visible = true;
            

            BindClosedOn();
            ddlClosedOn.SelectedIndex = 6;

            BindDays();
            panImg.Visible = false;
            vatImg.Visible = false;
            trCreditPeriod.Visible = false;
            trCreditLimit.Visible = false;

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetDealers(id);
            }
        }
    }

    private void BindClosedOn()
    {
        try
        {

            for (int i = 1; i <= 7; i++)
            {
                ListItem item = new ListItem();
                item.Text = new DateTime(1900, 1, i).ToString("dddd");
               // item.Value = i.ToString();
               
                ddlClosedOn.Items.Add(item);
            }          

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
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
               // ddlClosedOn.Items.Add(item);
            }
            ddlFromDays.Items.Insert(0, "Select");
            ddlToDays.Items.Insert(0, "Select");            

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void GetDealers(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetDealers";

        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            rfvState.Visible = false;
            chkBrandList.DataSourceID = "SqlDataSource1";
            chkBrandList.DataBind();

            ddlState.DataSourceID = "dsState";
            ddlState.DataBind();

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

            txtFaxCC1.Text = dt.Rows[0]["FaxCC"].ToString();
            txtFaxAC1.Text = dt.Rows[0]["FaxAC"].ToString();
            txtFax1.Text = dt.Rows[0]["Fax"].ToString();

            try
            {
                timeFrom.DbSelectedDate = DateTime.Parse(dt.Rows[0]["WorkingTimeStart"].ToString());
                timeTo.DbSelectedDate = DateTime.Parse(dt.Rows[0]["WorkingTimeEnd"].ToString());

            }
            catch { }


            ddlFromDays.SelectedItem.Text = dt.Rows[0]["WorkingDayStart"].ToString();
            ddlToDays.SelectedItem.Text = dt.Rows[0]["WorkingDayEnd"].ToString();
           

            try
            {
                string strValue = "";
                strValue = dt.Rows[0]["ClosedOn"].ToString();
                switch (strValue)
                {
                    case "Monday":
                        ddlClosedOn.SelectedIndex = 0;
                        break;
                    case "Tuesday":
                        ddlClosedOn.SelectedIndex = 1;
                        break;
                    case "Wednesday":
                        ddlClosedOn.SelectedIndex = 2;
                        break;
                    case "Thursday":
                        ddlClosedOn.SelectedIndex = 3;
                        break;
                    case "Friday":
                        ddlClosedOn.SelectedIndex = 4;
                        break;
                    case "Saturday":
                        ddlClosedOn.SelectedIndex = 5;
                        break;
                    case "Sunday":
                        ddlClosedOn.SelectedIndex = 6;
                        break;

                    default:                       
                        ddlClosedOn.SelectedIndex = 6;
                        break;
                }

            }
            catch { }


            txtPin.Text = dt.Rows[0]["Pin"].ToString();
            txtCity.Text = dt.Rows[0]["City"].ToString();
            //txtState.Text = dt.Rows[0]["State"].ToString();   

            ddlState.SelectedItem.Text = dt.Rows[0]["State"].ToString();

            txtVat.Text = dt.Rows[0]["Vat"].ToString();
            txtPan.Text = dt.Rows[0]["Pan"].ToString();           
            txtWebsite.Text = dt.Rows[0]["Website"].ToString();

            txtEmailId.Text = dt.Rows[0]["EmailId"].ToString();

            string strCreditLimit = dt.Rows[0]["CreditLimit"].ToString();
            if (strCreditLimit != "")
            {
                rbtnCredit.SelectedIndex = 1;
                trCreditLimit.Visible = true;
                trCreditPeriod.Visible = true;
                txtCreditLimit.Text = strCreditLimit;               
            }

            string strCreditPeriod = dt.Rows[0]["CreditPeriod"].ToString();
            if (strCreditPeriod != "")
            {
                rbtnCredit.SelectedIndex = 1;
                trCreditLimit.Visible = true;
                trCreditPeriod.Visible = true;
                //txtCreditPeriod.Text = strCreditPeriod;
                ddlCreditPeriod.SelectedItem.Text = strCreditPeriod;
            }           

            string strVatImage = dt.Rows[0]["VatImage"].ToString();
            if (strVatImage != "")
            {
                vatImg.Visible = true;
                Session["VatImg"] = strVatImage;
            }

            vatImg.ImageUrl = "../DealersImages/" + strVatImage;


            string strPanImage = dt.Rows[0]["PanImage"].ToString();
            if (strPanImage != "")
            {
                panImg.Visible = true;
                Session["PanImg"] = strPanImage;
            }

            panImg.ImageUrl = "../DealersImages/" + strPanImage;

            string strBrandRepresented = dt.Rows[0]["BrandRepresented"].ToString();
            if (strBrandRepresented != "")
            {
                string[] arrBrandRepresented = strBrandRepresented.ToString().Split(',');
                for (int i = 0; i <= arrBrandRepresented.Length - 1; i++)
                {
                    foreach (ListItem li in chkBrandList.Items)
                    {
                        if (li.Text == arrBrandRepresented[i].Trim().ToString())
                        {
                            li.Selected = true;
                        }
                    }
                }
            }


        }
    }
    private void AddDealers()
    {
        try
        {
            System.Data.SqlTypes.SqlDateTime nullDate;
            nullDate = SqlDateTime.Null;

            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDealers";
            obj.AddParam("@CompanyName", txtCompanyName.Text.Trim().ToString());
            obj.AddParam("@Address1", txtAddress1.Text.Trim().ToString());
            obj.AddParam("@Address2", txtAddress2.Text.Trim().ToString());
            obj.AddParam("@Landmark", txtLandmark.Text.Trim().ToString());
            obj.AddParam("@Pin", txtPin.Text.Trim().ToString());
            obj.AddParam("@City", txtCity.Text.Trim().ToString());
            obj.AddParam("@State", ddlState.SelectedItem.Text.Trim().ToString());

            obj.AddParam("@MobileCc1", txtMobileCc1.Text.Trim().ToString());
            obj.AddParam("@Mobile1", txtMobile1.Text.Trim().ToString());
            obj.AddParam("@MobileCc2", txtMobileCc2.Text.Trim().ToString());
            obj.AddParam("@Mobile2", txtMobile2.Text.Trim().ToString());

            obj.AddParam("@FaxCC", txtFaxCC1.Text.Trim().ToString());
            obj.AddParam("@FaxAC", txtFaxAC1.Text.Trim().ToString());
            obj.AddParam("@Fax", txtFax1.Text.Trim().ToString());

            obj.AddParam("@PhoneCC1", txtPhCC1.Text.Trim().ToString());
            obj.AddParam("@PhoneAC1", txtPhAC1.Text.Trim().ToString());
            obj.AddParam("@Phone1", txtPhone1.Text.Trim().ToString());
            obj.AddParam("@PhoneCC2", txtPhCC2.Text.Trim().ToString());
            obj.AddParam("@PhoneAC2", txtPhAC2.Text.Trim().ToString());
            obj.AddParam("@Phone2", txtPhone2.Text.Trim().ToString());

            string strWorkingDays = ddlFromDays.SelectedItem.Text.Trim().ToString();
            if (strWorkingDays != "Select")
                obj.AddParam("@WorkingDayStart", strWorkingDays);
            else
                obj.AddParam("@WorkingDayStart", "");



            string strToDays = ddlToDays.SelectedItem.Text.Trim().ToString();
            if (strToDays != "Select")
                obj.AddParam("@WorkingDayEnd", strToDays);
            else
                obj.AddParam("@WorkingDayEnd", "");

            try
            {
                obj.AddParam("@WorkingTimeStart", DateTime.Parse(timeFrom.SelectedDate.ToString()));
            }
            catch { obj.AddParam("@WorkingTimeStart", nullDate); }

            try
            {
                obj.AddParam("@WorkingTimeEnd", DateTime.Parse(timeTo.SelectedDate.ToString()));

            }
            catch { obj.AddParam("@WorkingTimeEnd", nullDate); }

            try
            {
                obj.AddParam("@ClosedOn", ddlClosedOn.SelectedItem.Text.Trim().ToString());
            }
            catch
            { obj.AddParam("@ClosedOn", ""); }

            obj.AddParam("@Vat", txtVat.Text.Trim().ToString());
            obj.AddParam("@Pan", txtPan.Text.Trim().ToString());

            obj.AddParam("@Website", txtWebsite.Text.Trim().ToString());
            obj.AddParam("@EmailId", txtEmailId.Text.Trim().ToString());

            obj.AddParam("@CreditFacility", rbtnCredit.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@CreditLimit", txtCreditLimit.Text.Trim().ToString());

            string strCreditPeriod = ddlCreditPeriod.SelectedItem.Text.Trim().ToString();
            try
            {
                if (strCreditPeriod != "Select")
                    obj.AddParam("@CreditPeriod", ddlCreditPeriod.SelectedItem.Text.Trim().ToString());
                else
                    obj.AddParam("@CreditPeriod", "");
            }
            catch
            {
                obj.AddParam("@CreditPeriod", "");
            }

            obj.AddParam("@IpAddress", ipaddress);

            try
            {
                obj.AddParam("@VatImage", Session["VatImg"].ToString());
            }
            catch { obj.AddParam("@VatImage", ""); }

            try
            {
                obj.AddParam("@PanImage", Session["PanImg"].ToString());
            }
            catch { obj.AddParam("@PanImage", ""); }

            string strBrandRepresented = "";
            foreach (ListItem li in chkBrandList.Items)
            {
                if (li.Selected == true)
                {
                    strBrandRepresented = strBrandRepresented + li.Text + ", ";
                }
            }
            obj.AddParam("@BrandRepresented", strBrandRepresented.TrimEnd(',').ToString());


            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();

                string jv = "<script>alert('Dealers Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void UpdateDealers(int id)
    {
        try
        {

            System.Data.SqlTypes.SqlDateTime nullDate;
            nullDate = SqlDateTime.Null;

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDealers";
            obj.AddParam("@id", id);
            obj.AddParam("@CompanyName", txtCompanyName.Text.Trim().ToString());
            obj.AddParam("@Address1", txtAddress1.Text.Trim().ToString());
            obj.AddParam("@Address2", txtAddress2.Text.Trim().ToString());
            obj.AddParam("@Landmark", txtLandmark.Text.Trim().ToString());
            obj.AddParam("@Pin", txtPin.Text.Trim().ToString());
            obj.AddParam("@City", txtCity.Text.Trim().ToString());
            obj.AddParam("@State", ddlState.SelectedItem.Text.Trim().ToString());

            obj.AddParam("@MobileCc1", txtMobileCc1.Text.Trim().ToString());
            obj.AddParam("@Mobile1", txtMobile1.Text.Trim().ToString());
            obj.AddParam("@MobileCc2", txtMobileCc2.Text.Trim().ToString());
            obj.AddParam("@Mobile2", txtMobile2.Text.Trim().ToString());


            obj.AddParam("@FaxCC", txtFaxCC1.Text.Trim().ToString());
            obj.AddParam("@FaxAC", txtFaxAC1.Text.Trim().ToString());
            obj.AddParam("@Fax", txtFax1.Text.Trim().ToString());
            obj.AddParam("@PhoneCC1", txtPhCC1.Text.Trim().ToString());
            obj.AddParam("@PhoneAC1", txtPhAC1.Text.Trim().ToString());
            obj.AddParam("@Phone1", txtPhone1.Text.Trim().ToString());
            obj.AddParam("@PhoneCC2", txtPhCC2.Text.Trim().ToString());
            obj.AddParam("@PhoneAC2", txtPhAC2.Text.Trim().ToString());
            obj.AddParam("@Phone2", txtPhone2.Text.Trim().ToString());

            string strWorkingDays = ddlFromDays.SelectedItem.Text.Trim().ToString();
            if(strWorkingDays!="Select")
                obj.AddParam("@WorkingDayStart", strWorkingDays);
            else
                obj.AddParam("@WorkingDayStart", "");



            string strToDays = ddlToDays.SelectedItem.Text.Trim().ToString();
            if (strToDays != "Select")
                obj.AddParam("@WorkingDayEnd", strToDays);
            else
                obj.AddParam("@WorkingDayEnd", "");
          

            try
            {
                obj.AddParam("@WorkingTimeStart", DateTime.Parse(timeFrom.SelectedDate.ToString()));
            }
            catch { obj.AddParam("@WorkingTimeStart", nullDate); }

            try
            {
                obj.AddParam("@WorkingTimeEnd", DateTime.Parse(timeTo.SelectedDate.ToString()));

            }
            catch { obj.AddParam("@WorkingTimeEnd", nullDate); }

            obj.AddParam("@ClosedOn", ddlClosedOn.SelectedItem.Text.Trim().ToString());
            
            obj.AddParam("@Vat", txtVat.Text.Trim().ToString());           
            obj.AddParam("@Pan", txtPan.Text.Trim().ToString());          
            obj.AddParam("@Website", txtWebsite.Text.Trim().ToString());
            obj.AddParam("@EmailId", txtEmailId.Text.Trim().ToString());

           
            obj.AddParam("@CreditFacility", rbtnCredit.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@CreditLimit", txtCreditLimit.Text.Trim().ToString());

            string strCreditPeriod = ddlCreditPeriod.SelectedItem.Text.Trim().ToString();
            try
            {
                if(strCreditPeriod!="Select")
                    obj.AddParam("@CreditPeriod", ddlCreditPeriod.SelectedItem.Text.Trim().ToString());
                else
                    obj.AddParam("@CreditPeriod", "");
            }
            catch
            {
                obj.AddParam("@CreditPeriod", "");
            }

            try
            {
                obj.AddParam("@VatImage", Session["VatImg"].ToString());
            }
            catch { obj.AddParam("@VatImage", ""); }

            try
            {
                obj.AddParam("@PanImage", Session["PanImg"].ToString());
            }
            catch { obj.AddParam("@PanImage", ""); }

            string strBrandRepresented = "";
            foreach (ListItem li in chkBrandList.Items)
            {
                if (li.Selected == true)
                {
                    strBrandRepresented = strBrandRepresented + li.Text + ", ";
                }
            }

            obj.AddParam("@BrandRepresented", strBrandRepresented.TrimEnd(',').ToString());

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();

                //string jv = "<script>alert('Dealers Has Been Added Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

                Showmsg("Dealers Has Been Updated Successfully", "view_dealers.aspx");

            }
        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateDealers(id);
            }
            else
            {
                AddDealers();
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
        txtFax1.Text = "";
        txtFaxAC1.Text = "";
        txtFaxCC1.Text = "";
        txtPan.Text = "";
        txtPhAC1.Text = "";
        txtPhAC2.Text = "";
        txtPhCC1.Text = "";
        txtPhCC2.Text = "";
        txtPhone1.Text = "";
        txtPhone2.Text = "";
        //txtState.Text = "";
        ddlState.SelectedIndex = 0;
        txtVat.Text = "";       
        txtWebsite.Text = "";
        txtPin.Text = "";
        rbtnCredit.SelectedIndex = 0;
        txtCreditLimit.Text = "";
        //txtCreditPeriod.Text = "";
        ddlCreditPeriod.SelectedIndex = 0;
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
    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "DealersImages";

            string file_name = "";
            string ext = "";
            file_name = e.File.FileName;
            file_name = file_name.Substring(file_name.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");
            ext = file_name.Substring(file_name.LastIndexOf("."));
            file_name = file_name.Substring(0, file_name.LastIndexOf("."));
            file_name = strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + file_name);
            Session["PanImg"] = file_name;
            e.File.SaveAs(path);
        }
        catch
        {
        }
    }
    protected void RadAsyncUpload2_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "DealersImages";

            string file_name = "";
            string ext = "";
            file_name = e.File.FileName;
            file_name = file_name.Substring(file_name.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");
            ext = file_name.Substring(file_name.LastIndexOf("."));
            file_name = file_name.Substring(0, file_name.LastIndexOf("."));
            file_name = strDate + ext;

            string path = Server.MapPath("~/" + strPath + "/" + file_name);
            Session["VatImg"] = file_name;
            e.File.SaveAs(path);
        }
        catch
        {
        }
    }
    protected void rbtnCredit_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnCredit.SelectedValue == "0")
        {
            trCreditPeriod.Visible = false;
            trCreditLimit.Visible = false;
            txtCreditLimit.Text = "";
            //txtCreditPeriod.Text = "";
            ddlCreditPeriod.SelectedIndex = 0;
        }
        else
        {
            trCreditPeriod.Visible = true;
            trCreditLimit.Visible = true;
        }
    }
}