using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_add_user_registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateRegUser(id);
            }
            else
            {
                AddRegUser();
            }
        }
    }
    private void AddRegUser()
    {
        try
        {


            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            //string password = GetRandomPasswordUsingGUID(8);

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddRegisteredUser";

            obj.AddParam("@fname", txtFName.Text.Trim());
            obj.AddParam("@mname", "");
            obj.AddParam("@lname", txtLName.Text.Trim());
            obj.AddParam("@emailId", txtEmail.Text.Trim());

            obj.AddParam("@username", txtUsername.Text.Trim());
            obj.AddParam("@password", txtPass.Text.Trim());
           

            obj.AddParam("@add1", txtAdd1.Text.Trim());
            obj.AddParam("@add2", txtAdd2.Text.Trim());
            obj.AddParam("@city", txtCity.Text.Trim());
            obj.AddParam("@state", "");
            obj.AddParam("@country", txtCountry.Text.Trim());
            obj.AddParam("@pin", txtPin.Text.Trim());

            obj.AddParam("@mobilecc", txtMobCC.Text.Trim());
            obj.AddParam("@mobile", txtMobile.Text.Trim());


            obj.AddParam("@phcc", "");
            obj.AddParam("@phac", "");
            try
            {
                obj.AddParam("@phone", 0);
            }
            catch
            {
                obj.AddParam("@phone", 0);
            }

            obj.AddParam("@website", "");

            //string website = txtwebsite.Text.Trim();
            //if (website == "http://www.")
            //{
            //    obj.AddParam("@website", "");
            //}
            //else
            //{
            //    obj.AddParam("@website", "");
            //}
           
            obj.AddParam("@ipaddress", ipaddress);

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {               
                //clear();
                string jv = "<script>alert('Record Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateRegUser(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateRegisteredUser";

            obj.AddParam("@id", id);
            obj.AddParam("@fname", txtFName.Text.Trim());
            obj.AddParam("@mname", "");
            obj.AddParam("@lname", txtLName.Text.Trim());
            obj.AddParam("@emailId", txtEmail.Text.Trim());


            obj.AddParam("@add1", txtAdd1.Text.Trim());
            obj.AddParam("@add2", txtAdd2.Text.Trim());
            obj.AddParam("@city", txtCity.Text.Trim());
            obj.AddParam("@state", "");
            obj.AddParam("@country", txtCountry.Text.Trim());
            obj.AddParam("@pin", txtPin.Text.Trim());

            obj.AddParam("@mobilecc", txtMobCC.Text.Trim());
            obj.AddParam("@mobile", txtMobile.Text.Trim());


            obj.AddParam("@phcc", "");
            obj.AddParam("@phac", "");
            try
            {
                obj.AddParam("@phone", 0);
            }
            catch
            {
                obj.AddParam("@phone", 0);
            }

            obj.AddParam("@website", "");
            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                //clear();
                //showmsg("Record updated successfully !", "view_roll_of_honour.aspx");
                string jv = "<script>alert('Record Has Been Updated Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
}
