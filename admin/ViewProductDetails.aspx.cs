using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_ViewProductDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {                   
                    trSize.Visible = false;
                    trManufacturer.Visible = false;
                    trModel.Visible = false;

                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetProduct(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void GetProduct(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetProductDetailsById";
            obj.AddParam("@pid", id);
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                //string strUser = Session["user"].ToString();
                //if (strUser == "admin")
                //{
                //    Panel1.Visible = true;
                //}
                //else
                //{
                //    Panel1.Visible = false;
                //}

                string strType = dt.Rows[0]["type"].ToString();
                if (strType == "Bike")
                {
                    trFitment.Visible = true;                   
                    trSize.Visible = false;
                }
                if (strType == "Non Bike")
                {
                    trModel.Visible = false;
                    trManufacturer.Visible = false;
                    trFitment.Visible = false;                   
                    trSize.Visible = false;
                }
                if (strType == "Riding Gear")
                {
                    trModel.Visible = false;
                    trManufacturer.Visible = false;
                    trFitment.Visible = false;                    
                    trSize.Visible = true;
                }


                lblCategory.Text = dt.Rows[0]["cat_name"].ToString();
                    lblSubCategory.Text = dt.Rows[0]["subcat_name"].ToString();
                    lblFitment.Text = dt.Rows[0]["fitment"].ToString();
                    lblManufacturer.Text = dt.Rows[0]["manufacturer_name"].ToString();
                    //lblregType.Text = dt.Rows[0]["model_type"].ToString();
                    // lblModel.Text = dt.Rows[0]["model"].ToString();
                    // lblName.Text = dt.Rows[0]["gender"].ToString();
                    lblProductName.Text = dt.Rows[0]["product_name"].ToString();

                    lblSku.Text = dt.Rows[0]["sku"].ToString();
                    lblSize.Text = dt.Rows[0]["size"].ToString();
                    lblColour.Text = dt.Rows[0]["color"].ToString();
                    lblQuantity.Text = dt.Rows[0]["quantity"].ToString();
                    lblWeight.Text = dt.Rows[0]["weight"].ToString();
                    lblStock.Text = dt.Rows[0]["stock"].ToString();
                    lblShortDesc.Text = dt.Rows[0]["short_desc"].ToString();
                    lblLongDesc.Text = dt.Rows[0]["product_desc"].ToString();
                    lblBrand.Text = dt.Rows[0]["brand_name"].ToString();

                    lblExclusive.Text = dt.Rows[0]["exclusive"].ToString();

                    //lblBcd.Text = dt.Rows[0]["basic_custom_duty"].ToString();
                    //lblCvd.Text = dt.Rows[0]["cvd"].ToString();
                    //lblSad.Text = dt.Rows[0]["sad"].ToString();
                    //lblCustomCess.Text = dt.Rows[0]["custom_cess"].ToString();
                    //lblFrieghtCha.Text = dt.Rows[0]["frieght_cha"].ToString();
                    //lblOctroi.Text = dt.Rows[0]["octroi"].ToString();
                    //lblVat.Text = dt.Rows[0]["vat"].ToString();
                    //lblMarginForDealer.Text = dt.Rows[0]["margin_for_dealer"].ToString();                
                    //lblMargin.Text = dt.Rows[0]["margin"].ToString();

                    double price = Convert.ToDouble(dt.Rows[0]["price"].ToString());
                    lblPurchasePrice.Text = string.Format("{0:n0}", price);

                //double vat = Convert.ToDouble(dt.Rows[0]["vat"].ToString());
                //lblVat.Text = string.Format("{0:n}", vat);
                lblVat.Text = dt.Rows[0]["vat"].ToString();

                //double bcd = Convert.ToDouble(dt.Rows[0]["basic_custom_duty"].ToString());
                //lblBcd.Text = string.Format("{0:n0}", bcd);

                //double cvd = Convert.ToDouble(dt.Rows[0]["cvd"].ToString());
                //lblCvd.Text = string.Format("{0:n0}", cvd);

                //double sad = Convert.ToDouble(dt.Rows[0]["sad"].ToString());
                //lblSad.Text = string.Format("{0:n0}", sad);

                //double customCess = Convert.ToDouble(dt.Rows[0]["custom_cess"].ToString());
                //lblCustomCess.Text = string.Format("{0:n0}", customCess);

                //double frieghtCha = Convert.ToDouble(dt.Rows[0]["frieght_cha"].ToString());
                //lblFrieghtCha.Text = string.Format("{0:n0}", frieghtCha);

                //double octroi = Convert.ToDouble(dt.Rows[0]["octroi"].ToString());
                //lblOctroi.Text = string.Format("{0:n0}", octroi);

                //double vat = Convert.ToDouble(dt.Rows[0]["vat"].ToString());
                //lblVat.Text = string.Format("{0:n0}", vat);

                //double marginForDealer = Convert.ToDouble(dt.Rows[0]["margin_for_dealer"].ToString());
                //lblMarginForDealer.Text = string.Format("{0:n0}", marginForDealer);

                //double margin = Convert.ToDouble(dt.Rows[0]["margin"].ToString());
                //lblMargin.Text = string.Format("{0:n0}", margin);

                //double sellingPrice = Convert.ToDouble(dt.Rows[0]["price"].ToString());
                //lblSellingPrice.Text = string.Format("{0:n0}", sellingPrice);


            }
        }
        catch { }
    }
}