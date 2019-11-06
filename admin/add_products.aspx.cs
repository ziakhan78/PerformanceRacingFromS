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
using System.Configuration;

public partial class admin_add_products : System.Web.UI.Page
{
    string ipaddress = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        int pid = 0;
        btnAdd.Visible = true;

        if (!IsPostBack)
        {
            DeleteTempQty();
            BindGrid(0);
            trQty.Visible = false;
            trFitment.Visible = true;
            trBrand.Visible = true;
            trDealer.Visible = true;         
            trBarcode.Visible = true;
            trExclusive.Visible = true;
            trStock.Visible = true;
            trImportedDate.Visible = true;

            importedDate.SelectedDate = DateTime.Now;
            chkModel.Visible = false;
            trGender.Visible = false;
            trSize.Visible = false;
            chkBootSize.Visible = false;

            trManufacturer.Visible = false;
            trModel.Visible = false;
            trDeliveryTime.Visible = false;
            trModel.Visible = false;
            lblHeading.Text = "Add Products";


            BindDDLCategory();
            BindManufacturer();
            BindHsnCode();

            //ddlBrands.DataSourceID = "DSBrands";
            //ddlBrands.DataBind();           

            Session["FrontImage"] = null;

            if (Session["Admin"] != null)
            {
                if (Request.QueryString["pid"] != null)
                {
                    RFVbrand.Enabled = false;
                    rfvManufacturer.Enabled = false;

                    pid = Int32.Parse(Request.QueryString["pid"].ToString());
                    GetProducts(pid);
                    BindImages(pid);
                }
            }

            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }

    private void DeleteTempQty()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteTempQty";
            obj.ExecuteNonQuery();
        }
        catch { }
    }
    private void BindManufacturer()
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT [id], [manufacturer_name] FROM [manufacturer_master_tbl] ORDER BY [manufacturer_name]";

        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlManufacturer.DataTextField = "manufacturer_name";
            ddlManufacturer.DataValueField = "id";
            ddlManufacturer.DataSource = dr;
            ddlManufacturer.DataBind();
            //ddlCat.Items.Insert(0, "Select");
        }
        else
        {
            ddlManufacturer.Items.Insert(0, "Select");
        }
    }

    private void BindBrands(int cid, string subCatName)
    {
        DataTable dt = new DataTable();
       // SqlDataReader dr;
        DBconnection obj = new DBconnection();
        //obj.SetCommandQry = "SELECT * FROM[brand_master_tbl] where cat_id=" + cid + " and sub_cat_names like %  " + subCatName + "% ";
        obj.SetCommandSP = "z_GetBrandsBysubCatNames";
        obj.AddParam("@cid", cid);
        obj.AddParam("@sub_cat_names", subCatName);

        dt = obj.ExecuteTable();

        if (dt.Rows.Count>0)
        {
            ddlBrands.DataTextField = "brand_name";
            ddlBrands.DataValueField = "id";
            ddlBrands.DataSource = dt;
            ddlBrands.DataBind();
            ddlBrands.Items.Insert(0, "Select");
        }
        else
        {
            ddlBrands.Items.Clear();
            ddlBrands.Items.Insert(0, "Select");
        }
    }
    //private void BindBrands(int cid, int subcat_id)
    //{
    //    SqlDataReader dr;
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandQry = "SELECT* FROM[brand_master_tbl] where cat_id=" + cid + " and subcat_id=" + subcat_id + " ORDER BY[brand_name]";

    //    dr = obj.ExecuteReader();

    //    if (dr.HasRows)
    //    {
    //        ddlBrands.DataTextField = "brand_name";
    //        ddlBrands.DataValueField = "id";
    //        ddlBrands.DataSource = dr;
    //        ddlBrands.DataBind();
    //        ddlBrands.Items.Insert(0, "Select");
    //    }
    //    else
    //    {
    //        ddlBrands.Items.Clear();
    //        ddlBrands.Items.Insert(0, "Select");
    //    }
    //}

    private void BindHsnCode()
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT VAT, HSCode FROM dbo.hs_code_master_tbl ORDER BY[HSCode]";

        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            ddlHsnCode.DataTextField = "HSCode";
            ddlHsnCode.DataValueField = "HSCode";
            ddlHsnCode.DataSource = dr;
            ddlHsnCode.DataBind();
            ddlHsnCode.Items.Insert(0, "Select");
        }
        else
        {
            ddlHsnCode.Items.Insert(0, "Select");
        }
    }


    private void BindModel(int manufacturerId)
    {
        SqlDataReader dr;
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT [id], [model] FROM [manufacturer_model_tbl] WHERE ([manufacturer_id] = '" + manufacturerId + "') ORDER BY [model]";

        dr = obj.ExecuteReader();

        if (dr.HasRows)
        {
            chkModel.Visible = true;
            chkModel.DataTextField = "model";
            chkModel.DataValueField = "id";
            chkModel.DataSource = dr;
            chkModel.DataBind();

            //foreach (ListItem li in chkModel.Items)
            //{
            //    li.Selected = true;
            //}
        }
        else
        {
            chkModel.Visible = false;
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
    private void BindImages(int pid)
    {
        try
        {
            ProductsBLL objP = new ProductsBLL();
            objP.Pid = pid;
            DataTable dt = new DataTable();
            dt = objP.GetProduct();
            if (dt.Rows.Count > 0)
            {
                string thumbnail = dt.Rows[0]["images"].ToString();
                if (thumbnail != "")
                {
                    Session["FrontImage"] = thumbnail;
                    string[] strImages = thumbnail.Split(',');

                    Array.Sort(strImages);

                    DataTable dtt = new DataTable("MyDataTable");
                    dtt.Columns.Add("images");
                    foreach (string value in strImages)
                    {
                        dtt.Rows.Add(value);
                    }

                    Repeater1.DataSource = dtt;
                    Repeater1.DataBind();
                }
            }
        }
        catch { }
    }
    protected void UploadImages()
    {
        string strSession = "";
        try
        {

            foreach (UploadedFile file in RadAsyncUpload2.UploadedFiles)
            {
                string strPath = "ProductsImages";
                string fileName = "";
                string ext = "";

                fileName = file.FileName;
                string strDate = System.DateTime.Now.ToString();
                strDate = strDate.Replace("/", "");
                strDate = strDate.Replace("-", "");
                strDate = strDate.Replace(":", "");
                strDate = strDate.Replace(" ", "");
                ext = fileName.Substring(fileName.LastIndexOf("."));
                string path = Server.MapPath("~/" + strPath + "/" + strDate + fileName);
                file.SaveAs(path);
                strSession = strSession + strDate + fileName + ",";

                //DBconnection obj = new DBconnection();
                //obj.SetCommandSP = "z_AddProductImages";
                //obj.AddParam("@product_id", id);
                //obj.AddParam("@image_path", fileName);
                //obj.ExecuteNonQuery();           
            }

            Session["FrontImage"] = Session["FrontImage"] + strSession.Remove(strSession.Length - 1);

        }
        catch { }

    }
    private void GetProducts(int id)
    {
        foreach (ListItem li in chkModel.Items)
        {
            li.Selected = false;
        }

        ProductsBLL objP = new ProductsBLL();
        objP.Pid = id;
        DataTable dt = new DataTable();
        dt = objP.GetProduct();
        if (dt.Rows.Count > 0)
        {
            lblHeading.Text = "Edit Products";

            //ddlBrands.DataSourceID = "DSBrands";
            //ddlBrands.DataBind();

            ddlColor.DataSourceID = "dsColors";
            ddlColor.DataBind();

            ddlCat.SelectedValue = dt.Rows[0]["cid"].ToString();

            int cid = Int32.Parse(ddlCat.SelectedValue.ToString());
            BindDDLSubCategory(cid);

            //ddlSubcategory.SelectedValue = dt.Rows[0]["sid"].ToString();


            int sid = Int32.Parse(dt.Rows[0]["sid"].ToString());
            ddlSubcategory.SelectedValue = sid.ToString();

            string strSubCat = ddlSubcategory.SelectedItem.Text.ToString();
            // BindBrands(cid, sid);
            BindBrands(cid, strSubCat);

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


            DataTable dtt = new DataTable();
            CategoryBLL objj = new CategoryBLL();
            objj.Cid = cid;
            dtt = objj.GetCategory();

            if (dtt.Rows.Count > 0)
            {
                GridView1.Columns[0].Visible = false;               
                tdSise.Visible = false;
                string strType = dtt.Rows[0]["type"].ToString();

                BindGrid(id);

                if (strType == "Bike")
                {
                    trFitment.Visible = true;
                    trGender.Visible = false;
                    trSize.Visible = true;
                }
                if (strType == "Non Bike")
                {
                    trModel.Visible = false;
                    trManufacturer.Visible = false;
                    trFitment.Visible = false;
                    trGender.Visible = false;
                    trSize.Visible = true;
                }
                if (strType == "Riding Gear")
                {
                    trModel.Visible = false;
                    trManufacturer.Visible = false;
                    trFitment.Visible = false;
                    trGender.Visible = true;
                    trSize.Visible = true;
                    tdSise.Visible = true;
                    GridView1.Columns[0].Visible = true;                   
                }

                if (strType == "Bargain Basement")
                {
                    trSize.Visible = false;
                }
            }

            string strFitment = dt.Rows[0]["fitment"].ToString();
            if (strFitment == "Universal")
            {
                trManufacturer.Visible = false;
                trModel.Visible = false;
                rbtnModel.SelectedIndex = 0;
                rbtnFitment.SelectedIndex = 0;
            }
            else
            {
                rbtnFitment.SelectedIndex = 1;
                trManufacturer.Visible = true;
            }

            ddlManufacturer.SelectedValue = dt.Rows[0]["manufacturer_id"].ToString();
            try
            {
                int manufacturerId = int.Parse(dt.Rows[0]["manufacturer_id"].ToString());
                BindModel(manufacturerId);
            }
            catch { }

            string strModelType = dt.Rows[0]["model_type"].ToString();
            if (strModelType == "All")
                rbtnModel.SelectedIndex = 0;
            else
                rbtnModel.SelectedIndex = 1;

            string strModel = dt.Rows[0]["model_name"].ToString();
            if (strModel != "")
            {
                chkModel.Visible = true;
                trModel.Visible = true;

                string[] arrModel = strModel.ToString().Split(',');
                for (int i = 0; i <= arrModel.Length - 1; i++)
                {
                    foreach (ListItem li in chkModel.Items)
                    {
                        if (li.Text == arrModel[i].Trim().ToString())
                        {
                            li.Selected = true;
                        }
                    }
                }
            }

            rbtnGender.SelectedItem.Text = dt.Rows[0]["gender"].ToString();

            ddlBrands.SelectedValue = dt.Rows[0]["brand_id"].ToString();

            txtProName.Text = dt.Rows[0]["product_name"].ToString();
            txtSku.Text = dt.Rows[0]["sku"].ToString();

            GenerateBarcode(txtSku.Text.Trim());

           // string size = dt.Rows[0]["size"].ToString();

            //if (ddlSubcategory.SelectedItem.Text == "Boots")
            //{
            //    ddlSize.Visible = false;
            //    chkBootSize.Visible = true;

            //    if (size != "")
            //    {
            //        string[] arrSize = size.ToString().Split(',');
            //        for (int i = 0; i <= arrSize.Length - 1; i++)
            //        {
            //            foreach (ListItem li in chkBootSize.Items)
            //            {
            //                if (li.Text == arrSize[i].Trim().ToString())
            //                {
            //                    li.Selected = true;
            //                }
            //            }
            //        }
            //    }
            //}
            //else
            //{
            //    ddlSize.Visible = true;
            //    chkBootSize.Visible = false;

            //    if (size != "")
            //    {
            //        string[] arrSize = size.ToString().Split(',');
            //        for (int i = 0; i <= arrSize.Length - 1; i++)
            //        {
            //            foreach (ListItem li in ddlSize.Items)
            //            {
            //                if (li.Text == arrSize[i].Trim().ToString())
            //                {
            //                    li.Selected = true;
            //                }
            //            }
            //        }
            //    }
            //}



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

            txtDealerDiscount.Text = dt.Rows[0]["dealer_discount"].ToString();
            lblDealerMargin.Text = string.Format("{0:n0}", double.Parse(dt.Rows[0]["margin_for_dealer"].ToString()));
            lblDealerPrice.Text = string.Format("{0:n0}", double.Parse(dt.Rows[0]["dealer_price"].ToString()));

            txtVat.Text = dt.Rows[0]["vat"].ToString();

            BindHsnCode();
            ddlHsnCode.SelectedValue = dt.Rows[0]["hs_code"].ToString();
            ddlHsnCode.SelectedItem.Text = dt.Rows[0]["hs_code"].ToString();


            //ddlColor.SelectedItem.Text = dt.Rows[0]["color"].ToString();

            //string colors = dt.Rows[0]["color"].ToString();
            //if (colors != "")
            //{
            //    string[] arrColors = colors.ToString().Split(',');
            //    for (int i = 0; i <= arrColors.Length - 1; i++)
            //    {
            //        foreach (ListItem li in ddlColor.Items)
            //        {
            //            if (li.Text == arrColors[i].Trim().ToString())
            //            {
            //                li.Selected = true;
            //            }
            //        }
            //    }
            //}


            //txtQuantity.Text = dt.Rows[0]["quantity"].ToString();
            txtProductWeight.Text = dt.Rows[0]["weight"].ToString();
            txtHeight.Text = dt.Rows[0]["height"].ToString();
            txtWidth.Text = dt.Rows[0]["width"].ToString();
            txtLenght.Text = dt.Rows[0]["length"].ToString();


            bool boolExclusive = Convert.ToBoolean(dt.Rows[0]["exclusive"].ToString());
            if (boolExclusive == true)
                chkIsExclusive.Checked = true;

            string strStock = dt.Rows[0]["stock"].ToString();
            string dtime = dt.Rows[0]["delivery_time"].ToString();
            if (strStock == "Ex-Stock")
            {
                rbtnStock.SelectedIndex = 0;
                ddlDeliveryTime.SelectedIndex = 0;
                trDeliveryTime.Visible = false;
            }
            else
            {
                rbtnStock.SelectedIndex = 1;
                trDeliveryTime.Visible = true;
                if (dtime != "0")
                    ddlDeliveryTime.SelectedValue = int.Parse(dtime).ToString();
            }

            //rbtnStock.SelectedItem.Text = dt.Rows[0]["stock"].ToString();




            txtDesc.Content = dt.Rows[0]["product_desc"].ToString();
            txtShortDesc.Text = dt.Rows[0]["short_desc"].ToString();
            txtYoutubeLink.Text = dt.Rows[0]["video_link"].ToString();

            txtProductTags.Text = dt.Rows[0]["product_tags"].ToString();

            //Session["basicCustomDuty"] = dt.Rows[0]["basic_custom_duty"].ToString();
            //Session["cvd"] = dt.Rows[0]["cvd"].ToString();
            //Session["sad"] = dt.Rows[0]["sad"].ToString();
            //Session["customCess"] = dt.Rows[0]["custom_cess"].ToString();
            //Session["frieghtCha"] = dt.Rows[0]["frieght_cha"].ToString();
            //Session["octroi"] = dt.Rows[0]["octroi"].ToString();
            //Session["vat"] = dt.Rows[0]["vat"].ToString();
            //Session["marginForDealer"] = dt.Rows[0]["margin_for_dealer"].ToString();
            //Session["margin"] = dt.Rows[0]["margin"].ToString();
            //Session["dealerVat"] = dt.Rows[0]["dealer_vat"].ToString();
            //Session["dealerDiscount"] = dt.Rows[0]["dealer_discount"].ToString();
            //Session["dealerVatCst"] = dt.Rows[0]["dealer_vat_cst"].ToString();
            // GenerateBarcode(txtSku.Text);
        }
    }
    private void AddProducts()
    {
        try
        {
            ipaddress = GetIpaddress();
            int maxProductCode = GetMaxOrderNo();

            if (RadAsyncUpload2.UploadedFiles.Count > 0)
            {
                Session["FrontImage"] = null;
                UploadImages();
            }

            bool boolIsExclusive = false;

            ProductsBLL objP = new ProductsBLL();

            objP.CId = int.Parse(ddlCat.SelectedValue.ToString());
            try
            {
                objP.SId = int.Parse(ddlSubcategory.SelectedValue.ToString());
            }
            catch { objP.SId = 0; }

            if (ddlCat.SelectedItem.Text.Trim() == "Bargain Basement")
            {
                trQty.Visible = true;
                objP.Quantity = Convert.ToInt32(txtQuantity.Text.Trim().ToString());
            }
            else
            {
                trQty.Visible = false;
                objP.Quantity = 0;
            }
                

            //if (ddlCat.SelectedItem.Text.Trim() != "Riding Gear")
            //{
            //    try
            //    {
            //        objP.Pid = 0;
            //        objP.Size = "";
            //        objP.Color = "";
            //        objP.AddedQty = Convert.ToInt32(txtQuantity.Text.Trim().ToString());
            //        objP.SoldQty = 0;
            //        objP.StockQty = Convert.ToInt32(txtQuantity.Text.Trim().ToString());
            //        objP.Ipaddress = ipaddress;

            //        objP.AddProductQuantity();
            //    }
            //    catch
            //    {
            //        objP.Quantity = 0;
            //    }
            //}

            objP.Fitment = rbtnFitment.SelectedItem.Text.Trim().ToString();
            //objP.Manufacturer = ddlManufacturer.SelectedItem.Text.Trim().ToString();
            try
            {
                objP.ManufacturerId = int.Parse(ddlManufacturer.SelectedValue.ToString());
            }
            catch { objP.ManufacturerId = 0; }
            objP.ModelType = rbtnModel.SelectedItem.Text.Trim().ToString();

            try
            {
                string strModel = "";
                foreach (ListItem li in chkModel.Items)
                {
                    if (li.Selected == true)
                    {
                        strModel = strModel + li.Text + ", ";
                    }
                }
                objP.Model = strModel.Remove(strModel.Length - 2);

            }
            catch { objP.Model = ""; }

            try
            {
                //objP.Brand = ddlBrands.SelectedItem.Text.Trim().ToString();
                objP.BrandId = int.Parse(ddlBrands.SelectedValue.ToString());
            }

            catch { objP.BrandId = 0; }

            try
            {
                objP.Gender = rbtnGender.SelectedItem.Text.Trim().ToString();
            }
            catch { objP.Gender = ""; }

            objP.ProductName = txtProName.Text.Trim().ToString();
            objP.Sku = txtSku.Text.Trim().ToString();
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

            objP.HsCode = ddlHsnCode.SelectedItem.Text.Trim().ToString();


            //try
            //{
            //    // Costing and Tax calculated and insert to products table 

            //    objP.CurrencyType = ddlCurrency.SelectedItem.Text.Trim().ToString();
            //    objP.CurrencyRate = Convert.ToDecimal(ddlCurrency.SelectedValue.ToString());

            //    objP.Price = decimal.Parse(txtPrice.Text.Trim().ToString());
            //    objP.BasicCustomDuty = Convert.ToDouble(Session["basicCustomDuty"].ToString());
            //    objP.Cvd = Convert.ToDouble(Session["cvd"].ToString());
            //    objP.Sad = Convert.ToDouble(Session["sad"].ToString());
            //    objP.CustomCess = Convert.ToDouble(Session["customCess"].ToString());
            //    objP.FrieghtCha = Convert.ToDouble(Session["frieghtCha"].ToString());
            //    objP.Octroi = Convert.ToDouble(Session["octroi"].ToString());
            //    objP.Vat = Convert.ToDouble(Session["vat"].ToString());
            //    objP.MarginForDealer = Convert.ToDouble(Session["marginForDealer"].ToString());
            //    objP.Margin = Convert.ToDouble(Session["margin"].ToString());
            //    objP.SellingPrice = decimal.Parse(lblSellingPrice.Text.Trim().ToString());

            //    // for dealer

            //    objP.DealerVat = Convert.ToDouble(Session["dealerVat"].ToString());
            //    objP.DealerDiscount = Convert.ToDouble(Session["dealerDiscount"].ToString());
            //    objP.DealerVatCst = Convert.ToDouble(Session["dealerVatCst"].ToString());
            //    objP.DealerPrice = decimal.Parse(lblDealerPrice.Text.Trim().ToString());
            //}
            //catch
            //{
            //    objP.CurrencyType = "";
            //    objP.CurrencyRate = 0;
            //    objP.Price = 0;
            //    objP.BasicCustomDuty = 0;
            //    objP.Cvd = 0;
            //    objP.Sad = 0;
            //    objP.CustomCess = 0;
            //    objP.FrieghtCha = 0;
            //    objP.Octroi = 0;
            //    objP.Vat = 0;
            //    objP.MarginForDealer = 0;
            //    objP.Margin = 0;
            //    objP.SellingPrice = 0;

            //    // for dealer

            //    objP.DealerVat = 0;
            //    objP.DealerDiscount = 0;
            //    objP.DealerVatCst = 0;
            //    objP.DealerPrice = 0;

            //}

            //objP.Color = ddlColor.SelectedItem.Text.Trim().ToString();
            try
            {
                string colors = "";
                foreach (ListItem li in ddlColor.Items)
                {
                    if (li.Selected == true)
                    {
                        colors = colors + li.Text + ", ";
                    }
                }
                objP.Color = colors.Remove(colors.Length - 2);

            }
            catch { objP.Color = ""; }




            try
            {
                objP.Weight = Convert.ToDecimal(txtProductWeight.Text.Trim().ToString());
            }
            catch { objP.Weight = 0; }
            try
            {
                objP.Height = Convert.ToDecimal(txtHeight.Text.Trim().ToString());
            }
            catch { objP.Height = 0; }
            try
            {
                objP.Width = Convert.ToDecimal(txtWidth.Text.Trim().ToString());
            }
            catch { objP.Width = 0; }
            try
            {
                objP.Length = Convert.ToDecimal(txtLenght.Text.Trim().ToString());
            }
            catch
            { objP.Length = 0; }

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
                objP.DateOfImport = DateTime.Parse(importedDate.SelectedDate.ToString());

                if (chkIsExclusive.Checked == true)
                    boolIsExclusive = true;
                else
                    boolIsExclusive = false;

                objP.IsExclusive = boolIsExclusive;

                string stock = rbtnStock.SelectedValue.ToString();

                objP.Stock = rbtnStock.SelectedItem.Text.Trim().ToString();

                if (stock == "0")
                {
                    objP.DeliveryTime = 0;
                }
                else
                {
                    try
                    {
                        objP.DeliveryTime = Convert.ToInt32(ddlDeliveryTime.SelectedItem.Text.Trim().ToString());
                    }
                    catch { objP.DeliveryTime = 0; }
                }
            }



            objP.ShortDesc = txtShortDesc.Text.Trim().ToString();
            objP.ProductDesc = txtDesc.Content;
            objP.ProductTags = txtProductTags.Text.Trim().ToString();


            //string strColor = "";
            //foreach (ListItem li in chkColor.Items)
            //{
            //    if (li.Selected == true)
            //    {
            //        strColor = strColor + li.Text + ", ";
            //    }
            //}
            //objP.Color = strColor.TrimEnd(',').ToString();


            objP.VideoLink = txtYoutubeLink.Text.Trim().ToString();


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
                int pid = GetProductId();
                UpdateProductQtyTbl(pid);

                //string category = ddlCat.SelectedItem.Text;
                //if(category=="Riding Gear")
                //{
                //    int pid = GetProductId();
                //    UpdateProductQtyTbl(pid);
                //}
                // UploadImages(i);
                Clear();
                string jv = "<script>alert('New Product Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch (Exception ex) { throw; }
    }
    private void UpdateProducts(int id)
    {
        try
        {
            if (RadAsyncUpload2.UploadedFiles.Count > 0)
            {
                Session["FrontImage"] = Session["FrontImage"] + ",";
                UploadImages();
            }



            bool boolIsExclusive = false;

            ProductsBLL objP = new ProductsBLL();
            objP.Pid = id;
            objP.CId = int.Parse(ddlCat.SelectedValue.ToString());
            objP.SId = int.Parse(ddlSubcategory.SelectedValue.ToString());

            objP.Fitment = rbtnFitment.SelectedItem.Text.Trim().ToString();
            //objP.Manufacturer = ddlManufacturer.SelectedItem.Text.Trim().ToString();
            objP.ManufacturerId = int.Parse(ddlManufacturer.SelectedValue.ToString());
            objP.ModelType = rbtnModel.SelectedItem.Text.Trim().ToString();

            try
            {
                string strModel = "";
                foreach (ListItem li in chkModel.Items)
                {
                    if (li.Selected == true)
                    {
                        strModel = strModel + li.Text + ", ";
                    }
                }
                objP.Model = strModel.Remove(strModel.Length - 2);

            }
            catch { objP.Model = ""; }

            try
            {
                //objP.Brand = ddlBrands.SelectedItem.Text.Trim().ToString();
                objP.BrandId = int.Parse(ddlBrands.SelectedValue.ToString());
            }

            catch { objP.BrandId = 0; }

            try
            {
                objP.Gender = rbtnGender.SelectedItem.Text.Trim().ToString();
            }
            catch { objP.Gender = ""; }

            objP.ProductName = txtProName.Text.Trim().ToString();
            objP.Sku = txtSku.Text.Trim().ToString();
            //objP.Size = ddlSize.SelectedItem.Text.Trim().ToString();

            //if (ddlSubcategory.SelectedItem.Text == "Boots")
            //{
            //    try
            //    {
            //        string size = "";
            //        foreach (ListItem li in chkBootSize.Items)
            //        {
            //            if (li.Selected == true)
            //            {
            //                size = size + li.Text + ", ";
            //            }
            //        }
            //        objP.Size = size.Remove(size.Length - 2);

            //    }
            //    catch { objP.Size = ""; }
            //}
            //else
            //{
            //    try
            //    {
            //        string size = "";
            //        foreach (ListItem li in ddlSize.Items)
            //        {
            //            if (li.Selected == true)
            //            {
            //                size = size + li.Text + ", ";
            //            }
            //        }
            //        objP.Size = size.Remove(size.Length - 2);

            //    }
            //    catch { objP.Size = ""; }

            //}

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

            objP.HsCode = ddlHsnCode.SelectedItem.Text.Trim().ToString();

            //try
            //{
            //    objP.Price = decimal.Parse(txtPrice.Text.Trim().ToString());
            //    objP.DealerDiscount = Convert.ToDouble(txtDealerDiscount.Text.Trim().ToString());
            //    objP.MarginForDealer = Convert.ToDouble(lblDealerMargin.Text);
            //    objP.DealerPrice = decimal.Parse(lblDealerPrice.Text.Trim().ToString());
            //    objP.Vat = decimal.Parse(txtVat.Text.Trim().ToString());
            //}
            //catch
            //{ }

            //try
            //{
            //    // Costing and Tax calculated and insert to products table 

            //    objP.CurrencyType = ddlCurrency.SelectedItem.Text.Trim().ToString();
            //    objP.CurrencyRate = Convert.ToDecimal(ddlCurrency.SelectedValue.ToString());

            //    objP.Price = decimal.Parse(txtPrice.Text.Trim().ToString());
            //    objP.BasicCustomDuty = Convert.ToDouble(Session["basicCustomDuty"].ToString());
            //    objP.Cvd = Convert.ToDouble(Session["cvd"].ToString());
            //    objP.Sad = Convert.ToDouble(Session["sad"].ToString());
            //    objP.CustomCess = Convert.ToDouble(Session["customCess"].ToString());
            //    objP.FrieghtCha = Convert.ToDouble(Session["frieghtCha"].ToString());
            //    objP.Octroi = Convert.ToDouble(Session["octroi"].ToString());
            //    objP.Vat = Convert.ToDouble(Session["vat"].ToString());
            //    objP.MarginForDealer = Convert.ToDouble(Session["marginForDealer"].ToString());
            //    objP.Margin = Convert.ToDouble(Session["margin"].ToString());
            //    objP.SellingPrice = decimal.Parse(lblSellingPrice.Text.Trim().ToString());

            //    // for dealer

            //    objP.DealerVat = Convert.ToDouble(Session["dealerVat"].ToString());
            //    objP.DealerDiscount = Convert.ToDouble(Session["dealerDiscount"].ToString());
            //    objP.DealerVatCst = Convert.ToDouble(Session["dealerVatCst"].ToString());
            //    objP.DealerPrice = decimal.Parse(lblDealerPrice.Text.Trim().ToString());
            //}
            //catch
            //{
            //    objP.CurrencyType = "";
            //    objP.CurrencyRate = 0;
            //    objP.Price = 0;
            //    objP.BasicCustomDuty = 0;
            //    objP.Cvd = 0;
            //    objP.Sad = 0;
            //    objP.CustomCess = 0;
            //    objP.FrieghtCha = 0;
            //    objP.Octroi = 0;
            //    objP.Vat = 0;
            //    objP.MarginForDealer = 0;
            //    objP.Margin = 0;
            //    objP.SellingPrice = 0;

            //    // for dealer

            //    objP.DealerVat = 0;
            //    objP.DealerDiscount = 0;
            //    objP.DealerVatCst = 0;
            //    objP.DealerPrice = 0;

            //}

            //objP.Color = ddlColor.SelectedItem.Text.Trim().ToString();
            try
            {
                string colors = "";
                foreach (ListItem li in ddlColor.Items)
                {
                    if (li.Selected == true)
                    {
                        colors = colors + li.Text + ", ";
                    }
                }
                objP.Color = colors.Remove(colors.Length - 2);

            }
            catch { objP.Color = ""; }

            try
            {
                objP.Quantity = Convert.ToInt32(txtQuantity.Text.Trim().ToString());
            }
            catch { objP.Quantity = 0; }
            try
            {
                objP.Weight = Convert.ToDecimal(txtProductWeight.Text.Trim().ToString());
            }
            catch { objP.Weight = 0; }
            try
            {
                objP.Height = Convert.ToDecimal(txtHeight.Text.Trim().ToString());
            }
            catch { objP.Height = 0; }
            try
            {
                objP.Width = Convert.ToDecimal(txtWidth.Text.Trim().ToString());
            }
            catch { objP.Width = 0; }
            try
            {
                objP.Length = Convert.ToDecimal(txtLenght.Text.Trim().ToString());
            }
            catch
            { objP.Length = 0; }


            if (chkIsExclusive.Checked == true)
                boolIsExclusive = true;
            else
                boolIsExclusive = false;

            objP.IsExclusive = boolIsExclusive;

            string stock = rbtnStock.SelectedValue.ToString();
            objP.Stock = rbtnStock.SelectedItem.Text.Trim().ToString();

            if (stock == "0")
            {
                objP.DeliveryTime = 0;
            }
            else
            {
                try
                {
                    objP.DeliveryTime = Convert.ToInt32(ddlDeliveryTime.SelectedItem.Text.Trim().ToString());
                }
                catch { objP.DeliveryTime = 0; }
            }

            objP.ShortDesc = txtShortDesc.Text.Trim().ToString();
            objP.ProductDesc = txtDesc.Content;
            objP.ProductTags = txtProductTags.Text.Trim().ToString();


            //string strColor = "";
            //foreach (ListItem li in chkColor.Items)
            //{
            //    if (li.Selected == true)
            //    {
            //        strColor = strColor + li.Text + ", ";
            //    }
            //}
            //objP.Color = strColor.TrimEnd(',').ToString();


            objP.VideoLink = txtYoutubeLink.Text.Trim().ToString();


            // Images
            try
            {
                string strImages = Session["FrontImage"].ToString();
                //strImages = strImages.Remove(strImages.Length - 1);
                objP.Images = strImages;
            }
            catch { objP.Images = ""; }


            int i = objP.UpdateProduct();

            if (i > 0)
            {
                string category = ddlCat.SelectedItem.Text;
                if (category != "Bargain Basement")
                {
                    UpdateProductQtyTbl(id);
                }
                Clear();
                showmsg("Product Has Been Updated Successfully", "ViewProducts.aspx");

                //string jv = "<script>alert('Pearl Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch (Exception ex) { string s = ex.Message; throw; }
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
        //lblSellingPrice.Text = "";
        // lblPurchasePrice.Text = "";


        txtDesc.Content = "";
        txtPrice.Text = "";
        txtSellingPrice.Text = "";
        txtVat.Text = "";
        txtProName.Text = "";
        txtSku.Text = "";
        ddlCat.ClearSelection();
        ddlSubcategory.ClearSelection();
        rbtnFitment.SelectedIndex = 0;
        ddlManufacturer.SelectedIndex = 0;
        rbtnModel.SelectedIndex = 0;
        ddlBrands.SelectedIndex = 0;
        ddlSize.SelectedIndex = 0;

        txtQuantity.Text = "";
        txtProductWeight.Text = "";
        txtHeight.Text = "";
        txtWidth.Text = "";
        txtLenght.Text = "";

        //chkIsExclusive.
        rbtnStock.SelectedIndex = 0;
        ddlDeliveryTime.SelectedIndex = 0;

        txtShortDesc.Text = "";
        txtYoutubeLink.Text = "";
        txtProductTags.Text = "";


        chkModel.Visible = false;
        trGender.Visible = false;
        trSize.Visible = false;
        trManufacturer.Visible = false;
        trModel.Visible = false;
        trDeliveryTime.Visible = false;
        trModel.Visible = false;

        ddlHsnCode.SelectedIndex = 0;

        imgBarcode.ImageUrl = "";
        ddlColor.ClearSelection();

        // dealers 
        txtDealerDiscount.Text = "";
        lblDealerMargin.Text = "";
        lblDealerPrice.Text = "";


    }
    protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlManufacturer.SelectedIndex = 0;
        chkModel.ClearSelection();
        rbtnModel.SelectedIndex = 0;
        ddlBrands.SelectedIndex = 0;

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
            GridView1.Columns[0].Visible = false;
            tdSise.Visible = false;

            string strType = dt.Rows[0]["type"].ToString();
            if (strType == "Bike")
            {
                trFitment.Visible = true;
                trGender.Visible = false;
                trSize.Visible = true;
            }
            if (strType == "Non Bike")
            {
                trModel.Visible = false;
                trManufacturer.Visible = false;
                trFitment.Visible = false;
                trGender.Visible = false;
                trSize.Visible = true;
            }
            if (strType == "Riding Gear")
            {
                GridView1.Columns[0].Visible = true;
                tdSise.Visible = true;
                trModel.Visible = false;
                trManufacturer.Visible = false;
                trFitment.Visible = false;
                trGender.Visible = true;
                trSize.Visible = true;
            }

            if (ddlCat.SelectedItem.Text == "Bargain Basement")
            {
               
                trModel.Visible = false;
                trManufacturer.Visible = false;
                trFitment.Visible = false;
                trGender.Visible = false;
                trSize.Visible = false;
                trBrand.Visible = false;
                trDealer.Visible = false;
                trBarcode.Visible = false;
                trExclusive.Visible = false;
                trStock.Visible = false;
                trImportedDate.Visible = false;

            }
        }


    }
    protected void CVpro_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["pid"] != null)
        {
            CVpro.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select product_name from products_tbl where product_name='" + txtProName.Text.Trim().ToString() + "'";
                object res = obj.ExecuteScalar();
                if (res != null)
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }
            catch
            {
                args.IsValid = true;
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

    //protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    //{
    //    for (int i = 1; i <= RadAsyncUpload1.UploadedFiles.Count; i++)
    //    {

    //        //foreach (UploadedFile f in RadAsyncUpload1.UploadedFiles)
    //        //{
    //            string strPath = "ProductsImages";
    //            string fileName = "";
    //            string ext = "";
    //            fileName = e.File.FileName;
    //            string strDate = System.DateTime.Now.ToString();
    //            strDate = strDate.Replace("/", "");
    //            strDate = strDate.Replace("-", "");
    //            strDate = strDate.Replace(":", "");
    //            strDate = strDate.Replace(" ", "");
    //            ext = fileName.Substring(fileName.LastIndexOf("."));
    //            fileName = fileName + strDate + ext;
    //            string path = Server.MapPath("~/" + strPath + "/" + fileName);
    //            Session["FrontImage"] = fileName;
    //            e.File.SaveAs(path, true);
    //       // }
    //    }      
    //}      
    //protected void btnDelProspective2_Click(object sender, ImageClickEventArgs e)
    //{
    //    if (Request.QueryString["pid"] != null)
    //    {
    //        int pid = Int32.Parse(Request.QueryString["pid"].ToString());
    //        DeleteImage(pid, "image5");

    //        img5.Visible = false;
    //        btnDelProspective2.Visible = false;

    //        lblPrespective2.Visible = false;
    //    }
    //}
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
       // int sid = Int32.Parse(ddlSubcategory.SelectedValue.ToString());
//  BindBrands(cid, sid);
        string subCat = ddlSubcategory.SelectedItem.Text.ToString();
        BindBrands(cid, subCat);


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

        //BindDDLSubSubCategory(cid, sid);

        //BindVat(sid);
    }

    //protected void RadAsyncUpload2_FileUploaded(object sender, FileUploadedEventArgs e)
    //{
    //    foreach (UploadedFile file in RadAsyncUpload2.UploadedFiles)
    //    {

    //        string path = Server.MapPath("ProductsImages/");

    //        file.SaveAs(path + file.FileName);

    //    }


    //   //// foreach (UploadedFile f in RadAsyncUpload2.UploadedFiles)
    //   // for (int i = 0; i < RadAsyncUpload2.UploadedFiles.Count; i++)

    //   // {
    //   //     try
    //   //     {
    //   //         string strPath = "ProductsImages";
    //   //         string fileName = "";
    //   //         string ext = "";
    //   //         fileName = e.File.FileName;
    //   //         string strDate = System.DateTime.Now.ToString();
    //   //         strDate = strDate.Replace("/", "");
    //   //         strDate = strDate.Replace("-", "");
    //   //         strDate = strDate.Replace(":", "");
    //   //         strDate = strDate.Replace(" ", "");
    //   //         ext = fileName.Substring(fileName.LastIndexOf("."));
    //   //         //fileName = fileName + strDate +ext;
    //   //         string path = Server.MapPath("~/" + strPath + "/" + fileName);

    //   //         e.File.SaveAs(path, true);

    //   //         Session["FrontImage"] = Session["FrontImage"] + fileName + ",";
    //   //        // Session["FrontImage"] = fileName + ",";
    //   //     }
    //   //     catch { }
    //   // }
    //}

    protected void CVsku_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["pid"] != null)
        {
            CVsku.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select sku from products_tbl where sku='" + txtSku.Text.Trim().ToString() + "'";
                object res = obj.ExecuteScalar();
                if (res != null)
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }
            catch
            {
                args.IsValid = true;
            }
        }
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        //HiddenField hf = e.Item.FindControl("HiddenField1") as HiddenField;
        //if (hf != null)
        //{
        //    string val = hf.Value;
        //    Image img = e.Item.FindControl("Image1") as Image;
        //    img.ImageUrl = "~/image" + val + ".jpg";
        //}



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
                BindImages(id);
            }
        }
    }
    protected void ddlManufacturer_SelectedIndexChanged(object sender, EventArgs e)
    {
        trModel.Visible = true;
        int manufacturerId = int.Parse(ddlManufacturer.SelectedValue.ToString());
        BindModel(manufacturerId);
    }
    protected void rbtnModel_SelectedIndexChanged(object sender, EventArgs e)
    {
        chkModel.Visible = true;

        if (rbtnModel.SelectedValue == "0")
        {
            foreach (ListItem li in chkModel.Items)
            {
                li.Selected = true;
            }
        }
        else
        {
            foreach (ListItem li in chkModel.Items)
            {
                li.Selected = false;
            }
        }
    }
    protected void rbtnFitment_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnFitment.SelectedValue == "0")
        {
            trManufacturer.Visible = false;
            trModel.Visible = false;
            rbtnModel.SelectedIndex = 0;
        }
        else
        {
            trManufacturer.Visible = true;
        }
    }
    protected void rbtnStock_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnStock.SelectedValue == "0")
        {
            rbtnStock.SelectedIndex = 0;
            trDeliveryTime.Visible = false;
        }
        else
        {
            trDeliveryTime.Visible = true;
        }
    }

    //protected void txtPrice_TextChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        CostingTaxBLL obj = new CostingTaxBLL();
    //        DataTable dt = new DataTable();
    //        dt = obj.GetCostingTaxMaster();
    //        if (dt.Rows.Count > 0)
    //        {
    //            double basicCustomDuty, cvd, sad, customCess, frieghtCha, octroi, marginForDealer, margin, vat, purchasePrice, totalCost, beforeVat, mrp, currencyRate,
    //                bcdPer, cvdPer, sadPer, customCessPer, frieghtChaPer, octroiPer, vatPer, marginForDealerPer, marginPer;

    //            bcdPer = Convert.ToDouble(dt.Rows[0]["BasicCustomDuty"].ToString());
    //            cvdPer = Convert.ToDouble(dt.Rows[0]["CVD"].ToString());
    //            sadPer = Convert.ToDouble(dt.Rows[0]["SAD"].ToString());
    //            customCessPer = Convert.ToDouble(dt.Rows[0]["CustomCess"].ToString());
    //            frieghtChaPer = Convert.ToDouble(dt.Rows[0]["FrieghtCHA"].ToString());
    //            octroiPer = Convert.ToDouble(dt.Rows[0]["Octroi"].ToString());
    //            vatPer = Convert.ToDouble(dt.Rows[0]["VAT"].ToString());
    //            marginForDealerPer = Convert.ToDouble(dt.Rows[0]["MarginForDealer"].ToString());
    //            marginPer = Convert.ToDouble(dt.Rows[0]["Margin"].ToString());


    //            //currencyRate = Convert.ToDouble(Session["rate"].ToString());
    //            currencyRate = Convert.ToDouble(ddlCurrency.SelectedValue.ToString());

    //            purchasePrice = currencyRate * Convert.ToDouble(txtPrice.Text.Trim().ToString());

    //            lblPurchasePrice.Text = string.Format("{0:n0}", purchasePrice);

    //            basicCustomDuty = (purchasePrice * bcdPer) / 100;
    //            Session["basicCustomDuty"] = basicCustomDuty;
    //            cvd = ((purchasePrice + basicCustomDuty) * cvdPer) / 100;
    //            Session["cvd"] = cvd;
    //            sad = ((purchasePrice + basicCustomDuty) * sadPer) / 100;
    //            Session["sad"] = sad;
    //            customCess = ((basicCustomDuty + cvd + sad) * customCessPer) / 100;
    //            Session["customCess"] = customCess;
    //            frieghtCha = (purchasePrice * frieghtChaPer) / 100;
    //            Session["frieghtCha"] = frieghtCha;
    //            octroi = (purchasePrice + basicCustomDuty + cvd + sad + customCess + frieghtCha) * (octroiPer) / 100;
    //            Session["octroi"] = octroi;
    //            totalCost = purchasePrice + basicCustomDuty + cvd + sad + customCess + frieghtCha + octroi;
    //            marginForDealer = (totalCost * marginForDealerPer) / 100;
    //            Session["marginForDealer"] = marginForDealer;
    //            margin = (totalCost * marginPer) / 100;
    //            Session["margin"] = margin;
    //            beforeVat = totalCost + marginForDealer + margin;
    //            vat = (beforeVat * vatPer) / 100;
    //            Session["vat"] = vat;
    //            mrp = beforeVat + vat;
    //            lblSellingPrice.Text = string.Format("{0:n0}", mrp);

    //            GetDealerPrice(mrp);
    //        }
    //    }
    //    catch { }
    //}
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
    //private void GetDealerPrice(double mrp)
    //{
    //    CostingTaxBLL obj = new CostingTaxBLL();
    //    DataTable dt = new DataTable();
    //    dt = obj.GetDealerCostingTaxMaster();
    //    if (dt.Rows.Count > 0)
    //    {
    //        double vat, discount, vatCst, vatPer, discountPer, afterVat, afterDiscount, vatCstPer, dealerPrice;

    //        vatPer = Convert.ToDouble(dt.Rows[0]["vat"].ToString());
    //        discountPer = Convert.ToDouble(dt.Rows[0]["discount"].ToString());
    //        vatCstPer = Convert.ToDouble(dt.Rows[0]["vat_cst"].ToString());

    //        vat = (mrp * vatPer) / 100;
    //        Session["dealerVat"] = vat;
    //        afterVat = mrp - vat;
    //        discount = (afterVat * discountPer) / 100;
    //        Session["dealerDiscount"] = discount;

    //        afterDiscount = afterVat - discount;

    //        vatCst = (afterDiscount * vatCstPer) / 100;
    //        Session["dealerVatCst"] = vatCst;

    //        dealerPrice = afterDiscount + vatCst;
    //        lblDealerPrice.Text = string.Format("{0:n0}", dealerPrice);
    //    }
    //}
    //protected void ddlCurrency_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    lblPurchasePrice.Text = "";
    //    lblSellingPrice.Text = "";
    //    txtPrice.Text = "";

    //    double rate = 0;

    //    rate = Convert.ToDouble(ddlCurrency.SelectedValue.ToString());       


    //    Session["rate"] = rate;
    //    lblCurrency.Text = ddlCurrency.SelectedItem.Text.ToString();
    //}
    private void GenerateBarcode(string strValue)
    {
        //string barCode = txtCode.Text;
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
                imgBarcode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
            }

            //plBarCode.Controls.Add(imgBarCode);
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
            intBrand = int.Parse(ddlBrands.SelectedValue.Trim().ToString());

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
            txtSku.Text = strValue;
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

    private void BindGrid()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM View_ProductsQtySize";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            trSize.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            trSize.Visible = false;
        }
    }

    private void BindGrid(int pid)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM View_ProductsQtySize where pid='0' or pid=" + pid;
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            trSize.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            trSize.Visible = true;
        }
    }
    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        if (Request.QueryString["pid"] != null)
        {
            int pid = Int32.Parse(Request.QueryString["pid"].ToString());
            this.BindGrid(pid);
        }
        else
        {
            this.BindGrid(0);
        }
    }
    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        string quantity = (row.FindControl("txtQuantity") as TextBox).Text;

        string query = "UPDATE Products_quantity_tbl SET added_qty=@added_qty WHERE id=@id";

        string constr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@added_qty", quantity);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        GridView1.EditIndex = -1;
        if (Request.QueryString["pid"] != null)
        {
            int pid = Int32.Parse(Request.QueryString["pid"].ToString());
            this.BindGrid(pid);
        }
        else
        {
            this.BindGrid(0);
        }
    }
    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridView1.EditIndex = -1;
        if (Request.QueryString["pid"] != null)
        {
            int pid = Int32.Parse(Request.QueryString["pid"].ToString());
            this.BindGrid(pid);
        }
        else
        {
            this.BindGrid(0);
        }
    }

    protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        ProductsBLL obj = new ProductsBLL();
        obj.id = id;
        int exe = obj.DeleteProductQuantity();
        if (Request.QueryString["pid"] != null)
        {
            int pid = Int32.Parse(Request.QueryString["pid"].ToString());
            this.BindGrid(pid);
        }
        else
        {
            this.BindGrid(0);
        }
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
        {
            (e.Row.Cells[3].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
        }
    }
    protected void Insert(object sender, EventArgs e)
    {
        string strSize = "";
        string strColor = "";
        try
        {
            string size = ddlSize.SelectedItem.Text;
            string bootSize = chkBootSize.SelectedItem.Text;

            strColor = ddlColor.SelectedItem.Text;


            if (size != "Size")
            {
                strSize = size;
                rfvSize.Enabled = true;
                rfvSizeBoot.Enabled = false;
            }
            if (bootSize != "Size")
            {
                strSize = bootSize;
                rfvSize.Enabled = false;
                rfvSizeBoot.Enabled = true;
            }

        }
        catch { }

        if (Page.IsValid)
        {
            ipaddress = GetIpaddress();

            string quantity = txtQuantity1.Text;
            ProductsBLL obj = new ProductsBLL();
            obj.Pid = 0;
            obj.Size = strSize;
            obj.Color = strColor;
            obj.AddedQty = int.Parse(quantity);
            obj.SoldQty = 0;
            obj.StockQty = int.Parse(quantity);
            obj.Ipaddress = ipaddress;


            int exe = obj.AddProductQuantity();

            if (exe > 0)
            {
                ddlSize.SelectedIndex = 0;
                ddlColor.SelectedIndex = 0;
                chkBootSize.SelectedIndex = 0;
                txtQuantity1.Text = "";
            }

            if (Request.QueryString["pid"] != null)
            {
                int pid = Int32.Parse(Request.QueryString["pid"].ToString());
                this.BindGrid(pid);
            }
            else
            {
                this.BindGrid(0);
            }
        }
    }

    private void UpdateProductQtyTbl(int id)
    {
        ProductsBLL obj = new ProductsBLL();
        obj.Pid = id;
        obj.UpdateProductQuantityTbl();

    }

    private int GetProductId()
    {
        int id;
        ProductsBLL obj = new ProductsBLL();
        object o = obj.GetProductId();

        id = int.Parse(o.ToString());
        return id;
    }

    private string GetIpaddress()
    {
        string ipaddress;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];

        return ipaddress;
    }

    protected void txtVat_TextChanged(object sender, EventArgs e)
    {
        try
        {
            decimal dPrice = decimal.Parse(txtPrice.Text.Trim());
            decimal dVat = decimal.Parse(txtVat.Text.Trim());
            txtSellingPrice.Text = (dPrice + (dPrice * dVat) / 100).ToString();
        }
        catch { }
    }

    protected void ddlHsnCode_SelectedIndexChanged(object sender, EventArgs e)
    {        
        try
        {
            string strHsCode = ddlHsnCode.SelectedItem.Text.ToString();
            // decimal dVat = decimal.Parse(ddlHsnCode.SelectedValue.ToString());
            decimal dVat = GetGST(strHsCode);
            txtVat.Text = dVat.ToString();
            decimal dPrice = decimal.Parse(txtPrice.Text.Trim());
            // dVat = decimal.Parse(txtVat.Text.Trim());
            txtSellingPrice.Text = (dPrice + (dPrice * dVat) / 100).ToString();           
        }
        catch { }
    }

    private decimal GetGST(string HsCode)
    {
        decimal dVat = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT HSCode, VAT FROM dbo.hs_code_master_tbl where HSCode=" + HsCode;
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            dVat = decimal.Parse(dt.Rows[0]["VAT"].ToString());
        } 
        return dVat;
    }
}