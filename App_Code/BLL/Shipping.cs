using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Data.SqlClient;


/// <summary>
/// Summary description for Shipping
/// </summary>
public class Shipping
{
    private string country, state;
    private decimal minweight, maxweight, shippingcharges,_min_wt,_max_wt,_FrameShip,_NoFrameShip,_BookShip;
    private int pincodestart, pincodeend, countryid, stateid, shippingmethodid,_ship_map_id,_country_id;
     
    private DBconnection conn;

    public Shipping()
    {
        conn = new DBconnection();
    }

    public string CountryName
    {
        set
        {
            country = value;
            conn.AddParam("@countryname", value);
        }
    }

    public string StateName
    {
        set
        {
            state = value;
            conn.AddParam("@state", value);
        }
    }

    public int country_id
    {
        set
        {
            _country_id = value;
            conn.AddParam("@country_id", value);
        }
    }
    public int Ship_map_id
    {
        set
        {
            _ship_map_id = value;
            conn.AddParam("@ship_map_id", value);
        }
    }
    public decimal min_wt
    {
        set
        {
            _min_wt = value;
            conn.AddParam("@min_wt", value);
        }
    }
    public decimal max_wt
    {
        set
        {
            _max_wt = value;
            conn.AddParam("@max_wt", value);
        }
    }
    public decimal FrameShip
    {
        set
        {
            _FrameShip = value;
            conn.AddParam("@ShipCharge", value);
        }
    }
    public decimal NoFrameShip
    {
        set
        {
            _NoFrameShip = value;
            conn.AddParam("@NoFrameShip", value);
        }
    }
    public decimal BookShip
    {
        set
        {
            _BookShip = value;
            conn.AddParam("@BookShip", value);
        }
    }
    public decimal MinimumWeight
    {
        set
        {
            minweight = value;
            conn.AddParam("@minweight", value);
        }
    }

    public decimal MaximumWeight
    {
        set
        {
            maxweight = value;
            conn.AddParam("@maxweight", value);
        }
    }

    public decimal ShippingCharges
    {
        set
        {
            shippingcharges = value;
            conn.AddParam("@shippingcharges", value);
        }
    }

    public int PincodeStart
    {
        set
        {
            pincodestart = value;
            conn.AddParam("@pinstart", value);
        }
    }

    public int PincodeEnd
    {
        set
        {
            pincodeend = value;
            conn.AddParam("@pinend", value);
        }
    }

    public int CountryId
    {
        set
        {
            countryid = value;
            conn.AddParam("@countryid", value);
        }
    }

    public int StateId
    {
        set
        {
            stateid = value;
            conn.AddParam("@stateid", value);
        }
    }

    public int ShippingMethodId
    {
        set
        {
            shippingmethodid = value;
            //conn.AddParam("@shippingmethodid", value);
        }
    }

    public Boolean AddShipping()
    {       
        try
        {
            conn.SetCommandSP = "AddShipping_sp";
            if (conn.ExecuteNonQuery() > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }

    }

    public Boolean UpdateShipping()
    {       
        try
        {
            conn.SetCommandSP = "UpdateShipping_sp";
            
            if (conn.ExecuteNonQuery() > 0)
            {
                return true;
            }
            else { return false; }
        }
        catch
        {
            return false;
        }

    }

    public Boolean DeleteShipping()
    {       
        try
        {
            conn.SetCommandSP = "DeleteShipping_sp";
            if (conn.ExecuteNonQuery() > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }

    }

    public DataTable SelectShippingCharge()
    {
        DataTable dt = new DataTable();
        try
        {
            conn.SetCommandSP = "SelectShippingCharge_sp";
            
            dt = conn.ExecuteTable();
        }
        catch
        {

        }
        return dt;
    }

    public DataTable SelectShippingDetails()
    {
        DataTable dt = new DataTable();
        try
        {
            conn.SetCommandSP = "SelectShippingDetails_sp";
            conn.AddParam("@ship_map_id", this.shippingmethodid);
            dt = conn.ExecuteTable();
        }
        catch
        {

        }
        return dt;
    }
}
