
using LaptopEshop.EF;
using LaptopEshop.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.SessionState;

namespace LaptopEshop.Controllers
{
    [SessionState(SessionStateBehavior.Required)]
    public class ProductController : Controller
    {
        // GET: Shop
        public ActionResult Index(int pageNumber = 1, int pageSize = 10)
        {
          
           
            var db = ProductService.FindAll(pageNumber, pageSize);
            return View(db); 
        }

        public ActionResult Category(int id, int pageNumber = 1, int pageSize = 10)
        {
            var db = ProductService.FindAllByCategoryId(id,pageNumber,pageSize);
            //return View(db);
            return View("~/Views/Product/Index.cshtml", db);
        }
        // GET: Shop/Cart
        public ActionResult Cart()
        {
            
            return View();
        }

        // GET: Shop/Details/5
        public ActionResult Details(int id)
        {
            var db = ProductService.FindOneById(id);
            return View(db);
        }

        // GET: Shop/Create
        public ActionResult Create(int id, int pageNumber = 1, int pageSize = 10)
        {
            var cart = (List<OrderDetail>)Session["CART"];
            if (cart.Any(x => x.ProductId == id))
            {
                cart.Find(x => x.ProductId == id).Quantity += 1;
                cart.Find(x => x.ProductId == id).UnitPrice = cart.Find(x => x.ProductId == id).Quantity * cart.Find(x => x.ProductId == id).Product.UnitPrice;

            }
            else
            {
                OrderDetail orderDetail = new OrderDetail();
                Product product = ProductService.FindOneById(id);
                orderDetail.Product = product;
                orderDetail.ProductId = product.Id;
                orderDetail.Quantity = 1;
                orderDetail.UnitPrice = orderDetail.Product.UnitPrice;
                cart.Add(orderDetail);

            }
            
            Session["CART"] = cart;
            return RedirectToAction("Index", "Product", new { pageNumber, pageSize });
        }

        // POST: Shop/Create
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

        // GET: Shop/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Shop/Edit/5
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

        // GET: Shop/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Shop/Delete/5
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
