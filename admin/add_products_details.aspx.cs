using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Data.SqlTypes;

public partial class admin_add_products_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
        int pid = 0;       

        btnAdd.Visible = true;        

        if (!IsPostBack)
        {
            trSellingPrice.Visible = true;           
            trGender.Visible = false;
            trSize.Visible = false;
            chkBootSize.Visible = false;
           
            lblHeading.Text = "Add Products";
            BindDDLCategory();
           

            Session["FrontImage"] = null;

            if (Session["Admin"] != null)
            {
                if (Request.QueryString["pid"] != null)
                {                   
                    pid = Int32.Parse(Request.QueryString["pid"].ToString());
                    GetProducts(pid);                   
                }
            }

            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
   
    private void BindDDLCategory()
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetCategory";
        obj.AddParam("@cid", "");
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlCat.DataTextField = "cat_name";
            ddlCat.DataValueField = "cid";
            ddlCat.DataSource = dr;
            ddlCat.DataBind();
            //ddlCat.Items.Insert(0, "Select");

        }
    }
    private void BindDDLSubCategory(int cid)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetSubCategorybyCatId";
        obj.AddParam("@cid", cid);
        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlSubcategory.DataTextField = "subcat_name";
            ddlSubcategory.DataValueField = "sid";
            ddlSubcategory.DataSource = dr;
            ddlSubcategory.DataBind();
            ddlSubcategory.Items.Insert(0, "Select");
        }
    }       
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["pid"] != null)
            {
                int id = int.Parse(Request.QueryString["pid"].ToString());
                UpdateProducts(id);
            }
            else
            {
                AddProducts();
            }
        }
    }   
    private void GetProducts(int id)
    {
        ProductsBLL objP = new ProductsBLL();
        objP.Pid = id;
        DataTable dt = new DataTable();
        dt = objP.GetProduct();
        if (dt.Rows.Count > 0)
        {
            lblHeading.Text = "Edit Products";
            

            BindDDLCategory();
            BindDDLSubCategory(int.Parse(dt.Rows[0]["cid"].ToString()));

            ddlCat.SelectedValue = dt.Rows[0]["cid"].ToString();
            ddlSubcategory.SelectedValue = dt.Rows[0]["sid"].ToString();

            int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
            BindDDLSubCategory(cid);

            DataTable dtt = new DataTable();
            CategoryBLL objj = new CategoryBLL();
            objj.Cid = cid;
            dtt = objj.GetCategory();

            if (dtt.Rows.Count > 0)
            {
                string strType = dtt.Rows[0]["type"].ToString();
                if (strType == "Bike")
                {                   
                    trGender.Visible = false;
                    trSize.Visible = false;
                }
                if (strType == "Non Bike")
                {                  
                    trGender.Visible = false;
                    trSize.Visible = false;
                }
                if (strType == "Riding Gear")
                {                   
                    trGender.Visible = true;
                    trSize.Visible = true;
                }
            }

           

            rbtnGender.SelectedItem.Text = dt.Rows[0]["gender"].ToString();
           

            string size = dt.Rows[0]["size"].ToString();

            if (ddlSubcategory.SelectedItem.Text == "Boots")
            {
                ddlSize.Visible = false;
                chkBootSize.Visible = true;

                if (size != "")
                {
                    string[] arrSize = size.ToString().Split(',');
                    for (int i = 0; i <= arrSize.Length - 1; i++)
                    {
                        foreach (ListItem li in chkBootSize.Items)
                        {
                            if (li.Text == arrSize[i].Trim().ToString())
                            {
                                li.Selected = true;
                            }
                        }
                    }
                }
            }
            else
            {
                ddlSize.Visible = true;
                chkBootSize.Visible = false;

                if (size != "")
                {
                    string[] arrSize = size.ToString().Split(',');
                    for (int i = 0; i <= arrSize.Length - 1; i++)
                    {
                        foreach (ListItem li in ddlSize.Items)
                        {
                            if (li.Text == arrSize[i].Trim().ToString())
                            {
                                li.Selected = true;
                            }
                        }
                    }
                }
            }
                
           

            //ddlCurrency.SelectedItem.Text = dt.Rows[0]["currency_type"].ToString();
            //ddlCurrency.SelectedValue = dt.Rows[0]["currency_rate"].ToString();

            txtPrice.Text = dt.Rows[0]["price"].ToString();
            try
            {
                txtSellingPrice.Text = dt.Rows[0]["selling_price"].ToString();
            }
            catch { }
            //double sellingP = Convert.ToDouble(dt.Rows[0]["selling_price"].ToString());
            //lblSellingPrice.Text = string.Format("{0:n0}", sellingP);

            double dealerP = Convert.ToDouble(dt.Rows[0]["dealer_price"].ToString());
            lblDealerPrice.Text = string.Format("{0:n0}", dealerP);

            txtDealerDiscount.Text= dt.Rows[0]["dealer_discount"].ToString();
            lblDealerMargin.Text = string.Format("{0:n0}", double.Parse(dt.Rows[0]["margin_for_dealer"].ToString()));
            lblDealerPrice.Text = string.Format("{0:n0}", double.Parse(dt.Rows[0]["dealer_price"].ToString()));

            txtVat.Text = dt.Rows[0]["vat"].ToString();


           


            txtQuantity.Text = dt.Rows[0]["quantity"].ToString();
            

           

            string strStock = dt.Rows[0]["stock"].ToString();
            string dtime = dt.Rows[0]["delivery_time"].ToString();
            if (strStock == "Ex-Stock")
            {
               
            }
            else
            {
               
            }
            
        }
    }
    private void AddProducts()
    {
        try
        {
            int maxProductCode = GetMaxOrderNo();

            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

           
            bool boolIsExclusive = false;

            ProductsBLL objP = new ProductsBLL();

            objP.CId = int.Parse(ddlCat.SelectedValue.ToString());
            try
            {
                objP.SId = int.Parse(ddlSubcategory.SelectedValue.ToString());
            }
            catch { objP.SId = 0; }

           

          

            try
            {
                objP.Gender = rbtnGender.SelectedItem.Text.Trim().ToString();
            }
            catch { objP.Gender = ""; }

          
            objP.ProductCode = maxProductCode;
            //objP.Size = ddlSize.SelectedItem.Text.Trim().ToString();

            if (ddlSubcategory.SelectedItem.Text == "Boots")
            {
                try
                {
                    string size = "";
                    foreach (ListItem li in chkBootSize.Items)
                    {
                        if (li.Selected == true)
                        {
                            size = size + li.Text + ", ";
                        }
                    }
                    objP.Size = size.Remove(size.Length - 2);

                }
                catch { objP.Size = ""; }
            }
            else
            {
                try
                {
                    string size = "";
                    foreach (ListItem li in ddlSize.Items)
                    {
                        if (li.Selected == true)
                        {
                            size = size + li.Text + ", ";
                        }
                    }
                    objP.Size = size.Remove(size.Length - 2);

                }
                catch { objP.Size = ""; }

            }

            objP.Price = decimal.Parse(txtPrice.Text.Trim().ToString());
            objP.SellingPrice = decimal.Parse(txtSellingPrice.Text.Trim().ToString());

            try
            {               
                objP.DealerDiscount = Convert.ToDouble(txtDealerDiscount.Text.Trim().ToString());
                objP.MarginForDealer = Convert.ToDouble(lblDealerMargin.Text);
                objP.DealerPrice = decimal.Parse(lblDealerPrice.Text.Trim().ToString());
               
            }
            catch
            {               
                objP.DealerDiscount = 0;
                objP.MarginForDealer = 0;
                objP.DealerPrice = 0;
                
            }
            try
            {
                objP.Vat = decimal.Parse(txtVat.Text.Trim().ToString());
            }
            catch { objP.Vat = 0; }

              

            try
            {
                objP.Quantity = Convert.ToInt32(txtQuantity.Text.Trim().ToString());
            }
            catch { objP.Quantity = 0; }
           

            System.Data.SqlTypes.SqlDateTime nullDate;
            nullDate = SqlDateTime.Null;
            if (ddlCat.SelectedItem.Text == "Bargain Basement")
            {
                objP.IsExclusive = false;
                objP.Stock = "";
                objP.DeliveryTime = 0;               
                objP.DateOfImport = nullDate;
            }
            else
            { 
                objP.IsExclusive = boolIsExclusive; 
            }

            // Images
            try
            {
                string strImages = Session["FrontImage"].ToString();
                //strImages = strImages.Remove(strImages.Length - 1);
                objP.Images = strImages;
            }
            catch { objP.Images = ""; }

            objP.Ipaddress = ipaddress;
           
            

            int i = objP.AddProduct();

            if (i > 0)
            {
                // UploadImages(i);
                Clear();
                string jv = "<script>alert('New Product Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch (Exception ex){ throw; }
    }
    private void UpdateProducts(int id)
    {
        try
        {
           

            
            bool boolIsExclusive = false;

            ProductsBLL objP = new ProductsBLL();
            objP.Pid = id;
            objP.CId = int.Parse(ddlCat.SelectedValue.ToString());
            objP.SId = int.Parse(ddlSubcategory.SelectedValue.ToString());
                      
           

            try
            {
                objP.Gender = rbtnGender.SelectedItem.Text.Trim().ToString();
            }
            catch { objP.Gender = ""; }

         

            if (ddlSubcategory.SelectedItem.Text == "Boots")
            {
                try
                {
                    string size = "";
                    foreach (ListItem li in chkBootSize.Items)
                    {
                        if (li.Selected == true)
                        {
                            size = size + li.Text + ", ";
                        }
                    }
                    objP.Size = size.Remove(size.Length - 2);

                }
                catch { objP.Size = ""; }
            }
            else
            {
                try
                {
                    string size = "";
                    foreach (ListItem li in ddlSize.Items)
                    {
                        if (li.Selected == true)
                        {
                            size = size + li.Text + ", ";
                        }
                    }
                    objP.Size = size.Remove(size.Length - 2);

                }
                catch { objP.Size = ""; }

            }

            // Costing and Tax calculated and insert to products table 

            objP.Price = decimal.Parse(txtPrice.Text.Trim().ToString());
            objP.SellingPrice = decimal.Parse(txtSellingPrice.Text.Trim().ToString());

            try
            {
                objP.DealerDiscount = Convert.ToDouble(txtDealerDiscount.Text.Trim().ToString());
                objP.MarginForDealer = Convert.ToDouble(lblDealerMargin.Text);
                objP.DealerPrice = decimal.Parse(lblDealerPrice.Text.Trim().ToString());

            }
            catch
            {
                objP.DealerDiscount = 0;
                objP.MarginForDealer = 0;
                objP.DealerPrice = 0;

            }
            try
            {
                objP.Vat = decimal.Parse(txtVat.Text.Trim().ToString());
            }
            catch { objP.Vat = 0; }



           

            try
            {
                objP.Quantity = Convert.ToInt32(txtQuantity.Text.Trim().ToString());
            }
            catch { objP.Quantity = 0; }
           

            objP.IsExclusive = boolIsExclusive;

          
            


            int i = objP.UpdateProduct();

            if (i > 0)
            {
                Clear();
                showmsg("Product Has Been Updated Successfully", "ViewProducts.aspx");

                //string jv = "<script>alert('Pearl Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch(Exception ex) { string s = ex.Message; throw; }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
        Session["FrontImage"] = null;
        Session["basicCustomDuty"] = null;
        Session["cvd"] = null;
        Session["sad"] = null;
        Session["customCess"] = null;
        Session["frieghtCha"] = null;
        Session["octroi"] = null;
        Session["marginForDealer"] = null;
        Session["margin"] = null;
        Session["vat"] = null;
       
        lblDealerPrice.Text = "";

        
        txtPrice.Text = "";
        txtSellingPrice.Text = "";
        txtVat.Text = "";
       
        ddlCat.ClearSelection();
        ddlSubcategory.ClearSelection();
      
        ddlSize.SelectedIndex = 0;
        
        txtQuantity.Text = "";
      
        trGender.Visible = false;
        trSize.Visible = false;
       
        
    }
    protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
    {
       

        ddlSubcategory.ClearSelection();
        ddlSubcategory.Items.Clear();
        ddlSubcategory.Items.Insert(0, "Select");

        int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
        BindDDLSubCategory(cid);

        DataTable dt = new DataTable();
        CategoryBLL obj = new CategoryBLL();
        obj.Cid = cid;
        dt = obj.GetCategory();

        if (dt.Rows.Count > 0)
        {
            string strType = dt.Rows[0]["type"].ToString();
            if (strType == "Bike")
            {
               
                trGender.Visible = false;
                trSize.Visible = false;
            }
            if (strType == "Non Bike")
            {
               
                trGender.Visible = false;
                trSize.Visible = false;                
            }
            if (strType == "Riding Gear")
            {
              
                trGender.Visible = true;
                trSize.Visible = true;
            }

            if(ddlCat.SelectedItem.Text=="Bargain Basement")
            {
                trSellingPrice.Visible = true;

              
                trGender.Visible = false;
                trSize.Visible = false;              
                    
               

            }
        }


    }
   
    public void showmsg(string msg, string RedirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + RedirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }

   
    private void DeleteImage(int pid, string imageField)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteProductImage";
        obj.AddParam("@pid", pid);
        obj.AddParam("@image_field", imageField);

        if (obj.ExecuteNonQuery() > 0)
        {
            GetProducts(pid);
        }
    }
    protected void ddlSubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
        int sid = Int32.Parse(ddlSubcategory.SelectedValue.ToString());

        BindProductsBySubCat(sid);

        if (ddlSubcategory.SelectedItem.Text == "Boots")
        {
            chkBootSize.Visible = true;
            ddlSize.Visible = false;
        }
        else
        {
            chkBootSize.Visible = false;
            ddlSize.Visible = true;
        }

       

        BindVat(sid);
    }

    private void BindProductsBySubCat(int sid)
    {
        DataTable dt = new DataTable();
        ProductsBLL obj = new ProductsBLL();       
        obj.SId = sid;
        dt = obj.GetProductBySubCatId();
        if (dt.Rows.Count > 0)
        {
            ddlProducts.DataTextField = "product_name";
            ddlProducts.DataValueField = "pid";
            ddlProducts.DataSource = dt;
            ddlProducts.DataBind();
            ddlProducts.Items.Insert(0, "Select");
        }
    }


    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label lblImgPath = (Label)e.Item.FindControl("lblImgPath");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            System.Web.UI.WebControls.Image img1 = (System.Web.UI.WebControls.Image)e.Item.FindControl("img1");

            //string[] strImages = strImgPath.Split(',');
            //for (int i = 0; i <= strImages.Length - 1; i++)
            //{
            img1.Visible = true;
            img1.ImageUrl = "../ProductsImages/" + strImgPath.ToString();
            // }
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string strImages = "";
        string strUpdatedImages = "";
        if (e.CommandName == "Delete")
        {
            int id = Int32.Parse(Request.QueryString["pid"].ToString());
            string[] aImages = Session["FrontImage"].ToString().Split(',');
            strImages = e.CommandArgument.ToString();
            for (int i = 0; i <= aImages.Length - 1; i++)
            {
                if (strImages != aImages[i])
                {
                    strUpdatedImages = strUpdatedImages + aImages[i] + ",";
                }


            }

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateProductImages";
            if (aImages.Length == 1)
                obj.AddParam("@images", "");
            else
                obj.AddParam("@images", strUpdatedImages.Remove(strUpdatedImages.Length - 1));

            obj.AddParam("@pid", id);

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
              
            }
        }
    }
   

    private double GetCurrencyRate(int id)
    {
        double rate = 0;
        MastersBLL obj = new MastersBLL();
        DataTable dt = new DataTable();
        obj.Id = id;
        dt = obj.GetCurrencyRateById();
        rate = Convert.ToDouble(dt.Rows[0]["rate"].ToString());
        return rate;
    }
    
    private void GenerateBarcode(string strValue)
    {       
        System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
        using (Bitmap bitMap = new Bitmap(strValue.Length * 40, 80))
        {
            using (Graphics graphics = Graphics.FromImage(bitMap))
            {
                Font oFont = new Font("IDAutomationHC39M", 16);
                PointF point = new PointF(2f, 2f);
                SolidBrush blackBrush = new SolidBrush(Color.Black);
                SolidBrush whiteBrush = new SolidBrush(Color.White);
                graphics.FillRectangle(whiteBrush, 0, 0, bitMap.Width, bitMap.Height);
                graphics.DrawString("*" + strValue + "*", oFont, blackBrush, point);
            }
            using (MemoryStream ms = new MemoryStream())
            {
                bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                byte[] byteImage = ms.ToArray();
                Convert.ToBase64String(byteImage);
                imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                //imgBarcode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
            }            
        }
    }
    private int GetMaxOrderNo()
    {
        int order_no = 0;

        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "Select Max(product_code) as product_code from Products_Tbl";
            
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            order_no = int.Parse(dt.Rows[0]["product_code"].ToString());
        }

        catch
        {
            if (order_no == 0)
            {
                order_no = 1000;
            }
        }
        return order_no + 1;

    }

   

    protected void ddlBrands_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int maxProductCode = GetMaxOrderNo();
            string strValue = "";
            //string catCode = "";
            // string subCatCode = "";
            //string brands = "";

            int intCat = 0;
            int intSubCat = 0;
            int intBrand = 0;

            //string strCat = ddlCat.SelectedItem.Text.Trim().ToUpper();
            //string strSubCat = ddlSubcategory.SelectedItem.Text.Trim().ToUpper();
            //string strBrand = ddlBrands.SelectedItem.Text.Trim().ToUpper();

            intCat = int.Parse(ddlCat.SelectedValue.Trim().ToString());
            intSubCat = int.Parse(ddlSubcategory.SelectedValue.Trim().ToString());
           // intBrand = int.Parse(ddlBrands.SelectedValue.Trim().ToString());

           // int intColor = int.Parse(ddlColor.SelectedValue.ToString());

            //string[] output = strCat.Split(' ');
            //foreach (string s in output)
            //{
            //    catCode = catCode + s[0];
            //}

            //string[] subCatOutput = strSubCat.Split(' ');
            //foreach (string s in subCatOutput)
            //{
            //    subCatCode = subCatCode + s[0];
            //}


            //string[] brandOutput = strBrand.Split(' ');
            //foreach (string s in brandOutput)
            //{
            //    brands = brands + s[0];
            //}

            // strValue = catCode + subCatCode + brands + maxProductCode + intColor;
            strValue = intCat.ToString() + intSubCat.ToString() + intBrand.ToString() + maxProductCode.ToString();
           // txtSku.Text = strValue;
            // RadBarcode1.Text = strValue;
            GenerateBarcode(strValue);
        }
        catch
        { }
    }

   
    protected void txtDealerDiscount_TextChanged(object sender, EventArgs e)
    {
        double mrp, dealerDiscount, dealerPrice = 0;
        mrp = Convert.ToDouble(txtPrice.Text.Trim().ToString());
        dealerDiscount = Convert.ToDouble(txtDealerDiscount.Text.Trim().ToString());
        dealerPrice = (mrp * dealerDiscount) / 100;
        // lblDealerPrice.Text = string.Format("{0:n0}", dealerPrice);
        lblDealerMargin.Text = dealerPrice.ToString();
        lblDealerPrice.Text = (mrp - dealerPrice).ToString();
    }

    private void BindVat(int sid)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "select * from   View_SubCategory where sid=" + sid + "";
           
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                txtVat.Text = dt.Rows[0]["VAT"].ToString();
            }
        }
        catch { }
    }
}