using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanHangV2.Models;

namespace WebBanHangV2.Areas.Admin.Controllers
{
    public class HomeADController : Controller
    {
        //
        // GET: /Admin/Home/
        public ActionResult Index()
        {
            if(Session["User"]!=null)
            {
                Account ac = (Account)Session["User"];
                if (ac.UserName == "admin")
                {
                    return View();
                }
            }
           
            return RedirectToAction("../../Home/LogIn");
        }
	}
}