using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanHangV2.Models
{
    public class GioHang
    {
        //private int productID;

        //public int ProductID
        //{
        //    get { return productID; }
        //    set { productID = value; }
        //}
        WebBanHangEntities db = new WebBanHangEntities();
        public int productID { get; set; }
        public string productName { get; set; }
        public string Image { get; set; }
        public double dDonGia { get; set; }
        public int soLuong { get; set; }
        public double ThanhTien
        {
            get { return soLuong * dDonGia; }
        }
        //Tạo giỏ hàng
        public GioHang(int iproductID)
        {
            productID = iproductID;
            Product pr = db.Products.Single(p => p.ID == productID);
            productName = pr.ProductName;
            Image = db.ProductsImgs.FirstOrDefault(p => p.ProductID == productID).ImgLink;
            dDonGia = double.Parse(pr.Prices.ToString());
            soLuong = 1;
        }
    }
}