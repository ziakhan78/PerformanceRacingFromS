using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class product_review_popup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ratingMsg.Visible = false;
        }
    }
    protected void btnPost_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            AddProductReview();
        }
    }
    private void AddProductReview()
    {
        int productId = int.Parse(Session["ProductId"].ToString());
        int userId = int.Parse(Session["CustomerID"].ToString());


        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddProductReview";
        obj.AddParam("@user_id", userId);
        obj.AddParam("@product_id", productId);
        obj.AddParam("@review_title", txtTitle.Text.Trim());
        obj.AddParam("@review", txtDesc.Text.Trim());
        obj.AddParam("@rating", int.Parse(RadRating1.DbValue.ToString()));
       // obj.AddParam("@location", txtLocation.Text.Trim());

        if (obj.ExecuteNonQuery() > 0)
        {
            txtDesc.Text = "";
           // txtLocation.Text = "";
            txtTitle.Text = "";
            ratingMsg.Visible = true;
        }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = (Int32.Parse(args.Value) > 0);
    }
}