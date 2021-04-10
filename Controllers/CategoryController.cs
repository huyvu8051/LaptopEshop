
using LaptopEshop.Services;
using LaptopEshop.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace LaptopEshop.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult Index(int id, int pageNumber = 1, int pageSize = 10)
        {
          /* var db = ProductService.FindAllByCategoryId(id).ToPagedList(pageNumber, pageSize);*/


            return View();
        }
        
    }
}