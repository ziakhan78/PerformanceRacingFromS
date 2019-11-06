using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for AboutAaryansBLL
/// </summary>
public class AboutBLL
{
	public AboutBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region --- Declared Variables ---

    private string type, contents = "";
    private int id = 0;

    public int Id { set { id = value; } get { return id; } }

    public string Type { set { type = value; } get { return type; } }   
    public string Contents { set { contents = value; } get { return contents; } }   
   

    #endregion

    #region --- Add About Us ---
    public int AddAboutUs()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddAboutUs";      
        obj.AddParam("@contents", this.contents);      
        

        i = obj.ExecuteNonQuery();
        return i;
    }


    public int AddAboutKuldevi()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddAboutKuldevi";
        obj.AddParam("@contents", this.contents);


        i = obj.ExecuteNonQuery();
        return i;
    }

    public int AddAboutNative()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddAboutNative";
        obj.AddParam("@type", this.type);
        obj.AddParam("@contents", this.contents);


        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Update About Us ---
    public int UpdateAboutUs()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateAboutUs";
       // obj.AddParam("@id", this.id);        
        obj.AddParam("@contents", this.contents);
        //obj.AddParam("@images", this.images);

        i = obj.ExecuteNonQuery();
        return i;
    }

    public int UpdateAboutKuldevi()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateAboutKuldevi";
        // obj.AddParam("@id", this.id);        
        obj.AddParam("@contents", this.contents);
        //obj.AddParam("@images", this.images);

        i = obj.ExecuteNonQuery();
        return i;
    }

    public int UpdateAboutNative()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateAboutNative";
        obj.AddParam("@id", this.id);
        obj.AddParam("@type", this.type);
        obj.AddParam("@contents", this.contents);       

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Get About Us ---
    public DataTable GetAboutUs()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAboutUs";
        //obj.AddParam("@id", this.id);     

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetAboutKuldevi()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAboutKuldevi";
        //obj.AddParam("@id", this.id);     

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetAboutNative()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAboutNative";
        obj.AddParam("@id", this.id);     

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetAboutNativePlace()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAboutNativePlace";
        obj.AddParam("@type", this.type);

        dt = obj.ExecuteTable();
        return dt;
    }

    #endregion

    #region --- Delete About Aaryans ---
    public int DeleteAboutAaryans()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteAboutAaryans";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion
}