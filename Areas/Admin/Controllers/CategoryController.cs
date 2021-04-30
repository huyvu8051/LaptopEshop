using LaptopEshop.Services;
using LaptopEshop.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopEshop.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class CategoryController : Controller
    {
        
        // GET: Admin/Category
        public ActionResult Index()
        {
            var db = CategoryService.FindAll();
            return View(db);
        }
      
        public ActionResult Create()
        {
            
            return View();
        }

       
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


       
        public ActionResult Edit(int id)
        {
            var db = CategoryService.FindOneById(id);
            return View(db);
        }

      
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

    
        public ActionResult Delete(int id)
        {
            CategoryService.Delete(id);
            return RedirectToAction("Index");
        }

      
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