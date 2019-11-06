using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for GroupsBLL
/// </summary>
public class GroupsBLL
{
	public GroupsBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    #region --- Declared Variables ---

    private string group_name = "";
    private int id = 0;

    public int Id { set { id = value; } get { return id; } }

    public string Group_name { set { group_name = value; } get { return group_name; } }    


    #endregion

    #region --- Add ---
    public int AddGroup()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddGroup";
        obj.AddParam("@group_name", this.group_name);       

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Update ---
    public int UpdateGroup()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateGroup";
        obj.AddParam("@id", this.id);
        obj.AddParam("@group_name", this.group_name);

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Get ---
    public DataTable GetGroup()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetGroup";
        obj.AddParam("@id", this.id);

        dt = obj.ExecuteTable();
        return dt;
    }


    #endregion

    #region --- Delete ---
    public int DeleteGroup()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteGroup";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion
}