using System;
using System.Linq;
using System.Data;

/// <summary>
/// Summary description for TestiomonialsBll
/// </summary>
public class TestiomonialsBll
{
    public TestiomonialsBll()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region --- Declared Variables ---

    private string name, testimonial, designation, ipaddress, brand, product, image = "";
    private int id = 0;
    public int Id { set { id = value; } get { return id; } } 
    public string Name { set { name = value; } get { return name; } }
    public string Testimonial { set { testimonial = value; } get { return testimonial; } }
    public string Ipaddress { set { ipaddress = value; } get { return ipaddress; } }
    public string Designation { set { designation = value; } get { return designation; } }
    public string Brand { set { brand = value; } get { return brand; } }
    public string Product { set { product = value; } get { return product; } }
    public string Image { set { image = value; } get { return image; } }
   

    #endregion

    #region --- Add Testiomonial ---
    public int AddTestiomonial()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddTestimonial";
      
        obj.AddParam("@name", this.name);
        obj.AddParam("@testimonial", this.testimonial);      
        obj.AddParam("@designation", this.designation);
        obj.AddParam("@brand", this.brand);
        obj.AddParam("@product", this.product);
        obj.AddParam("@image", this.image);
        obj.AddParam("@ipaddress", this.ipaddress);

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Update Testiomonial ---
    public int UpdateTestiomonial()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateTestimonial";
        obj.AddParam("@id", this.id);
        obj.AddParam("@name", this.name);
        obj.AddParam("@testimonial", this.testimonial);
        obj.AddParam("@designation", this.designation);
        obj.AddParam("@brand", this.brand);
        obj.AddParam("@product", this.product);
        obj.AddParam("@image", this.image);

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Get Testiomonial ---
    public DataTable GetTestiomonialById()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetTestimonial";
        obj.AddParam("@id", this.id);      

        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetTestiomonialList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetTestimonialList";       

        dt = obj.ExecuteTable();
        return dt;
    }

    #endregion

    #region --- Delete Testiomonial ---
    public int DeleteTestiomonial()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteTestimonial";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion
}