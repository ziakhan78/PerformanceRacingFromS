using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for CartBLL
/// </summary>
public class CartBLL
{
    public CartBLL()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region --- Declared Variables ---

    private string cartId, categoryName, subCateogryName, catImage, subCatImage = "";
    private int cid,sid, displayOrder = 0;

    public int Cid { set { cid = value; } get { return cid; } }
    public int Sid { set { sid = value; } get { return sid; } }

    public int DisplayOrder { set { displayOrder = value; } get { return displayOrder; } }

    public string CategoryName { set { categoryName = value; } get { return categoryName; } }

    public string SubCateogryName { set { subCateogryName = value; } get { return subCateogryName; } }

    public string CatImage { set { catImage = value; } get { return catImage; } }

    public string SubCatImage { set { subCatImage = value; } get { return subCatImage; } }

    public string CartId { set { cartId = value; } get { return cartId; } }  


    #endregion

    #region --- Add ---

    public int AddCategory()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddCategory";
        obj.AddParam("@cat_name", this.categoryName);
        obj.AddParam("@cat_image", this.catImage);
        obj.AddParam("@display_order", this.displayOrder);      

        i = obj.ExecuteNonQuery();
        return i;
    }
    public int AddSubCategory()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddSubCategory";
        obj.AddParam("@cid", this.cid);
        obj.AddParam("@subcat_name", this.subCateogryName);
        obj.AddParam("@subcat_image", this.subCatImage);
        obj.AddParam("@display_order", this.displayOrder);

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Update ---

    public int UpdateCategory()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateCategory";
        obj.AddParam("@cid", this.cid);
        obj.AddParam("@cat_name", this.categoryName);
        obj.AddParam("@cat_image", this.catImage);       
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int UpdateSubCategory()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateSubCategory";
        obj.AddParam("@cid", this.cid);
        obj.AddParam("@sid", this.sid);
        obj.AddParam("@subcat_name", this.subCateogryName);
        obj.AddParam("@subcat_image", this.subCatImage);       
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Get ---

    public DataTable GetProductByCartId()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "sc_GetProductsByCartid";
        obj.AddParam("@cartid", this.cid);

        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetSubCategory()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetSubCategory";
        obj.AddParam("@sid", this.sid);

        dt = obj.ExecuteTable();
        return dt;
    }

    #endregion

    #region --- Delete ---

    public int DeleteCategory()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteCategory";
        obj.AddParam("@cid", this.cid);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int DeleteSubCategory()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteSubCategory";
        obj.AddParam("@sid", this.sid);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

}