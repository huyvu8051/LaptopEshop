using LaptopEshop.Services;
using LaptopEshop.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopEshop.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        [Authorize(Roles = "Admin")]
        // GET: Admin/Category
        public ActionResult Index()
        {
            var db = CategoryService.FindAll();
            return View(db);
        }
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            
            return View();
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        public ActionResult Create(Category category)
        {
            try
            {


                CategoryService.Create(category);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }


        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int id)
        {
            var db = CategoryService.FindOneById(id);
            return View(db);
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        public ActionResult Edit(Category category)
        {
            try
            {

                CategoryService.Update(category);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int id)
        {
            CategoryService.Delete(id);
            return RedirectToAction("Index");
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
              

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}