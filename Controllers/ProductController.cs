
using LaptopEshop.EF;
using LaptopEshop.Services;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Web.SessionState;

namespace LaptopEshop.Controllers
{
    [SessionState(SessionStateBehavior.Required)]
    public class ProductController : Controller
    {
        private LaptopEshopDbContext db;
        public ProductController()
        {
            db = new LaptopEshopDbContext();
        }
        // GET: Shop
        public ActionResult Index(int pageNumber = 1, int pageSize = 5, string search = "", int category = 0, int reverse = 0)
        {
            IEnumerable<Product> data = db.Products.ToList().OrderByDescending(s=>s.ProductDate);
            if (!search.Equals(""))
            {
                search = ConvertToUnSign(search);
                data = db.Products.Where(x => SqlFunctions.PatIndex("%"+search+"%", x.Name) > 0).ToList();
                ViewBag.search = search;
            }
            if(category != 0)
            {
                data = data.Where(s => s.CategoryId == category);
                ViewBag.category = category;
            }
            if(reverse != 0)
            {
                data = data.OrderByDescending(s => s.UnitPrice).Reverse();
                ViewBag.reverse = reverse;
            }
            data = data.ToPagedList(pageNumber,pageSize);

            ViewBag.categories = db.Categories.ToList();
           
            return View(data); 
        }

        public ActionResult Category(int id, int pageNumber = 1, int pageSize = 10)
        {
            var data = ProductService.FindAllByCategoryId(id,pageNumber,pageSize);
            //return View(db);
            return View("~/Views/Product/Index.cshtml", data);
        }
        // GET: Shop/Cart
        public ActionResult Cart()
        {
            
            return View();
        }

      
        // GET: Shop/Details/5
        public ActionResult Details(int id)
        {
            Product data = ProductService.FindOneById(id);
            if (Session["history"] == null)
            {
                Session["history"] = new List<Product>();
            }
            List<Product> histories = (List<Product>)Session["history"];
            if(histories.Where(s=>s.Id == data.Id).Count() == 0)
            {
                histories.Add(data);
               
            }
            else
            {
                histories.Remove(histories.Where(s => s.Id == data.Id).FirstOrDefault());
                histories.Add(data);
            }
            Session["history"] = histories;
            IEnumerable<Product> list = histories;
            ViewBag.histories = list.Reverse();
            return View(data);
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
        private string ConvertToUnSign(string input)
        {
            input = input.Trim();
            for (int i = 0x20; i < 0x30; i++)
            {
                input = input.Replace(((char)i).ToString(), " ");
            }
            Regex regex = new Regex(@"\p{IsCombiningDiacriticalMarks}+");
            string str = input.Normalize(NormalizationForm.FormD);
            string str2 = regex.Replace(str, string.Empty).Replace('đ', 'd').Replace('Đ', 'D');
            while (str2.IndexOf("?") >= 0)
            {
                str2 = str2.Remove(str2.IndexOf("?"), 1);
            }
            return str2;
        }
    }
}
