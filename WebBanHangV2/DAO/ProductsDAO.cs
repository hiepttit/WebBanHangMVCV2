using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebBanHangV2.Models;

namespace WebBanHangV2.DAO
{
    public class ProductsDAO:BaseDAO
    {
        public List<Product> GetAllSP()
        {
            var lst = Model.Products.OrderBy(p => p.ID).ToList();
            return lst;
        }
        public List<Category> GetAllCategory()
        {
            var lst = Model.Categories.ToList();
            return lst;
        }
        public List<ProductsImg> ListImg(int idProducts)
        {
            return Model.ProductsImgs.Where(p => p.ProductID == idProducts).OrderBy(p => p.ID).ToList();
        }
        public List<Product> ListProductCate(int idCate)
        {
            return Model.Products.Where(p => p.CategoryID == idCate).OrderBy(p => p.ID).ToList();
        }
    }
}