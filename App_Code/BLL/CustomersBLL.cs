using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Globalization;

/// <summary>
/// Summary description for CustomersBLL
/// </summary>
public class CustomersBLL
{
    public CustomersBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region --- Declared Variables ---    


    private string billFName, billLName, gender, billAddress1, billAddress2, billCity, billZip, billMobileCC, billMobile, billPhoneCC, billPhoneAC, billPhone, 
        email, password, shippAddSameAsBillAdd, sFName, sLName, sAddress1, sAddress2, sCity, sZip, sMobileCc, sMobile, sPhoneCc,
                         sPhoneAc, sPhone, ipaddress, emailVerificationCode = "";
    private int id,billStateId, billCountryId, sStateId, sCountryId = 0;
    private System.Data.SqlTypes.SqlDateTime dob, anniversary;

    public int Id { set { id = value; } get { return id; } }
    public int BillStateId { set { billStateId = value; } get { return billStateId; } }
    public int BillCountryId { set { billCountryId = value; } get { return billCountryId; } }
    public int SStateId { set { sStateId = value; } get { return sStateId; } }
    public int SCountryId { set { sCountryId = value; } get { return sCountryId; } }

    public System.Data.SqlTypes.SqlDateTime Dob { set { dob = value; } get { return dob; } }
    public System.Data.SqlTypes.SqlDateTime Anniversary { set { anniversary = value; } get { return anniversary; } }    
   
    public string BillFName { set { billFName = value; } get { return billFName; } }
    public string BillLName { set { billLName = value; } get { return billLName; } }
    public string Gender { set { gender = value; } get { return gender; } }
    public string BillAddress1 { set { billAddress1 = value; } get { return billAddress1; } }
    public string BillAddress2 { set { billAddress2 = value; } get { return billAddress2; } }
    public string BillCity { set { billCity = value; } get { return billCity; } }
    public string BillZip { set { billZip = value; } get { return billZip; } }
    public string BillMobileCC { set { billMobileCC = value; } get { return billMobileCC; } }
    public string BillMobile { set { billMobile = value; } get { return billMobile; } }
    public string BillPhoneCC { set { billPhoneCC = value; } get { return billPhoneCC; } }
    public string BillPhoneAC { set { billPhoneAC = value; } get { return billPhoneAC; } }
    public string BillPhone { set { billPhone = value; } get { return billPhone; } }
    public string Email { set { email = value; } get { return email; } }
    public string Password { set { password = value; } get { return password; } }
    public string ShippAddSameAsBillAdd { set { shippAddSameAsBillAdd = value; } get { return shippAddSameAsBillAdd; } }
    public string SFName { set { sFName = value; } get { return sFName; } }
    public string SLName { set { sLName = value; } get { return sLName; } }
    public string SAddress1 { set { sAddress1 = value; } get { return sAddress1; } }
    public string SAddress2 { set { sAddress2 = value; } get { return sAddress2; } }
    public string SCity { set { sCity = value; } get { return sCity; } }
    public string SZip { set { sZip = value; } get { return sZip; } }
    public string SMobileCc { set { sMobileCc = value; } get { return sMobileCc; } }
    public string SMobile { set { sMobile = value; } get { return sMobile; } }
     public string SPhoneCc { set { sPhoneCc = value; } get { return sPhoneCc; } }
    public string SPhoneAc { set { sPhoneAc = value; } get { return sPhoneAc; } }
    public string SPhone { set { sPhone = value; } get { return sPhone; } }
    public string Ipaddress { set { ipaddress = value; } get { return ipaddress; } }

    public string EmailVerificationCode { set { emailVerificationCode = value; } get { return emailVerificationCode; } }

    public string CustomerType { get; set; }
    public string CompanyName { get; set; }
    public string GSTIN { get; set; }

    #endregion

    #region --- Add Customer ---
    public int AddCustomer()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddCustomer";

        obj.AddParam("@CustomerType", this.CustomerType);
        obj.AddParam("@Company_Name", this.CompanyName);
        obj.AddParam("@GSTIN", this.GSTIN);
        obj.AddParam("@billFName", this.billFName);    
        obj.AddParam("@billLName", this.billLName);   
        obj.AddParam("@gender", this.gender);   
        obj.AddParam("@dob", this.dob);   
        obj.AddParam("@anniversary", this.anniversary);   
        obj.AddParam("@billAddress1", this.billAddress1);   
        obj.AddParam("@billAddress2", this.billAddress2);   
        obj.AddParam("@billCity", this.billCity);   
        obj.AddParam("@billZip", this.billZip);   
        obj.AddParam("@billMobileCC", this.billMobileCC);   
        obj.AddParam("@billMobile", this.billMobile); 
        obj.AddParam("@billPhoneCC", this.billPhoneCC);    
        obj.AddParam("@billPhoneAC", this.billPhoneAC);
        obj.AddParam("@billPhone", this.billPhone);   
        obj.AddParam("@billStateId", this.billStateId);   
        obj.AddParam("@billCountryId", this.billCountryId);   
        obj.AddParam("@email", this.email);   
        obj.AddParam("@password", this.password);   

        obj.AddParam("@shippAddSameAsBillAdd", this.shippAddSameAsBillAdd);   
        
        obj.AddParam("@sFName", this.sFName);   
        obj.AddParam("@sLName", this.sLName);   
        obj.AddParam("@sAddress1", this.sAddress1);   
        obj.AddParam("@sAddress2", this.sAddress2);   
        obj.AddParam("@sCity", this.sCity);    
        obj.AddParam("@sZip", this.sZip);   
        obj.AddParam("@sMobileCc", this.sMobileCc);   
        obj.AddParam("@sMobile", this.sMobile);   
        obj.AddParam("@sPhoneCc", this.sPhoneCc);   
        obj.AddParam("@sPhoneAc", this.sPhoneAc);   
        obj.AddParam("@sPhone", this.sPhone);   
        obj.AddParam("@sStateId", this.sStateId);   
        obj.AddParam("@sCountryId", this.sCountryId);   
        obj.AddParam("@ipaddress", this.ipaddress);
        obj.AddParam("@email_verification_code", this.emailVerificationCode);  

        i = obj.ExecuteNonQuery();
        return i;
    }
   

    #endregion

    #region --- Update Customer ---
    public int UpdateCustomer()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateCustomer";
        obj.AddParam("@id", this.id);
        obj.AddParam("@CustomerType", this.CustomerType);
        obj.AddParam("@Company_Name", this.CompanyName);
        obj.AddParam("@GSTIN", this.GSTIN);
        obj.AddParam("@billFName", this.billFName);
        obj.AddParam("@billLName", this.billLName);
        obj.AddParam("@gender", this.gender);
        obj.AddParam("@dob", this.dob);
        obj.AddParam("@anniversary", this.anniversary);
        obj.AddParam("@billAddress1", this.billAddress1);
        obj.AddParam("@billAddress2", this.billAddress2);
        obj.AddParam("@billCity", this.billCity);
        obj.AddParam("@billZip", this.billZip);
        obj.AddParam("@billMobileCC", this.billMobileCC);
        obj.AddParam("@billMobile", this.billMobile);
        obj.AddParam("@billPhoneCC", this.billPhoneCC);
        obj.AddParam("@billPhoneAC", this.billPhoneAC);
        obj.AddParam("@billPhone", this.billPhone);
        obj.AddParam("@billStateId", this.billStateId);
        obj.AddParam("@billCountryId", this.billCountryId);
        obj.AddParam("@email", this.email);
        //obj.AddParam("@password", this.password);
        obj.AddParam("@shippAddSameAsBillAdd", this.shippAddSameAsBillAdd);

        obj.AddParam("@sFName", this.sFName);
        obj.AddParam("@sLName", this.sLName);
        obj.AddParam("@sAddress1", this.sAddress1);
        obj.AddParam("@sAddress2", this.sAddress2);
        obj.AddParam("@sCity", this.sCity);
        obj.AddParam("@sZip", this.sZip);
        obj.AddParam("@sMobileCc", this.sMobileCc);
        obj.AddParam("@sMobile", this.sMobile);
        obj.AddParam("@sPhoneCc", this.sPhoneCc);
        obj.AddParam("@sPhoneAc", this.sPhoneAc);
        obj.AddParam("@sPhone", this.sPhone);
        obj.AddParam("@sStateId", this.sStateId);
        obj.AddParam("@sCountryId", this.sCountryId);   
       

        i = obj.ExecuteNonQuery();
        return i;
    }
    #endregion

    #region --- Get Customer ---
    public DataTable GetCustomer()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetCustomer";
        obj.AddParam("@id", this.id);     

        dt = obj.ExecuteTable();
        return dt;
    }  


    #endregion

    #region --- Delete Customer ---
    public int DeleteCustomer()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteCustomer";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion


    public string ToTitleCase(string str) { return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower()); }
}