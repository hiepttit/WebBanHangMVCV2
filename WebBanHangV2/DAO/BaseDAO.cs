using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebBanHangV2.Models;

namespace WebBanHangV2.DAO
{
    public class BaseDAO
    {
        public BaseDAO()
        {
            Model = new WebBanHangEntities();
        }
        public WebBanHangEntities Model { get; set; }
    }
}