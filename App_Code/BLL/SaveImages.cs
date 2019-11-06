using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO; // this is for the file upload
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;


/// <summary>
/// Summary description for SaveImages
/// </summary>
public class SaveImages
{
	public SaveImages()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    

    public string AddImages(HttpPostedFile filePath, string location)
    {
        string imgPath = "";
        string ext;
        string ipath = "";

        if (filePath.FileName!="")
        {
            imgPath = filePath.FileName;           
            imgPath = imgPath.Substring(imgPath.LastIndexOf("\\") + 1);
            string imageTime = System.DateTime.Now.ToString();
            imageTime = imageTime.Replace("/", "");
            imageTime = imageTime.Replace(":", "");
            imageTime = imageTime.Replace(" ", "");
            ext = imgPath.Substring(imgPath.LastIndexOf("."));
            imgPath = imgPath.Substring(0, imgPath.LastIndexOf("."));
            imgPath = imgPath + "_" + imageTime + ext;

            try
            {
                string ss=System.Web.HttpContext.Current.Server.MapPath("~");
                ipath = ss + "/" + location + "/" + imgPath;
                filePath.SaveAs(ipath);

            }
            catch (Exception ex)
            {
                string ss = ex.Message;
            }
        }
        return imgPath;

    }

   

    //public string AddImagesResize(HttpPostedFile filePath, string location)
    //{
    //    string filename = "";
    //    // First we check to see if the user has selected a file
    //    if (filePath.FileName != "")
    //    {
    //        // Find the fileUpload control
    //        filename = filePath.FileName;

    //        //// Check if the directory we want the image uploaded to actually exists or not
    //        //if (!Directory.Exists(MapPath(@"Uploaded-Files")))
    //        //{
    //        //    // If it doesn't then we just create it before going any further
    //        //    Directory.CreateDirectory(MapPath(@"Uploaded-Files"));
    //        //}

    //        //// Specify the upload directory
    //        //string directory = Server.MapPath(@"Uploaded-Files\");

    //        // Create a bitmap of the content of the fileUpload control in memory
    //        Bitmap originalBMP = new Bitmap(filePath.FileContent);

    //        // Calculate the new image dimensions
    //        ////int origWidth = originalBMP.Width;
    //        ////int origHeight = originalBMP.Height;
    //        ////int sngRatio = origWidth / origHeight;
    //        ////int newWidth = 100;
    //        ////int newHeight = newWidth / sngRatio;

    //        decimal origWidth = originalBMP.Width;
    //        decimal origHeight = originalBMP.Height;
    //        decimal sngRatio = origHeight / origWidth;
    //        int newHeight = 110;  //hight in pixels
    //        decimal newWidth_temp = newHeight / sngRatio;
    //        int newWidth = Convert.ToInt16(newWidth_temp);

    //        // Create a new bitmap which will hold the previous resized bitmap
    //        Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);                // Create a graphic based on the new bitmap
    //        Graphics oGraphics = Graphics.FromImage(newBMP);

    //        // Set the properties for the new graphic file
    //        oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;                // Draw the new graphic based on the resized bitmap
    //        oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);

    //        // Save the new graphic file to the server

    //        string ipath = "";
    //        string ss = System.Web.HttpContext.Current.Server.MapPath("~");
    //        ipath = ss + "/" + "District3140MembersImage" + "/" + filename;
    //        newBMP.Save(ipath);

    //        // Once finished with the bitmap objects, we deallocate them.
    //        originalBMP.Dispose();
    //        newBMP.Dispose();
    //        oGraphics.Dispose();

    //        // Write a message to inform the user all is OK
    //        //label.Text = "File Name: <b style='color: red;'>" + filename + "</b><br>";
    //        //label.Text += "Content Type: <b style='color: red;'>" + fileUpload.PostedFile.ContentType + "</b><br>";
    //        //label.Text += "File Size: <b style='color: red;'>" + fileUpload.PostedFile.ContentLength.ToString() + "</b>";                // Display the image to the user
    //        //Image1.Visible = true;
    //        //Image1.ImageUrl = @"/Uploaded-Files/tn_" + filename;
    //        // MemImage.ImageUrl = "District3140MembersImage/" + filename;


    //    }
    //    return filename;

    //}
}
