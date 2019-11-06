using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for PincodeDeliveryBLL
/// </summary>
public class PincodeDeliveryBLL
{
    public PincodeDeliveryBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    #region --- Declared Variables ---

    private string city, state, pincode = "";
    private int id, transportationTime = 0;
    private bool cod, shipping, serviceAvailable;

    public int Id { set { id = value; } get { return id; } }
    public string City { set { city = value; } get { return city; } }
    public string State { set { state = value; } get { return state; } }
    public string Pincode { set { pincode = value; } get { return pincode; } }
    public bool ServiceAvailable { set { serviceAvailable = value; } get { return serviceAvailable; } }
    public bool Cod { set { cod = value; } get { return cod; } }
    public bool Shipping { set { shipping = value; } get { return shipping; } }
    public int TransportationTime { set { transportationTime = value; } get { return transportationTime; } }


    #endregion

    #region --- Add ---
    public int AddPincodeDelivery()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddPincodeDelivery";
        obj.AddParam("@city", this.city);
        obj.AddParam("@state", this.state);
        obj.AddParam("@pincode", this.pincode);
        obj.AddParam("@cod", this.cod);
        obj.AddParam("@free_shipping", this.shipping);
        obj.AddParam("@transportation_time", this.transportationTime);
        obj.AddParam("@status", this.serviceAvailable);

        i = obj.ExecuteNonQuery();
        return i;
    }


   

    #endregion

    #region --- Update ---
    public int UpdatePincodeDelivery()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdatePincodeDelivery";
        obj.AddParam("@id", this.id);
        obj.AddParam("@city", this.city);
        obj.AddParam("@state", this.state);
        obj.AddParam("@pincode", this.pincode);
        obj.AddParam("@cod", this.cod);
        obj.AddParam("@free_shipping", this.shipping);
        obj.AddParam("@transportation_time", this.transportationTime);
        obj.AddParam("@status", this.serviceAvailable);

        i = obj.ExecuteNonQuery();
        return i;
    }   

    #endregion

    #region --- Get ---
    public DataTable GetPincodeDelivery()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetPincodeDelivery";
        obj.AddParam("@id", this.id);     

        dt = obj.ExecuteTable();
        return dt;
    }

    

    #endregion

    #region --- Delete ---
    public int DeletePincodeDelivery()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeletePincodeDelivery";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion
}