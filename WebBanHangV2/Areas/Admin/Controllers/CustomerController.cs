using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanHangV2.DAO;
using WebBanHangV2.Models;

namespace WebBanHangV2.Areas.Admin.Controllers
{
    public class CustomerController : Controller
    {
        //
        // GET: /Admin/Customer/
        public ActionResult Customer()
        {
            ProductsDAO dao = new ProductsDAO();
            var lstCt = dao.GetAllCustomer();
            this.ViewBag.lstCt = lstCt;
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
        public JsonResult Save(Customer item)
        {
            ProductsDAO dao = new ProductsDAO();
            var old = dao.Model.Customers.FirstOrDefault(f => f.ID == item.ID);
            if (old != null)
            {
                old.Name = item.Name;
                old.Addresss = item.Addresss;
                old.DateOfBirth = item.DateOfBirth;
                old.Tel = item.Tel;
                old.Email = item.Email;
                this.UpdateModel(old);
                dao.Model.SaveChanges();
                return Json(new { Success = true }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(Customer item)
        {
            ProductsDAO dao = new ProductsDAO();
            var old = dao.Model.Customers.FirstOrDefault(f => f.ID == item.ID);
            if (old != null)
            {
                dao.Model.Customers.Remove(old);
                dao.Model.SaveChanges();
                return Json(new { Success = true }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Insert(Customer item)
        {
            ProductsDAO dao = new ProductsDAO();
            if (item == null)
                return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
            var old = dao.Model.Customers.FirstOrDefault(f => f.ID == item.ID);
            if (old != null)
            {
                return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var oldName = dao.Model.Customers.FirstOrDefault(f => f.Name == item.Name);
                if (oldName != null)
                {
                    return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
                }
                dao.Model.Customers.Add(item);
                dao.Model.SaveChanges();
                return Json(new { Success = true }, JsonRequestBehavior.AllowGet);
            }
        }
	}
}