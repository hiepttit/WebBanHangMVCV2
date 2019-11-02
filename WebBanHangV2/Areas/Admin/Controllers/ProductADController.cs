using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanHangV2.DAO;
using WebBanHangV2.Models;

namespace WebBanHangV2.Areas.Admin.Controllers
{
    public class ProductADController : Controller
    {
        //
        // GET: /Admin/Product/
        public ActionResult Index()
        {
            ProductsDAO dao = new ProductsDAO();
            var lstSP = dao.GetAllSP();
            this.ViewBag.lstSP = lstSP;
            if (Session["User"] != null)
            {
                Account ac = (Account)Session["User"];
                if (ac.UserName == "admin")
                {
                    return View();
                }
            }
            return RedirectToAction("../../Home/LogIn");
        }       
        public JsonResult Save(Product item)
        {
            ProductsDAO dao = new ProductsDAO();
            var old = dao.Model.Products.FirstOrDefault(f => f.ID == item.ID);
            if (old != null)
            {
                old.ProductName = item.ProductName;
                old.Details = item.Details;
                old.Prices = item.Prices;
                this.UpdateModel(old);
                dao.Model.SaveChanges();
                return Json(new { Success = true }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(Product item)
        {
            ProductsDAO dao = new ProductsDAO();
            var old = dao.Model.Products.FirstOrDefault(f => f.ID == item.ID);
            if (old != null)
            {
                dao.Model.Products.Remove(old);
                dao.Model.SaveChanges();
                return Json(new { Success = true }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Insert(Product item)
        {
            ProductsDAO dao = new ProductsDAO();
            if (item == null)
                return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
            var old = dao.Model.Products.FirstOrDefault(f => f.ID == item.ID);
            if (old != null)
            {
                return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var oldName = dao.Model.Products.FirstOrDefault(f => f.ProductName == item.ProductName);
                if (oldName != null)
                {
                    return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
                }
                dao.Model.Products.Add(item);
                dao.Model.SaveChanges();
                return Json(new { Success = true }, JsonRequestBehavior.AllowGet);
            }
        }
	}
}