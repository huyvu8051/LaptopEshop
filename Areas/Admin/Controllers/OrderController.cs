using LaptopEshop.EF;
using LaptopEshop.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopEshop.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class OrderController : Controller
    {
        private LaptopEshopDbContext db;
        public OrderController()
        {
            db = new LaptopEshopDbContext();
        }
        
        // GET: Admin/Order
        public ActionResult Index(int pageNumber = 1, int pageSize = 10)
        {
            var data = OrderService.findAll(pageNumber,pageSize);
            return View(data);
        }


        // GET: Admin/Order/Details/5
        public ActionResult Details(int id)
        {
            var data = db.OrderDetails.Where(s => s.OrderId == id);
            return View(data);
        }

       
       


        // GET: Admin/Order/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Admin/Order/Edit/5
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

        // GET: Admin/Order/Delete/5
        public ActionResult Delete(int id)
        {
            var order = db.Orders.Find(id);
            db.Orders.Remove(order);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // POST: Admin/Order/Delete/5
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
