using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_product_warranty_return_care : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {          
           GetWarrantyReturnCareText();           
        }
    }
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            UpdateWarrantyReturnCareText();
        }
    }
    private void GetWarrantyReturnCareText()
    {
        ProductsBLL obj = new ProductsBLL();
        DataTable dt = new DataTable();        

        dt = obj.GetWarrantyReturnCareText();
        if (dt.Rows.Count > 0)
        {
            txtWarranty.Content = dt.Rows[0]["warranty"].ToString();
            txtReturn.Content = dt.Rows[0]["returns"].ToString();
            txtCare.Content = dt.Rows[0]["care"].ToString();
        }
        else
        {
            txtWarranty.Content = "Warranty Text Comes Here.";
            txtReturn.Content = "Return Text Comes Here.";
            txtCare.Content = "Care Text Comes Here.";
        }
    }
    private void UpdateWarrantyReturnCareText()
    {
        try
        {           
            ProductsBLL obj = new ProductsBLL();
            obj.Warranty = txtWarranty.Content.ToString();
            obj.Return = txtReturn.Content.ToString();
            obj.Care = txtCare.Content.ToString();
            int i = obj.UpdateWarrantyReturnCareText();

            string jv = "<script>alert('Details Has Been Added Successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
        catch { }
    } 
   
}