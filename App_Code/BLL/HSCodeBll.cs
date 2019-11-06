using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for CostingTaxBLL
/// </summary>
public class HSCodeBll
{
    public HSCodeBll()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    #region --- Declared Variables ---

    private decimal customDuty, vat;  

    private string hsCode, ipaddress = "";
    private int id = 0;
    public int Id { set { id = value; } get { return id; } }
    public string HSCode { set { hsCode = value; } get { return hsCode; } }
    public decimal CustomDuty { set { customDuty = value; } get { return customDuty; } }
    public decimal Vat { set { vat = value; } get { return vat; } }
   
    public string Ipaddress { set { ipaddress = value; } get { return ipaddress; } }
 


    #endregion

    #region --- Add ---
    public int AddHSCodeMaster()
    {       

        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddHSCodeMaster";
        obj.AddParam("@HSCode", this.hsCode);
        obj.AddParam("@CustomDuty", this.customDuty);      
        obj.AddParam("@VAT", this.vat);      
        obj.AddParam("@ipaddress", this.ipaddress); 

        i = obj.ExecuteNonQuery();
        return i;
    }  

    #endregion

    #region --- Update ---
    public int UpdateHSCodeMaster()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateHSCodeMaster";
        obj.AddParam("@id", this.id);
        obj.AddParam("@HSCode", this.hsCode);
        obj.AddParam("@CustomDuty", this.customDuty);
        obj.AddParam("@VAT", this.vat);       

        i = obj.ExecuteNonQuery();
        return i;
    }   

    #endregion

    #region --- Get ---
    public DataTable GetHSCodeMasterById()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetHSCodeMasterById";
        obj.AddParam("@id", this.id);     

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetHSCodeMasterList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetHSCodeMasterList";       

        dt = obj.ExecuteTable();
        return dt;
    }
   
    

    #endregion

    #region --- Delete ---
    public int DeleteHSCodeMaster()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteHSCodeMaster";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion
}