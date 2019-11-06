using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for CityBLL
/// </summary>
public class CityBLL
{
	public CityBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    #region --- Declared Variables ---

    private string city, state, country, country_code, city_code = "";
    private int id = 0;

    public int Id { set { id = value; } get { return id; } }

    public string City { set { city = value; } get { return city; } }

    public string State { set { state = value; } get { return state; } }

    public string Country { set { country = value; } get { return country; } }

    public string Country_code { set { country_code = value; } get { return country_code; } }

    public string City_code { set { city_code = value; } get { return city_code; } }


    #endregion

    #region --- Add ---
    public int AddCity()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddCity";
        obj.AddParam("@city", this.city);
        obj.AddParam("@state", this.state);
        obj.AddParam("@country", this.country);
        obj.AddParam("@country_code", this.country_code);
        obj.AddParam("@city_code", this.city_code); 

        i = obj.ExecuteNonQuery();
        return i;
    }


   

    #endregion

    #region --- Update ---
    public int UpdateCity()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateCity";
        obj.AddParam("@id", this.id);
        obj.AddParam("@city", this.city);
        obj.AddParam("@state", this.state);
        obj.AddParam("@country", this.country);
        obj.AddParam("@country_code", this.country_code);
        obj.AddParam("@city_code", this.city_code);

        i = obj.ExecuteNonQuery();
        return i;
    }   

    #endregion

    #region --- Get ---
    public DataTable GetCity()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetCity";
        obj.AddParam("@id", this.id);     

        dt = obj.ExecuteTable();
        return dt;
    }

    

    #endregion

    #region --- Delete ---
    public int DeleteCity()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteCity";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion
}