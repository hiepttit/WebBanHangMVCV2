using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanHangV2.DAO;
using PagedList;
using WebBanHangV2.Models;

namespace WebBanHangV2.Controllers
{
    public class ProductsController : Controller
    {
        //
        // GET: /Products/
        public ActionResult Category(int id)
        {
            ProductsDAO dao = new ProductsDAO();
            var lstProductCate = dao.ListProductCate(id);
            this.ViewBag.lstProductCate = lstProductCate;
            return View();
        }
        public ActionResult Detail(int id)
        {
            this.ViewBag.lstImg = ImageDetail(id);
            ProductsDAO dao = new ProductsDAO();
            var old = dao.Model.Products.FirstOrDefault(f => f.ID == id);
            if (old != null)
            {
                var lstProductCate = dao.ListProductCate(Convert.ToInt32(old.CategoryID));
                this.ViewBag.item = old;
                this.ViewBag.lstProductCate = lstProductCate;
            }
            return View();
        }

        public ActionResult CheckOut()
        {
            return View();
        }
        public String ImageMainDetail(int id)
        {
            string temp = "";
            ProductsDAO dao = new ProductsDAO();
            var old = dao.Model.ProductsImgs.FirstOrDefault(f => f.ProductID == id);
            if (old != null)
                temp = old.ImgLink;
            return temp;
        }
        public ActionResult GetCategoryList()
        {
            ProductsDAO dao = new ProductsDAO();
            var lstCt = dao.GetAllCategory();
            return PartialView(lstCt);
        }
        public List<string> ImageDetail(int id)
        {
            ProductsDAO dao = new ProductsDAO();
            var lstImg = dao.ListImg(id);
            List<string> lst = new List<string>();
            foreach (var item in lstImg)
            {
                lst.Add(item.ImgLink);
            }
            return lst;
        }
        WebBanHangEntities db = new WebBanHangEntities();
        [HttpGet]
        public ActionResult Search(int? page, string searchString)
        {
            ViewBag.TK = searchString;
            List<Product> lstKQTK = db.Products.Where(n => n.ProductName.Contains(searchString)).ToList();
            int pageNumber = (page ?? 1);
            int pageSize = 6;

            if (searchString == "")
            {
                ViewBag.TB = "Nhập từ khóa để tìm kiếm";
            }
            return View(lstKQTK.OrderBy(n => n.ProductName).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult InsertCart(int id)
        {
            if (Session["User"] != null)
            {
                Cart item = new Cart();
                CartDetail cd = new CartDetail();
                Bill bill = new Bill();
                ProductsDAO dao = new ProductsDAO();
                var old = dao.Model.Carts.FirstOrDefault(f => f.ID == item.ID);
                var oldAc = dao.Model.CartDetails.FirstOrDefault(f => f.CartID == cd.CartID);
                if (old != null && oldAc != null)
                {
                    return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    Account us = (Account)Session["User"];
                    item.CustomerID = us.CustomerID;
                    dao.Model.Carts.Add(item);
                    var pr = dao.Model.Products.FirstOrDefault(f => f.ID == id);
                    if (pr != null)
                    {
                        cd.ProductsID = pr.ID;
                        cd.CartID = item.ID;
                        cd.TheCount = 1;
                        cd.Price = pr.Prices;
                    }
                    dao.Model.CartDetails.Add(cd);
                    dao.Model.SaveChanges();
                    bill.CartID = dao.Model.Carts.OrderByDescending(y => y.ID).Select(y => y.ID).FirstOrDefault();
                    bill.TotalPrices = cd.Price;
                    if (bill.DiscountPercent != null && bill.DiscountPercent != 0)
                    {
                        bill.PayPrice = bill.TotalPrices - bill.DiscountPercent * bill.TotalPrices;
                    }
                    bill.CreateAt = DateTime.Now;
                    dao.Model.Bills.Add(bill);
                    dao.Model.SaveChanges();
                    return RedirectToAction("index", "Home");
                }
            }
            return RedirectToAction("index", "Home");
        }
    }
}