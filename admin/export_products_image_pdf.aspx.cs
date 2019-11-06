using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Drawing;

public partial class admin_export_products_image_pdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid();
    }

    private void BindGrid()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_Products";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
       
    }
    protected void Export_Grid(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        switch (btn.CommandArgument)
        {
            case "Word":
                Word_Export();
                break;
            case "Excel":
                Excel_Export();
                break;
            case "PDF":
                PDF_Export();
                break;
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    private void Word_Export()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.doc");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-word ";
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        GridView1.AllowPaging = false;
        GridView1.DataBind();
        GridView1.RenderControl(hw);
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
    }
    private void Excel_Export()
    {
        //Response.Clear();
        //Response.Buffer = true;
        //Response.AddHeader("content-disposition",
        // "attachment;filename=GridViewExport.xls");
        //Response.Charset = "";
        //Response.ContentType = "application/vnd.ms-excel";
        //StringWriter sw = new StringWriter();
        //HtmlTextWriter hw = new HtmlTextWriter(sw);
        //GridView1.AllowPaging = false;
        //GridView1.DataBind();
        //for (int i = 0; i < GridView1.Rows.Count; i++)
        //{
        //    GridViewRow row = GridView1.Rows[i];
        //    //Apply text style to each Row
        //    row.Attributes.Add("class", "textmode");
        //}
        //GridView1.RenderControl(hw);

        ////style to format numbers to string
        //string style = @"<style> .textmode { mso-number-format:\@; } </style>";
        //Response.Write(style);
        //Response.Output.Write(sw.ToString());
        //Response.Flush();
        //Response.End();

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            GridView1.AllowPaging = false;
            this.BindGrid();

            GridView1.HeaderRow.BackColor =System.Drawing.Color.Green;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = System.Drawing.Color.Blue;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.Width = 50;
                    cell.Height = 100;
                    cell.CssClass = "textmode";
                   
                }
            }

            GridView1.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { mso-number-format:\@; text-align:center;} </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }
    private void PDF_Export()
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        GridView1.AllowPaging = false;
        GridView1.DataBind();
        GridView1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
    protected string GetUrl(string imagepath)
    {
       
            //imagepath= "http://performanceracing.in/productsimages/" + strImages[0].ToString();
        //imagepath = "http://localhost:1357/productsimages/";// +strImages[0].ToString();

        string[] splits = Request.Url.AbsoluteUri.Split('/');
        if (splits.Length >= 2)
        {
            string url = splits[0] + "//";

            url += splits[2] + "/ProductsImages/";
            //for (int i = 2; i < splits.Length - 1; i++)
            //{
            //    url += splits[i];
            //    url += "/";
            //}
            return url + imagepath;
        }

       // imagepath = imagepath.Replace("admin", "ProductsImages");
        return imagepath;
    }   
    
}
