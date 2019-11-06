using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Globalization;

/// <summary>
/// Summary description for MastersBLL
/// </summary>
public class MastersBLLOld
{
	public MastersBLLOld()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region --- Declared Variables ---

    private decimal currencyRate;
    private string currency, brandName, website, notes, logo, component, collectionType, colorName, hexCode, 
        manufacturerName, manufacturerModel, modelYear, modelYearTo,
        occaission, promotionOccasion, occasionAbbre, style, assembly, material, ipaddress = "";

    private int id, _categoryId, _subCategoryId, manufacturerId, brandId = 0;

    public decimal CurrencyRate { set { currencyRate = value; } get { return currencyRate; } }

    public int Id { set { id = value; } get { return id; } }
    public int CategoryId { set { _categoryId = value; } get { return _categoryId; } }
    public int SubCategoryId { set { _subCategoryId = value; } get { return _subCategoryId; } }
    public int ManufacturerId { set { manufacturerId = value; } get { return manufacturerId; } }
    public int BrandId { set { brandId = value; } get { return brandId; } }

    public string Currency { set { currency = value; } get { return currency; } }
    public string BrandName { set { brandName = value; } get { return brandName; } }
    public string Website { set { website = value; } get { return website; } }
    public string Notes { set { notes = value; } get { return notes; } }
    public string Logo { set { logo = value; } get { return logo; } }
    public string Component { set { component = value; } get { return component; } }
    public string ColorName { set { colorName = value; } get { return colorName; } }
    public string HexCode { set { hexCode = value; } get { return hexCode; } }

    public string ManufacturerName { set { manufacturerName = value; } get { return manufacturerName; } }
    public string ManufacturerModel { set { manufacturerModel = value; } get { return manufacturerModel; } }
    public string ModelYear { set { modelYear = value; } get { return modelYear; } }
    public string ModelYearTo { set { modelYearTo = value; } get { return modelYearTo; } }


    public string Occaission { set { occaission = value; } get { return occaission; } }
    public string PromotionOccasion { set { promotionOccasion = value; } get { return promotionOccasion; } }
    public string OccasionAbbre { set { occasionAbbre = value; } get { return occasionAbbre; } } 
    public string CollectionType { set { collectionType = value; } get { return collectionType; } }
    public string Style { set { style = value; } get { return style; } }  
    public string Assembly { set { assembly = value; } get { return assembly; } }
    public string Material { set { material = value; } get { return material; } }
    public string Ipaddress { set { ipaddress = value; } get { return ipaddress; } }


    #endregion

    #region --- Add ---

    public int AddCurrencyRate()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddCurrencyRate";
        obj.AddParam("@currency", this.currency);
        obj.AddParam("@rate", this.currencyRate);
        obj.AddParam("@ipaddress", this.ipaddress);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int AddBrand()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddBrand";
        obj.AddParam("@cat_id", this._categoryId);
        obj.AddParam("@subcat_id", this._subCategoryId);
        obj.AddParam("@brand_name", this.brandName);
        obj.AddParam("@website", this.website);
        obj.AddParam("@notes", this.notes);
        obj.AddParam("@logo", this.logo);
        obj.AddParam("@ipaddress", this.ipaddress);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int AddBrandDetails()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddBrandDetails";
        obj.AddParam("@brand_id", this.brandId);
        obj.AddParam("@components", this.component);      
        obj.AddParam("@ipaddress", this.ipaddress);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int AddColors()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddColors";
        obj.AddParam("@color_name", this.colorName);
        obj.AddParam("@hex_code", this.hexCode);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int AddComponents()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddComponents";
        obj.AddParam("@components", this.component);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int AddManufacturer()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddManufacturer";
        obj.AddParam("@manufacturer_name", this.manufacturerName);       
        obj.AddParam("@logo", this.logo);
        obj.AddParam("@ipaddress", this.ipaddress);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int AddManufacturerModel()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddManufacturerModel";
        obj.AddParam("@manufacturer_id", this.manufacturerId);
        obj.AddParam("@model", this.manufacturerModel);
        obj.AddParam("@year_from", this.modelYear);
        obj.AddParam("@year_to", this.modelYearTo);
        obj.AddParam("@ipaddress", this.ipaddress);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int AddCollectionType()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddCollectionType";
        obj.AddParam("@collection_type", this.collectionType);
        i = obj.ExecuteNonQuery();
        return i;
    }   
    public int AddPromotionOccasion()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddPromotionOccasion";
        obj.AddParam("@occasion_name", this.promotionOccasion);
        obj.AddParam("@occasion_abbri", this.occasionAbbre);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int AddOccasion()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddOccasion";
        obj.AddParam("@occasion_name", this.occaission);
        i = obj.ExecuteNonQuery();
        return i;
    }
 

    #endregion

    #region --- Update ---
    public int UpdateCurrencyRate()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateCurrencyRate";
        obj.AddParam("@id", this.id);
        obj.AddParam("@currency", this.currency);
        obj.AddParam("@rate", this.currencyRate);
        obj.AddParam("@ipaddress", this.ipaddress);

        i = obj.ExecuteNonQuery();
        return i;
    }   
    public int UpdateBrand()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateBrand";
        obj.AddParam("@id", this.id);
        obj.AddParam("@cat_id", this._categoryId);
        obj.AddParam("@subcat_id", this._subCategoryId);
        obj.AddParam("@brand_name", this.brandName);
        obj.AddParam("@website", this.website);
        obj.AddParam("@notes", this.notes);
        obj.AddParam("@logo", this.logo);

        i = obj.ExecuteNonQuery();
        return i;
    }
    public int UpdateBrandDetails()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateBrandDetails";
        obj.AddParam("@id", this.id);
        obj.AddParam("@brand_id", this.brandId);
        obj.AddParam("@components", this.component);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int UpdateColors()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateColors";
        obj.AddParam("@id", this.id);
        obj.AddParam("@color_name", this.colorName);
        obj.AddParam("@hex_code", this.hexCode);

        i = obj.ExecuteNonQuery();
        return i;
    }
    public int UpdateComponents()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateComponents";
        obj.AddParam("@id", this.id);
        obj.AddParam("@components", this.component);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int UpdateManufacturer()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateManufacturer";
        obj.AddParam("@id", this.id);
        obj.AddParam("@manufacturer_name", this.manufacturerName);
        obj.AddParam("@logo", this.logo);
      
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int UpdateManufacturerModel()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateManufacturerModel";
        obj.AddParam("@id", this.id);
        obj.AddParam("@manufacturer_id", this.manufacturerId);
        obj.AddParam("@model", this.manufacturerModel);
        obj.AddParam("@year_from", this.modelYear);
        obj.AddParam("@year_to", this.modelYearTo);
        i = obj.ExecuteNonQuery();
        return i;
    }
    public int UpdateStyle()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateStyle";
        obj.AddParam("@id", this.id);
        obj.AddParam("@style", this.style);

        i = obj.ExecuteNonQuery();
        return i;
    }
    public int UpdateCollectionType()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateCollectionType";
        obj.AddParam("@id", this.id);
        obj.AddParam("@collection_type", this.collectionType);

        i = obj.ExecuteNonQuery();
        return i;
    }
    public int UpdatePromotionOccasion()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdatePromotionOccasion";
        obj.AddParam("@id", this.id);
        obj.AddParam("@occasion_name", this.promotionOccasion);
        obj.AddParam("@occasion_abbri", this.occasionAbbre);
        i = obj.ExecuteNonQuery();
        return i;
    }      

    #endregion

    #region --- Get ---
    public DataTable GetCurrencyRate()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetCurrencyRate";
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetCurrencyRateById()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();

        obj.SetCommandSP = "z_GetCurrencyRateById";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    } 
    public DataTable GetBrand()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetBrand";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetBrandList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetBrandList";
      
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable SearchBrandsByAlphabet()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_SearchByAlphabetBrands";
        obj.AddParam("@name", this.brandName);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetBrandDetails()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetBrandDetails";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetColors()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetColors";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetColorsList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetColorsList";
       
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable SearchColorsByAlphabet()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_SearchByAlphabetColors";
        obj.AddParam("@name", this.colorName);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetComponents()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetComponents";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetComponentsList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetComponentsList";       
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable SearchComponentsByAlphabet()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_SearchByAlphabetComponents";
        obj.AddParam("@components", this.component);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetManufacturer()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetManufacturer";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetManufacturerList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetManufacturerList";
       
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable SearchManufacturerByAlphabet()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_SearchByAlphabetManufacturer";
        obj.AddParam("@name", this.manufacturerName);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetManufacturerModel()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetManufacturerModel";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetManufacturerModelList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetManufacturerModelList";       
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable SearchManufacturerByAlphabetModel()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_SearchByAlphabetManufacturerModel";
        obj.AddParam("@name", this.manufacturerName);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetStyle()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetStyle";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }   
    public DataTable GetPromotionOccasion()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetPromotionOccasion";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }
    public DataTable GetOccasion()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetOccasion";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }
    
  
    #endregion

    #region --- Delete ---

    public int DeleteColors()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteColors";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }
   
    public int DeleteBrand()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteBrand";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    public int DeleteBrandDetails()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteBrandDetails";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    public int DeleteComponents()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteComponents";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    public int DeleteManufacturer()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteManufacturer";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    public int DeleteManufacturerModel()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteManufacturerModel";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }
   
   
   
    public int DeletePromotionOccasion()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeletePromotionOccasion";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }
  
    #endregion

    public string ToTitleCase(string str) { return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower()); }

}