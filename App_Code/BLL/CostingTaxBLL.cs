using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for CostingTaxBLL
/// </summary>
public class CostingTaxBLL
{
    public CostingTaxBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    #region --- Declared Variables ---

    private decimal basicCustomDuty, cvd, sad, customCess, frieghtCha, octroi, vat, marginForDealer, margin, vatCst;  

    private string ipaddress = "";
    private int id = 0;
    public int Id { set { id = value; } get { return id; } }
    public decimal BasicCustomDuty { set { basicCustomDuty = value; } get { return basicCustomDuty; } }
    public decimal Cvd { set { cvd = value; } get { return cvd; } }
    public decimal Sad { set { sad = value; } get { return sad; } }
    public decimal CustomCess { set { customCess = value; } get { return customCess; } }
    public decimal FrieghtCha { set { frieghtCha = value; } get { return frieghtCha; } }
    public decimal Octroi { set { octroi = value; } get { return octroi; } }
    public decimal Vat { set { vat = value; } get { return vat; } }
    public decimal MarginForDealer { set { marginForDealer = value; } get { return marginForDealer; } }
    public decimal Margin { set { margin = value; } get { return margin; } }
    public string Ipaddress { set { ipaddress = value; } get { return ipaddress; } }

    public decimal VatCst { set { vatCst = value; } get { return vatCst; } }


    #endregion

    #region --- Add ---
    public int AddCostingTaxMaster()
    {       

        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddCostingTaxMaster";
        obj.AddParam("@BasicCustomDuty", this.basicCustomDuty);
        obj.AddParam("@CVD", this.cvd);
        obj.AddParam("@SAD", this.sad);
        obj.AddParam("@CustomCess", this.customCess);
        obj.AddParam("@FrieghtCHA", this.frieghtCha);
        obj.AddParam("@Octroi", this.octroi);
        obj.AddParam("@VAT", this.vat);
        obj.AddParam("@MarginForDealer", this.marginForDealer);
        obj.AddParam("@Margin", this.margin);
        obj.AddParam("@ipaddress", this.ipaddress); 

        i = obj.ExecuteNonQuery();
        return i;
    }

    public int AddDealerCostingTaxMaster()
    {

        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddDealerCostingTaxMaster";
        obj.AddParam("@vat", this.vat);
        obj.AddParam("@discount", this.margin);
        obj.AddParam("@vat_cst", this.vatCst);       
        obj.AddParam("@ipaddress", this.ipaddress);

        i = obj.ExecuteNonQuery();
        return i;
    }


   

    #endregion

    #region --- Update ---
    public int UpdateCostingTaxMaster()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateCostingTaxMaster";
        //obj.AddParam("@id", this.id);
        obj.AddParam("@BasicCustomDuty", this.basicCustomDuty);
        obj.AddParam("@CVD", this.cvd);
        obj.AddParam("@SAD", this.sad);
        obj.AddParam("@CustomCess", this.customCess);
        obj.AddParam("@FrieghtCHA", this.frieghtCha);
        obj.AddParam("@Octroi", this.octroi);
        obj.AddParam("@VAT", this.vat);
        obj.AddParam("@MarginForDealer", this.marginForDealer);
        obj.AddParam("@Margin", this.margin);
       

        i = obj.ExecuteNonQuery();
        return i;
    }

    public int UpdateDealerCostingTaxMaster()
    {

        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateDealerCostingTaxMaster";
        obj.AddParam("@vat", this.vat);
        obj.AddParam("@discount", this.margin);
        obj.AddParam("@vat_cst", this.vatCst);       

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Get ---
    public DataTable GetCostingTaxMasterById()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetCostingTaxMasterById";
        obj.AddParam("@id", this.id);     

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetCostingTaxMaster()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetCostingTaxMaster";       

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetDealerCostingTaxMaster()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetDealerCostingTaxMaster";

        dt = obj.ExecuteTable();
        return dt;
    }

    

    #endregion

    #region --- Delete ---
    public int DeleteCostingTaxMaster()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteCostingTaxMaster";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion
}