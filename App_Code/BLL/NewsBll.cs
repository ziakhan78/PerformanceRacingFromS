using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for NewsBll
/// </summary>
public class NewsBll
{
    public NewsBll()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region --- Declared Variables ---

    private string news= "";
    private int id = 0;
    private DateTime startDate, endDate;

    public int Id { set { id = value; } get { return id; } }
    public string News { set { news = value; } get { return news; } }
    public DateTime StartDate { set { startDate = value; } get { return startDate; } }
    public DateTime EndDate { set { endDate = value; } get { return endDate; } }
   
   

    #endregion

    #region --- Add News ---
    public int AddNews()
    {                 


        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddNews";
        obj.AddParam("@news", this.news);
        obj.AddParam("@start_date", this.startDate);
        obj.AddParam("@end_date", this.endDate);

        i = obj.ExecuteNonQuery();
        return i;
    }

  

    #endregion

    #region --- Update News ---
    public int UpdateNews()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateNews";
        obj.AddParam("@id", this.id);
        obj.AddParam("@news", this.news);
        obj.AddParam("@start_date", this.startDate);
        obj.AddParam("@end_date", this.endDate);

        i = obj.ExecuteNonQuery();
        return i;
    }

 

    #endregion

    #region --- Get News ---
    public DataTable GetNewsById()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetNewsById";
        obj.AddParam("@id", this.id);     

        dt = obj.ExecuteTable();
        return dt;
    }


    public DataTable GetNewsList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetNewsList";       

        dt = obj.ExecuteTable();
        return dt;
    }
   

    #endregion

    #region --- Delete News ---
    public int DeleteNews()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteNews";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion
}