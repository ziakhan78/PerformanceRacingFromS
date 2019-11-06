using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Globalization;
using System.Data.SqlTypes;

/// <summary>
/// Summary description for GroupsBLL
/// </summary>
public class ProductsBLL
{
    public ProductsBLL()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    

    #region --- Declared Variables ---

    private string fitment, manufacturer, modelType, model, brand, gender, productName, sku, currencyType, size, color, shortDesc, productDesc, productTags, stock, videoLink, images, ipaddress, notes = "";
    private int pid, cid, sid, quantity, deliveryTime, manufacturerId, brandId, modelId, productCode = 0;
    private decimal currencyRate, price, purchasePrice, sellingPrice, weight, height, width, length, dealerPrice, vat;
    bool isLatestProduct, isExclusive, isCod;

    private SqlDateTime dateOfImport;

    private double basicCustomDuty, cvd, sad, customCess, frieghtCha, octroi, marginForDealer, margin, dealerVat, dealerDiscount, dealerVatCst;

    public SqlDateTime DateOfImport { set { dateOfImport = value; } get { return dateOfImport; } }
    public decimal CurrencyRate { set { currencyRate = value; } get { return currencyRate; } }
    public decimal Price { set { price = value; } get { return price; } }
    public decimal PurchasePrice { set { purchasePrice = value; } get { return purchasePrice; } }
    public decimal SellingPrice { set { sellingPrice = value; } get { return sellingPrice; } }
    public decimal DealerPrice { set { dealerPrice = value; } get { return dealerPrice; } }

    public double BasicCustomDuty { set { basicCustomDuty = value; } get { return basicCustomDuty; } }
    public double Cvd { set { cvd = value; } get { return cvd; } }
    public double Sad { set { sad = value; } get { return sad; } }
    public double CustomCess { set { customCess = value; } get { return customCess; } }
    public double FrieghtCha { set { frieghtCha = value; } get { return frieghtCha; } }
    public double Octroi { set { octroi = value; } get { return octroi; } }
    public double MarginForDealer { set { marginForDealer = value; } get { return marginForDealer; } }
    public double Margin { set { margin = value; } get { return margin; } }
    public decimal Vat { set { vat = value; } get { return vat; } }

    public double DealerVat { set { dealerVat = value; } get { return dealerVat; } }
    public double DealerDiscount { set { dealerDiscount = value; } get { return dealerDiscount; } }
    public double DealerVatCst { set { dealerVatCst = value; } get { return dealerVatCst; } }
    public bool IsLatestProduct { set { isLatestProduct = value; } get { return isLatestProduct; } }
    public bool IsExclusive { set { isExclusive = value; } get { return isExclusive; } }
    public bool IsCod { set { isCod = value; } get { return isCod; } }

    public int Quantity { set { quantity = value; } get { return quantity; } }
    public int DeliveryTime { set { deliveryTime = value; } get { return deliveryTime; } }

    public int ManufacturerId { set { manufacturerId = value; } get { return manufacturerId; } }

    public int BrandId { set { brandId = value; } get { return brandId; } }

    public int ModelId { set { modelId = value; } get { return modelId; } }


    public int Pid { set { pid = value; } get { return pid; } }
    public int CId { set { cid = value; } get { return cid; } }
    public int SId { set { sid = value; } get { return sid; } }

    public int ProductCode { set { productCode = value; } get { return productCode; } }


    public string Fitment { set { fitment = value; } get { return fitment; } }
    public string Manufacturer { set { manufacturer = value; } get { return manufacturer; } }
    public string ModelType { set { modelType = value; } get { return modelType; } }
    public string Model { set { model = value; } get { return model; } }
    public string ProductName { set { productName = value; } get { return productName; } }
    public string Sku { set { sku = value; } get { return sku; } }

    public string CurrencyType { set { currencyType = value; } get { return currencyType; } }

    public string Size { set { size = value; } get { return size; } }
    public string Color { set { color = value; } get { return color; } }

    public decimal Weight { set { weight = value; } get { return weight; } }
    public decimal Height { set { height = value; } get { return height; } }
    public decimal Width { set { width = value; } get { return width; } }
    public decimal Length { set { length = value; } get { return length; } }


    public string ShortDesc { set { shortDesc = value; } get { return shortDesc; } }
    public string ProductDesc { set { productDesc = value; } get { return productDesc; } }
    public string ProductTags { set { productTags = value; } get { return productTags; } }

    public string Stock { set { stock = value; } get { return stock; } }
    public string Brand { set { brand = value; } get { return brand; } }
    public string Gender { set { gender = value; } get { return gender; } }
    public string VideoLink { set { videoLink = value; } get { return videoLink; } }
    public string Ipaddress { set { ipaddress = value; } get { return ipaddress; } }
    public string Notes { set { notes = value; } get { return notes; } }


    public string Warranty { set; get; }
    public string Return { set; get; }
    public string Care { set; get; }
    public int id { get; set; }

    public int AddedQty { get; set; }
    public int SoldQty { get; set; }
    public int StockQty { get; set; }

    public string CartId { get; set; }

    public string HsCode { get; set; }

    // Images

    public string Images { set { images = value; } get { return images; } }



    #endregion

    #region --- Add ---
    public int AddProduct()
    {       
        try
        {
            int i = 0;
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddProduct";
            obj.AddParam("@cid", this.cid);
            obj.AddParam("@sid", this.sid);
            obj.AddParam("@fitment", this.fitment);
            obj.AddParam("@manufacturer_id", this.manufacturerId);
            obj.AddParam("@model_type", this.modelType);
            obj.AddParam("@model_name", this.model);
            obj.AddParam("@brand_id", this.brandId);
            obj.AddParam("@gender", this.gender);

            obj.AddParam("@product_name", this.productName);
            obj.AddParam("@sku", this.sku);
            obj.AddParam("@product_code", this.productCode);
            obj.AddParam("@size", this.size);

            obj.AddParam("@price", this.price);
            obj.AddParam("@selling_price", this.sellingPrice); // added for bargain products only
            obj.AddParam("@margin_for_dealer", this.marginForDealer);
            obj.AddParam("@dealer_discount", this.dealerDiscount);
            obj.AddParam("@dealer_price", this.dealerPrice);
            obj.AddParam("@vat", this.vat);
            obj.AddParam("@hs_code", this.HsCode);

            //obj.AddParam("@currency_type", this.currencyType);
            //obj.AddParam("@currency_rate", this.currencyRate);
            //obj.AddParam("@basic_custom_duty", this.basicCustomDuty);
            //obj.AddParam("@cvd", this.cvd);
            //obj.AddParam("@sad", this.sad);
            //obj.AddParam("@custom_cess", this.customCess);
            //obj.AddParam("@frieght_cha", this.frieghtCha);
            //obj.AddParam("@octroi", this.octroi);
            //obj.AddParam("@vat", this.vat);
            //obj.AddParam("@margin", this.margin);
            //obj.AddParam("@selling_price", this.sellingPrice);
            //obj.AddParam("@dealer_vat", this.dealerVat);
            //obj.AddParam("@dealer_vat_cst", this.dealerVatCst);

            obj.AddParam("@color", this.color);
            obj.AddParam("@quantity", this.quantity);
            obj.AddParam("@weight", this.weight);
            obj.AddParam("@height", this.height);
            obj.AddParam("@width", this.width);
            obj.AddParam("@length", this.length);

            obj.AddParam("@stock", this.stock);
            obj.AddParam("@delivery_time", this.deliveryTime);
            obj.AddParam("@short_desc", this.shortDesc);
            obj.AddParam("@product_desc", this.productDesc);
            obj.AddParam("@product_tags", this.productTags);
            obj.AddParam("@video_link", this.videoLink);

            // Images

            obj.AddParam("@images", this.images);
            obj.AddParam("@exclusive", this.IsExclusive);
            obj.AddParam("@ipaddress", this.ipaddress);
            obj.AddParam("@date_of_import", this.dateOfImport);

            i = obj.ExecuteNonQuery();
            return i;
        }
        catch
        { throw; }
    }
    public int AddBargainProduct()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddBargainProduct";

        obj.AddParam("@product_name", this.productName);
        obj.AddParam("@sku", this.sku);
        obj.AddParam("@product_desc", this.productDesc);
        obj.AddParam("@quantity", this.quantity);
        obj.AddParam("@weight", this.weight);
        obj.AddParam("@color", this.color);
        obj.AddParam("@purchase_price", this.purchasePrice);
        obj.AddParam("@selling_price", this.sellingPrice);
        obj.AddParam("@notes", this.notes);
        obj.AddParam("@ipaddress", this.ipaddress);

        // Images

        obj.AddParam("@images", this.images);

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Update ---
    public int UpdateProduct()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateProduct";
        obj.AddParam("@pid", this.pid);
        obj.AddParam("@cid", this.cid);
        obj.AddParam("@sid", this.sid);
        obj.AddParam("@fitment", this.fitment);
        obj.AddParam("@manufacturer_id", this.manufacturerId);
        obj.AddParam("@model_type", this.modelType);
        // obj.AddParam("@model_id", this.modelId);
        obj.AddParam("@model_name", this.model);
        obj.AddParam("@brand_id", this.brandId);
        obj.AddParam("@gender", this.gender);

        obj.AddParam("@product_name", this.productName);
        obj.AddParam("@sku", this.sku);
        //obj.AddParam("@size", this.size);

        obj.AddParam("@price", this.price);
        obj.AddParam("@selling_price", this.sellingPrice); // added for bargain products only
        obj.AddParam("@margin_for_dealer", this.marginForDealer);
        obj.AddParam("@dealer_discount", this.dealerDiscount);
        obj.AddParam("@dealer_price", this.dealerPrice);
        obj.AddParam("@vat", this.vat);
        obj.AddParam("@hs_code", this.HsCode);

        //obj.AddParam("@currency_type", this.currencyType);
        //obj.AddParam("@currency_rate", this.currencyRate);
        //obj.AddParam("@basic_custom_duty", this.basicCustomDuty);
        //obj.AddParam("@cvd", this.cvd);
        //obj.AddParam("@sad", this.sad);
        //obj.AddParam("@custom_cess", this.customCess);
        //obj.AddParam("@frieght_cha", this.frieghtCha);
        //obj.AddParam("@octroi", this.octroi);
        //obj.AddParam("@vat", this.vat);
        //obj.AddParam("@margin", this.margin);
        //obj.AddParam("@selling_price", this.sellingPrice);
        //obj.AddParam("@dealer_vat", this.dealerVat);
        //obj.AddParam("@dealer_vat_cst", this.dealerVatCst);

       // obj.AddParam("@color", this.color);
        obj.AddParam("@quantity", this.quantity);
        obj.AddParam("@weight", this.weight);
        obj.AddParam("@height", this.height);
        obj.AddParam("@width", this.width);
        obj.AddParam("@length", this.length);


        obj.AddParam("@stock", this.stock);
        obj.AddParam("@delivery_time", this.deliveryTime);
        obj.AddParam("@short_desc", this.shortDesc);
        obj.AddParam("@product_desc", this.productDesc);
        obj.AddParam("@product_tags", this.productTags);
        obj.AddParam("@video_link", this.videoLink);

        // Images

        obj.AddParam("@images", this.images);
        obj.AddParam("@exclusive", this.IsExclusive);

        i = obj.ExecuteNonQuery();
        return i;
    }

    public int UpdateBargainProduct()
    {

        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateBargainProduct";

        obj.AddParam("@id", this.pid);
        obj.AddParam("@product_name", this.productName);
        obj.AddParam("@sku", this.sku);
        obj.AddParam("@product_desc", this.productDesc);
        obj.AddParam("@quantity", this.quantity);
        obj.AddParam("@weight", this.weight);
        obj.AddParam("@color", this.color);
        obj.AddParam("@purchase_price", this.purchasePrice);
        obj.AddParam("@selling_price", this.sellingPrice);
        obj.AddParam("@notes", this.notes);

        // Images

        obj.AddParam("@images", this.images);

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Get ---
    public DataTable GetProduct()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetProduct";
        obj.AddParam("@pid", this.pid);

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetProductDetailsByProId()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetProductDetailsById";
        obj.AddParam("@pid", this.pid);

        dt = obj.ExecuteTable();
        return dt;
    }



    public DataTable GetAllBargainProducts()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAllBargainProducts";

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetAllPromotionProducts()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAllPromotionProducts";
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetNewArrivalsProducts()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetNewArrivalsProducts";
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetBestSellers()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetBestSellers";
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetProductByCatIdSubCatId()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "sc_GetProductsByCatSubCatId";
        obj.AddParam("@cid", this.cid);
        obj.AddParam("@sid", this.sid);

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetProductBySubCatId()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "sc_GetProductsBySubCatId";
        // obj.AddParam("@cid", this.cid);
        obj.AddParam("@sid", this.sid);

        dt = obj.ExecuteTable();
        return dt;
    }


    public DataTable GetProductBySubSubCatId()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "sc_GetProductsBySubSubCatId";
        // obj.AddParam("@ssid", this.ssid);

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetProductByCatId()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "sc_GetProductsByCatId";
        obj.AddParam("@cid", this.cid);

        dt = obj.ExecuteTable();
        return dt;
    }


    public DataTable GetBargainProduct()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetBargainProduct";
        obj.AddParam("@id", this.pid);

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetBargainProductList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetBargainProductList";


        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetProductsByBike()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetProductsByBike";
        obj.AddParam("@manufacturer", this.manufacturer);

        dt = obj.ExecuteTable();
        return dt;
    }



    #endregion

    #region --- Delete ---
    public int DeleteProduct()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteProduct";
        obj.AddParam("@pid", this.pid);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    public string ToTitleCase(string str) { return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower()); }

    // Add to Wishlist

    public int AddToWishList()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_AddtoWishList";
        obj.AddParam("@pid", this.pid);
        obj.AddParam("@customerId", this.cid);
        //obj.AddParam("@color", this.color);
        //obj.AddParam("@size", this.size);

        i = obj.ExecuteNonQuery();
        return i;
    }
    public DataTable ProductsAllreadyExistInWishList()
    {
        DataTable dt;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sc_IsAlreadyExistInWL";
        obj.AddParam("@pid", this.pid);
        obj.AddParam("@customerId", this.cid);
        //obj.AddParam("@color", this.color);
        //obj.AddParam("@size", this.size);

        dt = obj.ExecuteTable();
        return dt;
    }
    public int UpdateWarrantyReturnCareText()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateWarrantyReturnCareText";
        obj.AddParam("@warranty", this.Warranty);
        obj.AddParam("@returns", this.Return);
        obj.AddParam("@care", this.Care);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public DataTable GetWarrantyReturnCareText()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetWarrantyReturnCareText";

        dt = obj.ExecuteTable();
        return dt;
    }
    public int AddProductQuantity()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddProQuantity";
        obj.AddParam("@pid", this.pid);
        obj.AddParam("@size", this.size);
        obj.AddParam("@color", this.color);
        obj.AddParam("@added_qty", this.AddedQty);
        obj.AddParam("@sold_qty", this.SoldQty);
        obj.AddParam("@stock_qty", this.StockQty);
        obj.AddParam("@ipaddress", this.ipaddress);

        i = obj.ExecuteNonQuery();
        return i;
    }
    public int DeleteProductQuantity()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteProQuantity";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int UpdateProductQuantityTbl()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateProductQuantityTbl";
        obj.AddParam("@pid", this.pid);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public object GetProductId()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetProductId";
        object j = obj.ExecuteScalar();
        return j;
    }
    public DataTable GetQuantityBySize()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetQuantityBySize";
        obj.AddParam("@pid", this.pid);
        obj.AddParam("@size", this.size);
        obj.AddParam("@color", this.color);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetQuantityBySize1()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetQuantityBySize1";
        obj.AddParam("@pid", this.pid);
        obj.AddParam("@size", this.size);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetQuantityByColor()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetQuantityByColor";
        obj.AddParam("@pid", this.pid);
        obj.AddParam("@color", this.color);
        dt = obj.ExecuteTable();
        return dt;
    }

}