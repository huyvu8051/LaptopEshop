using LaptopEshop.Services;
using LaptopEshop.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace LaptopEshop.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ProductController : Controller
    {
        
        // GET: Admin/SanPham
        public ActionResult Index(int pageNumber = 1, int pageSize = 10)
        {
            var db = ProductService.FindAll(pageNumber,pageSize);
            return View(db);
        }


       
        // GET: Admin/SanPham/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }


       
        // GET: Admin/SanPham/Create
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }


        [ValidateInput(false)]
       
        // POST: Admin/SanPham/Create
        [HttpPost]
        public ActionResult Create(Product product)
        {
            SetViewBag();
            /*, HttpPostedFileBase file*/
            try
            {
                /*if (file != null && file.ContentLength > 0)
                {
                    string _FileName = Path.GetFileName(file.FileName);
                    string _path = Path.Combine(Server.MapPath("~/Asset/img/product"), _FileName);
                    file.SaveAs(_path);
                    product.Image = file.FileName;
                   ProductService.Create(product);
                }*/
                
                ProductService.Create(product);
                /* return RedirectToAction("Index");*/
                return Redirect("/Admin/Product/Index");
            }
            catch
            {
                ViewBag.Message = "File Uploaded False!!";
                return View();
            }
        }
        

        public void SetViewBag(long? selectedId= null, Boolean? checkbox = false)
        {
            
            var categoryList = CategoryService.FindAll();
            ViewBag.CategoryId = new SelectList(categoryList, "Id", "NameVn", selectedId);
          
        }


        // GET: Admin/SanPham/Edit/5
       
        public ActionResult Edit(int id)
        {
            
            var db = ProductService.FindOneById(id);
            SetViewBag(db.CategoryId, db.Available);
            return View(db);
        }

    
        [ValidateInput(false)]
        // POST: Admin/SanPham/Edit/5
        [HttpPost]
        public ActionResult Edit(Product product, HttpPostedFileBase file = null)
        {
            try
            {
               
                if (file != null && file.ContentLength > 0)
                {
                    string _FileName = Path.GetFileName(file.FileName);
                    string _path = Path.Combine(Server.MapPath("~/Asset/img/product"), _FileName);
                    file.SaveAs(_path);
                    product.Image = file.FileName;
                   
                   
                }
                ProductService.Update(product);
                return RedirectToAction("Index");

            }
            catch
            {
                return View();
            }
        }



        // GET: Admin/SanPham/Delete/5
        public ActionResult Delete(int id)
        {
            ProductService.Delete(id);

            return RedirectToAction("Index");
        }



        // POST: Admin/SanPham/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
