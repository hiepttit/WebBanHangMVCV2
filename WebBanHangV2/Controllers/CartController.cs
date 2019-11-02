using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanHangV2.DAO;
using WebBanHangV2.Models;

namespace WebBanHangV2.Controllers
{
    public class CartController : Controller
    {
        //Lấy giỏ hàng
        WebBanHangEntities db = new WebBanHangEntities();
        public List<GioHang> GetCart()
        {
            List<GioHang> lstCart = Session["cart"] as List<GioHang>;
            if (lstCart == null)
            {
                lstCart = new List<GioHang>();
                Session["cart"] = lstCart;
            }
            return lstCart;
        }
        public ActionResult AddCart(int productID, string Url)
        {
            Product pr = db.Products.SingleOrDefault(p => p.ID == productID);
            if (pr == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstCart = GetCart();
            //Kiểm tra sp đã tồn tại chưa
            GioHang cart = lstCart.Find(n => n.productID == productID);
            if (cart == null)
            {
                cart = new GioHang(productID);
                lstCart.Add(cart);
                return Redirect(Url);
            }
            else
            {
                cart.soLuong++;
                return Redirect(Url);
            }
        }
        public ActionResult UpdateCart(int productID, string f)
        {
            Product pr = db.Products.SingleOrDefault(p => p.ID == productID);
            if (pr == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstCart = GetCart();
            GioHang sp = lstCart.SingleOrDefault(p => p.productID == productID);
            if (sp != null)
            {
                sp.soLuong = int.Parse(f);
            }
            return RedirectToAction("Cart");
        }
        public ActionResult DeleteCart(int productID)
        {
            Product pr = db.Products.SingleOrDefault(p => p.ID == productID);
            if (pr == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstCart = GetCart();
            GioHang sp = lstCart.SingleOrDefault(p => p.productID == productID);
            if (sp != null)
            {
                lstCart.RemoveAll(p => p.productID == sp.productID);
            }
            if (lstCart.Count == 0)
            {
                return RedirectToAction("index", "Home");
            }
            return RedirectToAction("cart");
        }
        public ActionResult DeleteCartAll()
        {
            List<GioHang> lstCart = GetCart();
            lstCart.Clear();
            if (lstCart.Count == 0)
            {
                return RedirectToAction("index", "Home");
            }
            return RedirectToAction("cart");

        }
        public ActionResult Cart()
        {
            if (Session["Cart"] == null)
            {
                return RedirectToAction("index", "Home");
            }
            List<GioHang> lstCart = GetCart();
            return View(lstCart);
        }
        private int SumAmount()
        {
            int s = 0;
            List<GioHang> lstCart = Session["cart"] as List<GioHang>;
            if (lstCart != null)
            {
                s = lstCart.Sum(n => n.soLuong);
            }
            return s;
        }
        private double SumMoney()
        {
            double s = 0;
            List<GioHang> lstCart = Session["cart"] as List<GioHang>;
            if (lstCart != null)
            {
                s = lstCart.Sum(n => n.ThanhTien);
            }
            return s;
        }
        public ActionResult CartPartial()
        {
            if (SumAmount() == 0)
            {
                ViewBag.SumSL = 0;
                return PartialView();
            }
            ViewBag.SumSL = SumAmount();
            return PartialView();
        }
        public ActionResult InsertCart()
        {
            if (Session["User"] != null)
            {
                Cart item=new Cart();
                CartDetail cd=new CartDetail();
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
                    List<GioHang> lst = GetCart();
                    var s = 0.0;
                    foreach (var cart in lst)
                    {
                        cd.ProductsID=cart.productID;
                        cd.CartID = item.ID;
                        cd.TheCount = cart.soLuong;
                        cd.Price = cart.ThanhTien;
                        s = s + cart.ThanhTien;
                    }                  
                    dao.Model.CartDetails.Add(cd);
                    dao.Model.SaveChanges();
                    bill.CartID = dao.Model.Carts.OrderByDescending(y => y.ID).Select(y => y.ID).FirstOrDefault();
                    bill.TotalPrices = s;
                    if (bill.DiscountPercent != null && bill.DiscountPercent != 0)
                    {
                        bill.PayPrice = bill.TotalPrices-bill.DiscountPercent * bill.TotalPrices;
                    }
                    bill.CreateAt = DateTime.Now;
                    dao.Model.Bills.Add(bill);
                    dao.Model.SaveChanges();
                    DeleteCartAll();
                    return RedirectToAction("index", "Home");
                }
            }
            return RedirectToAction("LogIn", "Home");
        }
    }
}