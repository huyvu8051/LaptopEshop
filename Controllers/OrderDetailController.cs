using LaptopEshop.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopEshop.Controllers
{
    [Authorize]
    public class OrderDetailController : Controller
    {
        // GET: OrderDetail
        public ActionResult Index()
        {
           /* IEnumerable<Cart> db = CartService.findByUserId(User.Identity.GetUserId());
            OrderService.FindOneById
            OrderDetailService.findByOrderId();*/
            return View();
        }

        // GET: OrderDetail/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: OrderDetail/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: OrderDetail/Create
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

        // GET: OrderDetail/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: OrderDetail/Edit/5
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

        // GET: OrderDetail/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: OrderDetail/Delete/5
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
