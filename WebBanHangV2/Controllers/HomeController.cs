using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using WebBanHangV2.DAO;
using WebBanHangV2.Models;
using PagedList;
using PagedList.Mvc;

namespace WebBanHangV2.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index(int? page)
        {
            ProductsDAO dao = new ProductsDAO();
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            var lstSP = dao.GetAllSP();
            this.ViewBag.lstSP = lstSP;
            return View(lstSP.Where(p=>p.Sales==1).ToPagedList(pageNumber,pageSize));
        }
        public String ImageMainItem(int id)
        {
            string temp = "";
            ProductsDAO dao = new ProductsDAO();
            var old = dao.Model.ProductsImgs.FirstOrDefault(f => f.ProductID == id);
            if (old != null)
                temp = old.ImgLink.ToString();
            return temp;
        }
        public ActionResult Register()
        {
            return View();
        }
        public JsonResult InsertRegister(Customer item, Account ac)
        {
            ProductsDAO dao = new ProductsDAO();
            if (item == null || ac==null)
                return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
            var old = dao.Model.Customers.FirstOrDefault(f => f.ID == item.ID);
            var oldAc = dao.Model.Accounts.FirstOrDefault(f => f.id == ac.id);
            if (old != null && oldAc!=null)
            {
                return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
            }
            else
            {                               
                var oldAcName = dao.Model.Accounts.FirstOrDefault(f => f.UserName == ac.UserName);
                if (oldAcName!=null)
                {
                    return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    dao.Model.Customers.Add(item);
                    dao.Model.SaveChanges();
                    ac.RoleID = 1;
                    ac.CustomerID = dao.Model.Customers.OrderByDescending(y => y.ID).Select(y => y.ID).FirstOrDefault();
                    ac.Pwd = MD5Hash(ac.Pwd);
                    dao.Model.Accounts.Add(ac);
                    dao.Model.SaveChanges();
                    return Json(new { Success = true }, JsonRequestBehavior.AllowGet);
                }
            }
        }
        public ActionResult LogIn()
        {
            return View();
        }
        public ActionResult LogOut()
        {
            Session.Remove("User");
            Session.Remove("UserID");
            Session.Remove("Cart");
            return RedirectToAction("Index");
        }
        public static string MD5Hash(string text)
        {
            MD5 md5 = new MD5CryptoServiceProvider();

            //compute hash from the bytes of text  
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));

            //get hash result after compute it  
            byte[] result = md5.Hash;

            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                //change it into 2 hexadecimal digits  
                //for each byte  
                strBuilder.Append(result[i].ToString("x2"));
            }

            return strBuilder.ToString();
        }  
        public JsonResult ValidateUser(string userid, string password)
        {
            ProductsDAO dao = new ProductsDAO();
            var Pwd = MD5Hash(password);
            var data = from c in dao.Model.Accounts where c.UserName == userid && c.Pwd == Pwd select c;
            if (data.Count() > 0)
            {
                var abc = data.FirstOrDefault(p => p.UserName == userid);
                Session["User"] = data.FirstOrDefault(p => p.UserName == userid);
                if (userid=="admin")
                {
                    return Json(new { Success = "Admin" }, JsonRequestBehavior.AllowGet);
                }
                Session["UserID"] = userid;
                return Json(new { Success = true }, JsonRequestBehavior.AllowGet);
            }

            else
                return Json(new { Success = false }, JsonRequestBehavior.AllowGet);
        }
	}
}