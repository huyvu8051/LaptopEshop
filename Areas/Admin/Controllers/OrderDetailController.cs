using LaptopEshop.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopEshop.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class OrderDetailController : Controller
    {
        // GET: Admin/OrderDetail
        public ActionResult Index(int orderId,int pageNumber = 1, int pageSize = 10)
        {
            var db =  OrderDetailService.findByOrderId(orderId, pageNumber, pageSize);
            return View(db);
        }

        // GET: Admin/OrderDetail/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/OrderDetail/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/OrderDetail/Create
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

        // GET: Admin/OrderDetail/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Admin/OrderDetail/Edit/5
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

        // GET: Admin/OrderDetail/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Admin/OrderDetail/Delete/5
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
