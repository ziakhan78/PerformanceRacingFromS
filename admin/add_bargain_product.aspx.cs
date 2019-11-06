using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;


public partial class Admin_add_bargain_product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["BargainProImg"] = null;
            lblHeading.Text = "Add Bargain Product";           

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetBargainProduct(id);
                BindImages(id);
            }
        }
    }

   

    private void GetBargainProduct(int id)
    {
        lblHeading.Text = "Edit Bargain Product";
        ProductsBLL obj = new ProductsBLL();
        obj.Pid = id;
        DataTable dt = new DataTable();
        dt = obj.GetBargainProduct();
        if (dt.Rows.Count > 0)
        {
            txtSku.Text = dt.Rows[0]["sku"].ToString();
            txtName.Text = dt.Rows[0]["product_name"].ToString();
            txtDesc.Content = dt.Rows[0]["product_desc"].ToString();
            txtQuantity.Text = dt.Rows[0]["quantity"].ToString();
            txtPurchasePrice.Text = dt.Rows[0]["purchase_price"].ToString();
            txtSellingPrice.Text = dt.Rows[0]["selling_price"].ToString();
            txtNotes.Content = dt.Rows[0]["notes"].ToString();
            txtProductWeight.Text = dt.Rows[0]["weight"].ToString();
            ddlColor.SelectedItem.Text = dt.Rows[0]["color"].ToString();

        }
    }
    private void AddBargainProduct()
    {
        try
        {

            if (RadAsyncUpload2.UploadedFiles.Count > 0)
            {
                Session["BargainProImg"] = null;
                UploadImages();
            }


            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            ProductsBLL obj = new ProductsBLL();
            obj.ProductName = txtName.Text.Trim().ToString();
            obj.Sku = txtSku.Text.Trim().ToString();
            obj.ProductDesc = txtDesc.Content;
            obj.Quantity = int.Parse(txtQuantity.Text.Trim().ToString());
            obj.Weight = Convert.ToDecimal(txtProductWeight.Text.Trim().ToString());
            obj.PurchasePrice = Convert.ToDecimal(txtPurchasePrice.Text.Trim().ToString());
            obj.SellingPrice = Convert.ToDecimal(txtSellingPrice.Text.Trim().ToString());
            obj.Color = ddlColor.SelectedItem.ToString();
            obj.Notes = txtNotes.Content;

            try
            {
                string strImages = Session["BargainProImg"].ToString();
                //strImages = strImages.Remove(strImages.Length - 1);
                obj.Images = strImages;
            }
            catch { obj.Images = ""; }

            obj.Ipaddress = ipaddress;
          

            int i = obj.AddBargainProduct();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Bargain Pproduct Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateBargainProduct(int id)
    {
        try
        {
            ProductsBLL obj = new ProductsBLL();
            obj.Pid = id;
            obj.ProductName = txtName.Text.Trim().ToString();
            obj.Sku = txtSku.Text.Trim().ToString();
            obj.ProductDesc = txtDesc.Content;
            obj.Quantity = int.Parse(txtQuantity.Text.Trim().ToString());
            obj.Weight = Convert.ToDecimal(txtProductWeight.Text.Trim().ToString());
            obj.PurchasePrice = Convert.ToDecimal(txtPurchasePrice.Text.Trim().ToString());
            obj.SellingPrice = Convert.ToDecimal(txtSellingPrice.Text.Trim().ToString());
            obj.Color = ddlColor.SelectedItem.ToString();
            obj.Notes = txtNotes.Content;

            try
            {
                string strImages = Session["BargainProImg"].ToString();
                //strImages = strImages.Remove(strImages.Length - 1);
                obj.Images = strImages;
            }
            catch { obj.Images = ""; }

            int i = obj.UpdateBargainProduct();

            if (i > 0)
            {
                Clear();
                ShowMsg("Bargain Pproduct Has Been Updated Successfully", "viewbargainproducts.aspx");
                
                //string jv = "<script>alert('Occasion Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
        txtName.Text = "";
        txtSku.Text = "";
        txtQuantity.Text = "";
        txtPurchasePrice.Text = "";
        txtSellingPrice.Text = "";
        txtDesc.Content = "";
        txtNotes.Content = "";
        txtProductWeight.Text = "";
        ddlColor.SelectedIndex = 0;
    } 
   
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateBargainProduct(id);
            }
            else
            {
                AddBargainProduct();
            }
        }
    }
    public void ShowMsg(string msg, string redirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + redirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
    protected void CVBrand_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            //CVBrand.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select product_name from bargain_basement_tbl where product_name='" + txtName.Text.Trim().ToString() + "'";
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

    private void BindImages(int id)
    {
        try
        {
            ProductsBLL objP = new ProductsBLL();
            objP.Pid = id;
            DataTable dt = new DataTable();
            dt = objP.GetBargainProduct();
            if (dt.Rows.Count > 0)
            {
                string thumbnail = dt.Rows[0]["images"].ToString();
                if (thumbnail != "")
                {
                    Session["BargainProImg"] = thumbnail;
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
                string strPath = "BargainProductsImages";
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
            }

            Session["BargainProImg"] = Session["BargainProImg"] + strSession.Remove(strSession.Length - 1);

        }
        catch { }

    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label lblImgPath = (Label)e.Item.FindControl("lblImgPath");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image img1 = (Image)e.Item.FindControl("img1");
         
            img1.Visible = true;
            img1.ImageUrl = "../BargainProductsImages/" + strImgPath.ToString();
           
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string strImages = "";
        if (e.CommandName == "Delete")
        {
            int pid = Int32.Parse(Request.QueryString["pid"].ToString());


            string[] aImages = Session["BargainProImg"].ToString().Split(',');
            strImages = e.CommandArgument.ToString();
            for (int i = 0; i <= aImages.Length - 1; i++)
            {
                if (strImages == aImages[i])
                {
                    if (i == 0)
                    {
                        strImages = strImages + ",";
                    }

                    else if (i == aImages.Length - 1)
                    {
                        strImages = "," + strImages;
                    }

                    else
                    {
                        strImages = strImages + ",";
                    }
                }
            }


            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateProductImages";
            obj.AddParam("@images", strImages);
            obj.AddParam("@pid", pid);

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                BindImages(pid);
            }
        }
    }
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
                obj.SetCommandQry = "select sku from bargain_products_tbl where sku='" + txtSku.Text.Trim().ToString() + "'";
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
}