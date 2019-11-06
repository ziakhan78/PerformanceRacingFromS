using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using Telerik.Web.UI;

public partial class Admin_AdminM : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string nt = "";
            try
            {
                nt = Session["NodeText"].ToString();
            }
            catch
            {
                nt = "Admin Users";
            }
            try
            {
                RadTreeView1.Nodes.FindNodeByText(nt).Selected = true;
                RadTreeView1.Nodes.FindNodeByText(nt).Expanded = true;
            }
            catch { }


            try
            {
                if (Session["user"] != null)
                {

                    lblwelcome.Text = "Welcome : " + Session["AdminUserName"].ToString();

                    string strAdd, strView, strEdit, strDelete = "";
                    strAdd = Session["Add"].ToString();
                    strView = Session["View"].ToString();
                    strEdit = Session["Edit"].ToString();
                    strDelete = Session["Delete"].ToString();


                    string strUser = Session["user"].ToString();
                    if (strUser == "admin")
                    {
                        // RadMenu1.Items.FindItemByText("District Members").Visible = true; // For Menu  

                        RadTreeView1.Nodes.FindNodeByText("Admin Users").Visible = true;
                        RadTreeView1.Nodes.FindNodeByText("Currency Master").Visible = true;
                        RadTreeView1.Nodes.FindNodeByText("Costing & Tax Master").Visible = true;
                        
                        //RadTreeView1.Nodes.FindNodeByText("Duty & Tax Master").Visible = true;
                        //RadTreeView1.Nodes.FindNodeByText("Dealers Costing").Visible = true;

                        RadTreeView1.Nodes.FindNodeByText("Sales & Promotion Discounts").Visible = true;  
                        RadTreeView1.Nodes.FindNodeByText("Change Admin Password").Visible = true;

                    }
                    else
                    {
                        RadTreeView1.Nodes.FindNodeByText("Admin Users").Visible = false;
                        RadTreeView1.Nodes.FindNodeByText("Currency Master").Visible = false;
                        RadTreeView1.Nodes.FindNodeByText("Costing & Tax Master").Visible = false;
                        RadTreeView1.Nodes.FindNodeByText("Duty & Tax Master").Visible = false;
                        RadTreeView1.Nodes.FindNodeByText("Dealers Costing").Visible = false;
                        RadTreeView1.Nodes.FindNodeByText("Sales & Promotion Discounts").Visible = false;             
                        RadTreeView1.Nodes.FindNodeByText("Change Admin Password").Visible = false;
                    }

                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            catch(Exception ex)
            {
            }
        }
    }
    protected void lbtnlogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("default.aspx");
    }
    protected void RadTreeView1_NodeExpand(object sender, RadTreeNodeEventArgs e)
    {
        Session["NodeText"] = e.Node.Text;
    }
    protected void RadTreeView1_NodeClick(object sender, RadTreeNodeEventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("../admin/default.aspx");
        }

        string Snode = RadTreeView1.SelectedNode.Text;

        string[] s = e.Node.FullPath.Split('/');
        Session["NodeText"] = s[0];

        if (Snode.Trim() == "Add Admin Users")
        {
            Response.Redirect("add_users.aspx");
        }

        else if (Snode.Trim() == "View Admin Users")
        {
            Response.Redirect("view_users.aspx");
        }

        else if (Snode.Trim() == "Add Category")
        {
            Response.Redirect("add_category.aspx");
        }

        else if (Snode.Trim() == "View Categories")
        {
            Response.Redirect("view_category.aspx");
        }

        else if (Snode.Trim() == "Add Sub Category")
        {
            Response.Redirect("add_subcategory.aspx");
        }

        else if (Snode.Trim() == "View Sub Categories")
        {
            Response.Redirect("view_subcategory.aspx");
        }

        else if (Snode.Trim() == "Add Sub Sub Category")
        {
            Response.Redirect("add_subsubcategory.aspx");
        }

        else if (Snode.Trim() == "View Sub Sub Category")
        {
            Response.Redirect("view_subsubcategory.aspx");
        }

        else if (Snode.Trim() == "Add Products")
        {
            Response.Redirect("add_products.aspx");
        }

        else if (Snode.Trim() == "View Products")
        {
            Response.Redirect("ViewProducts.aspx");
        }


        else if (Snode.Trim() == "Add Featured & Latest Products")
        {
            Response.Redirect("add_featured_latest_products.aspx");
        }

        else if (Snode.Trim() == "View Featured & Latest Products")
        {
            //Response.Redirect("ViewProducts.aspx");
        }



        else if (Snode.Trim() == "Edit Products Warranty Text")
        {
            Response.Redirect("add_product_warranty_return_care.aspx");
        }



        else if (Snode.Trim() == "Add Shipping")
        {
            Response.Redirect("AddShip.aspx");
        }

        else if (Snode.Trim() == "View Shipping")
        {
            Response.Redirect("view_ship.aspx");
        }

        // Masters


        //else if (Snode.Trim() == "Add Tax")
        //{
        //    Response.Redirect("ViewTax.aspx");
        //}

        //else if (Snode.Trim() == "View Tax")
        //{
        //    Response.Redirect("AddTax.aspx");
        //}


        else if (Snode.Trim() == "Add HS Code")
        {
            Response.Redirect("add_hsn_master.aspx");
        }

        else if (Snode.Trim() == "View HS Code")
        {
            Response.Redirect("view_hsn_master.aspx");
        }


        else if (Snode.Trim() == "Service Tax Master")
        {
            Response.Redirect("add_service_tax.aspx");
        }

        else if (Snode.Trim() == "VAT Master")
        {
            Response.Redirect("add_VAT.aspx");
        }

        else if (Snode.Trim() == "TDS Master")
        {
            Response.Redirect("add_TDS.aspx");
        }



        else if (Snode.Trim() == "Add Occasions")
        {
            Response.Redirect("AddOccasions.aspx");
        }

        else if (Snode.Trim() == "View Occasions")
        {
            Response.Redirect("ViewOccasions.aspx");
        }

        else if (Snode.Trim() == "Add Colours")
        {
            Response.Redirect("add_colors.aspx");
        }

        else if (Snode.Trim() == "View Colours")
        {
            Response.Redirect("view_colors.aspx");
        }

        else if (Snode.Trim() == "Add Currency Rate")
        {
            Response.Redirect("add_currency_rate.aspx");
        }
        else if (Snode.Trim() == "View Currency Rate")
        {
            Response.Redirect("view_currency_rate.aspx");
        }



        else if (Snode.Trim() == "Duty & Tax Master")
        {
            Response.Redirect("add_costing_tax_master.aspx");
        }

        else if (Snode.Trim() == "Dealers Costing")
        {
            Response.Redirect("add_dealer_costing_tax_master.aspx");
        }


        // else if (Snode.Trim() == "View Costing & Tax Master")
        //{
        //    Response.Redirect("view_costing_tax_master.aspx");
        //}




        else if (Snode.Trim() == "Add Style")
        {
            Response.Redirect("add_style_master.aspx");
        }

        else if (Snode.Trim() == "View Style")
        {
            Response.Redirect("view_style_master.aspx");
        }

        else if (Snode.Trim() == "Add Bike Manufacturer")
        {
            Response.Redirect("add_manufacturer_master.aspx");
        }

        else if (Snode.Trim() == "View Bike Manufacturers")
        {
            Response.Redirect("view_manufacturer_master.aspx");
        }

        else if (Snode.Trim() == "Add Bike Model")
        {
            Response.Redirect("add_model_master.aspx");
        }

        else if (Snode.Trim() == "View Bike Models")
        {
            Response.Redirect("view_model_master.aspx");
        }

        else if (Snode.Trim() == "Add Components")
        {
            Response.Redirect("add_component_master.aspx");
        }

        else if (Snode.Trim() == "View Components")
        {
            Response.Redirect("view_components.aspx");
        }


        else if (Snode.Trim() == "Add Brands")
        {
            Response.Redirect("add_brand_master.aspx");
        }

        else if (Snode.Trim() == "View Brands")
        {
            Response.Redirect("view_brand_master.aspx");
        }

        else if (Snode.Trim() == "Add Brands Details")
        {
            Response.Redirect("add_brand_details.aspx");
        }

        else if (Snode.Trim() == "View Brands Details")
        {
            Response.Redirect("view_brand_details.aspx");
        }

        else if (Snode.Trim() == "Add Bargain Product")
        {
            Response.Redirect("add_bargain_product.aspx");
        }

        else if (Snode.Trim() == "View Bargain Products")
        {
            Response.Redirect("viewBargainProducts.aspx");
        }

        

        else if (Snode.Trim() == "Add Collection Type")
        {
            Response.Redirect("add_collection_type.aspx");
        }

        else if (Snode.Trim() == "View Collection Type")
        {
            Response.Redirect("view_collection_type.aspx");
        }

        else if (Snode.Trim() == "Add Setting Type")
        {
            Response.Redirect("add_setting_type.aspx");
        }

        else if (Snode.Trim() == "View Setting Type")
        {
            Response.Redirect("view_setting_type.aspx");
        }

        else if (Snode.Trim() == "Add Promo Events")
        {
            Response.Redirect("add_promotions_occasions.aspx");
        }

        else if (Snode.Trim() == "View Promo Events")
        {
            Response.Redirect("view_promotions_occasion.aspx");
        }

        else if (Snode.Trim() == "Add Dealers")
        {
            Response.Redirect("add_dealers.aspx");
        }

        else if (Snode.Trim() == "View Dealers")
        {
            Response.Redirect("view_dealers.aspx");
        }

        else if (Snode.Trim() == "Add Dealers Contacts")
        {
            Response.Redirect("add_dealers_contacts.aspx");
        }

        else if (Snode.Trim() == "View Dealers Contacts")
        {
            Response.Redirect("view_dealers_contacts.aspx");
        }




        // Masters End

        else if (Snode.Trim() == "Add Discounts")
        {
            Response.Redirect("add_sale_promotion_coupon.aspx");
        }

        else if (Snode.Trim() == "View Discounts")
        {
            Response.Redirect("view_sale_promotion_coupon.aspx");
        }



        else if (Snode.Trim() == "View Products Report")
        {
            Response.Redirect("products_report.aspx");
        }


        else if (Snode.Trim() == "Add Coupons")
        {
            Response.Redirect("add_coupon_discount.aspx");
        }

        else if (Snode.Trim() == "View Coupons")
        {
            Response.Redirect("view_coupon.aspx");
        }

        else if (Snode.Trim() == "Add News Subscriptions")
        {
            Response.Redirect("add_newsletter.aspx");
        }

        else if (Snode.Trim() == "View News Subscriptions")
        {
            Response.Redirect("view_newsletter.aspx");
        }

        else if (Snode.Trim() == "Add News")
        {
            Response.Redirect("add_news.aspx");
        }

        else if (Snode.Trim() == "View News")
        {
            Response.Redirect("view_news.aspx");
        }


        else if (Snode.Trim() == "Add Customer")
        {
            Response.Redirect("AddCustomer.aspx");
        }

        else if (Snode.Trim() == "View Customer")
        {
            Response.Redirect("ViewCustomer.aspx");
        }


        else if (Snode.Trim() == "Add Testimonial")
        {
            Response.Redirect("add_testimonials.aspx");
        }

        else if (Snode.Trim() == "View Testimonial")
        {
            Response.Redirect("view_testimonials.aspx");
        }

        else if (Snode.Trim() == "Add FAQ")
        {
            Response.Redirect("add_faq.aspx");
        }

        else if (Snode.Trim() == "View FAQ")
        {
            Response.Redirect("view_faq.aspx");
        }

        else if (Snode.Trim() == "Add Privacy Policy")
        {
            Response.Redirect("add_privacy_policy.aspx");
        }

        else if (Snode.Trim() == "View Privacy Policy")
        {
            Response.Redirect("view_privacy_policy.aspx");
        }

        else if (Snode.Trim() == "Add Terms & Conditions")
        {
            Response.Redirect("add_terms_of_use.aspx");
        }

        else if (Snode.Trim() == "View Terms & Conditions")
        {
            Response.Redirect("view_terms_conditions.aspx");
        }

        else if (Snode.Trim() == "Add About Company")
        {
            Response.Redirect("add_about_company.aspx");
        }

        else if (Snode.Trim() == "View About Company")
        {
            Response.Redirect("view_about_company.aspx");
        }

        else if (Snode.Trim() == "Add Events")
        {
            Response.Redirect("add_events.aspx");
        }

        else if (Snode.Trim() == "View Events")
        {
            Response.Redirect("view_events.aspx");
        }

        else if (Snode.Trim() == "Add Business")
        {
            Response.Redirect("add_business.aspx");
        }

        else if (Snode.Trim() == "View Business")
        {
            Response.Redirect("view_business.aspx");
        }

        else if (Snode.Trim() == "Add Menu Image")
        {
            Response.Redirect("add_menu_images.aspx");
        }

        else if (Snode.Trim() == "View Menu Image")
        {
            Response.Redirect("view_menu_images.aspx");
        }

        else if (Snode.Trim() == "Add Downloads")
        {
            Response.Redirect("add_downloads.aspx");
        }

        else if (Snode.Trim() == "View Downloads")
        {
            Response.Redirect("view_downloads.aspx");
        }

        else if (Snode.Trim() == "Add Pincode")
        {
            Response.Redirect("add_pincode.aspx");
        }

        else if (Snode.Trim() == "Add Pincode Delivery")
        {
            Response.Redirect("add_pincode_delivery.aspx");
        }

        else if (Snode.Trim() == "View Pincode")
        {
            Response.Redirect("view_pincode.aspx");
        }

        else if (Snode.Trim() == "Change Admin Password")
        {
            Response.Redirect("ChangePassword.aspx");
        }


        else if (Snode.Trim() == "Add Shipping Dispatch")
        {
            Response.Redirect("add_shipping_dispatch_module.aspx");
        }


        //else if (Snode.Trim() == "Add Courier Company")
        //{
        //    Response.Redirect("add_courier_company.aspx");
        //}

        //else if (Snode.Trim() == "View Courier Company")
        //{
        //    Response.Redirect("view_courier_company.aspx");
        //}

        else if (Snode.Trim() == "Add Shipping Agent")
        {
            Response.Redirect("add_courier_company.aspx");
        }

        else if (Snode.Trim() == "View Shipping Agent")
        {
            Response.Redirect("view_courier_company.aspx");
        }


        else if (Snode.Trim() == "Add Shipping Agent Contacts")
        {
            Response.Redirect("add_shipping_agent_contacts.aspx");
        }

        else if (Snode.Trim() == "View Shipping Agent Contacts")
        {
            Response.Redirect("view_shipping_agent_contacts.aspx");
        }

        // Dealers Sales      

        else if (Snode.Trim() == "Add Dealers Sales")
        {
            Response.Redirect("add_dealers_sales.aspx");
        }

        else if (Snode.Trim() == "View Dealers Sales")
        {
            Response.Redirect("ViewDealersOrders.aspx");
        }

        else if (Snode.Trim() == "View Dealers Sales Status")
        {
            Response.Redirect("view_dealers_sales_status.aspx");
        }

        else if (Snode.Trim() == "Export Dealers Sales Report")
        {
            Response.Redirect("view_dealers_sales_report.aspx");
        }  

        // offline / store sales

        else if (Snode.Trim() == "Add Store Sales")
        {
            Response.Redirect("add_store_order.aspx");
        }

        else if (Snode.Trim() == "View Store Sales")
        {
            Response.Redirect("ViewStoreOrders.aspx");
        }

        else if (Snode.Trim() == "View Store Sales Status")
        {
            Response.Redirect("view_store_sales_status.aspx");
        }

        else if (Snode.Trim() == "Export Store Sales Report")
        {
            Response.Redirect("view_store_sales_report.aspx");
        }

        // Online Sales 

        else if (Snode.Trim() == "View Online Sales")
        {
            Response.Redirect("ViewOrders.aspx");
        }

        else if (Snode.Trim() == "View Online Sales Status")
        {
            Response.Redirect("view_sales_status_report.aspx");
        }

        else if (Snode.Trim() == "Export Online Sales Report")
        {
            Response.Redirect("sales_reports.aspx");
        }

       // Print Barcode

        else if (Snode.Trim() == "Print Barcode")
        {
            Response.Redirect("ViewProductBarcode.aspx");
        }

       

        else if (Snode.Trim() == "Add Store Order")
        {
            Response.Redirect("add_store_order.aspx");
        }

        else if (Snode.Trim() == "View Store Order")
        {
            Response.Redirect("store_sales.aspx");
        }

        else if (Snode.Trim() == "Add Stocks")
        {
            Response.Redirect("add_products_quantity.aspx");
        }

        else if (Snode.Trim() == "View Stocks")
        {
            Response.Redirect("view_stocks.aspx");
        }




    }
    protected void lbtnlogout_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("default.aspx");
    }
}
