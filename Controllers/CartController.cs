using LaptopEshop.EF;
using LaptopEshop.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using LaptopEshop.Models;

namespace LaptopEshop.Controllers
{
    [Authorize]
    public class CartController : Controller
    {
        private LaptopEshopDbContext db;
        public CartController()
        {
            db = new LaptopEshopDbContext();
        }
        // GET: ShoppingCart
        public ActionResult Index()
        {
            String userId = User.Identity.GetUserId();
            var data = db.Carts.Where(s => s.UserId == userId);
            return View(data);
        }
        
       

        // GET: ShoppingCart/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ShoppingCart/Create
        public ActionResult Create(int id = 0)
        {
            CartService.add(User.Identity.GetUserId(), id);
            return Redirect("/Product/Index");
        }

        // POST: ShoppingCart/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ShoppingCart/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ShoppingCart/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ShoppingCart/Delete/5
        public ActionResult Delete(int id)
        {
            CartService.delete(User.Identity.GetUserId(), id);
            return RedirectToAction("Index");
        }

        // POST: ShoppingCart/Delete/5
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
