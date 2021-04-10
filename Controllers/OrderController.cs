using LaptopEshop.EF;
using LaptopEshop.Services;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopEshop.Controllers
{
    public class OrderController : Controller
    {
        // GET: Admin/Order
        public ActionResult Index()
        {
             var db = OrderService.FindByUserId(User.Identity.GetUserId());
            return View(db);
        }

        // GET: Admin/Order/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/Order/Create
        public ActionResult Create()
        {
            
            return View();
        }

        // POST: Admin/Order/Create
        [HttpPost]
        public ActionResult Create(Order order)
        {
            try
            {
                IEnumerable<Cart> db = CartService.findByUserId(User.Identity.GetUserId());
                double amount = 0L;
                foreach(Cart item in db)
                {
                    amount += item.Product.UnitPrice * item.Quantity;
                }
                order.Amount = amount;
                order.OrderDate = DateTime.Now;
                order.CustomerId = User.Identity.GetUserId();  
             // TODO: Add insert logic here
                Order newItem = OrderService.Create(order);
                OrderDetail orderDetail;
                foreach(Cart item in db)
                {
                    orderDetail = new OrderDetail();
                    orderDetail.OrderId = order.Id;
                    orderDetail.ProductId = item.ProductId;
                    orderDetail.UnitPrice = item.Product.UnitPrice;
                    orderDetail.Quantity = item.Quantity;
                    orderDetail.Discount = 0;
                    OrderDetailService.Create(orderDetail);
                }

                foreach(Cart cart in db)
                {
                    CartService.delete(cart.UserId, cart.ProductId);
                }
                return Redirect("/Order/Index");
            }
            catch
            {
                return View();
            }
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
            return View();
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
