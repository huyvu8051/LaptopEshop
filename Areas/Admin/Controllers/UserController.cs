using LaptopEshop.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopEshop.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        [Authorize(Roles = "Admin")]
        // GET: Admin/User
        public ActionResult Index(int pageNumber = 1, int pageSize = 10)
        {
            var db =  UserService.findAll(pageNumber, pageSize);
            return View(db);
        }

        [Authorize(Roles = "Admin")]
        // GET: Admin/User/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }


        [Authorize(Roles = "Admin")]
        // GET: Admin/User/Create
        public ActionResult Create()
        {
            return View();
        }


    }
}
