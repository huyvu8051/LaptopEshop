using LaptopEshop.EF;
using LaptopEshop.Models;
using LaptopEshop.Services;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PayPal.Api;
namespace LaptopEshop.Controllers
{
    public class OrderController : Controller
    {
        private LaptopEshopDbContext db;
        public OrderController()
        {
            db = new LaptopEshopDbContext();
        }
        // GET: Admin/Order
        [Authorize]
        public ActionResult Index()
        {
             var data = OrderService.FindByUserId(User.Identity.GetUserId());
            return View(data);
        }

        // GET: Admin/Order/Details/5
        [Authorize]
        public ActionResult Details(int id)
        {
            var userId = User.Identity.GetUserId();
            var orders = db.Orders.Where(s=>s.CustomerId == userId);
            var order = orders.Where(s => s.Id == id).FirstOrDefault();
            if(order == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, "naughty");
            }
            var orderDetails = db.OrderDetails.Where(s => s.OrderId == id);
            ViewBag.order = order;
            return View(orderDetails);
        }

        // GET: Admin/Order/Create
        [Authorize]
        public ActionResult Create()
        {
            String userId = User.Identity.GetUserId();
            var data = db.Carts.Where(s => s.UserId == userId); ;
           ViewBag.Carts = data;
            

            return View();
        }
        
        // POST: Admin/Order/Create
        [Authorize]
        [HttpPost]
        public ActionResult Create(EF.Order order)
        {
            Session.Add("order", order);
            
            return RedirectToAction("PaymentWithPaypal");
        }
        
        private void saveOrder(EF.Order order)
        {
            try
            {




                IEnumerable<Cart> data = CartService.findByUserId(User.Identity.GetUserId());
                double amount = 0L;
                foreach (Cart item in data)
                {
                    amount += item.Product.UnitPrice * item.Quantity;
                }
                order.Amount = amount;
                order.OrderDate = DateTime.Now;
                order.CustomerId = User.Identity.GetUserId();
                // TODO: Add insert logic here
                //Order newItem = OrderService.Create(order);

                db.Orders.Add(order);
                db.SaveChanges();
                OrderDetail orderDetail;
                foreach (Cart item in data)
                {
                    orderDetail = new OrderDetail();
                    orderDetail.OrderId = order.Id;
                    orderDetail.ProductId = item.ProductId;
                    orderDetail.UnitPrice = item.Product.UnitPrice;
                    orderDetail.Quantity = item.Quantity;
                    orderDetail.Discount = 0;
                    OrderDetailService.Create(orderDetail);
                }


                CartService.delete(User.Identity.GetUserId());

               // return Redirect("/Order/Index");
            }
            catch
            {
              //  return View();
            }
        }

        private Payment payment;
        private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        {
            
            var listItems = new ItemList()
            {
                items = new List<Item>()
            };
            var userId = User.Identity.GetUserId();
            IEnumerable<Cart> carts = db.Carts.Where(s => s.UserId == userId);
            foreach(var cart in carts)
            {
                listItems.items.Add(new Item()
                {
                    name = cart.Product.Name,
                    currency = "USD",
                    price = cart.Product.UnitPrice.ToString(),
                    quantity = cart.Quantity.ToString(),
                    sku = "sku"
                }) ;
            }
            var payer = new Payer()
            {
                payment_method = "paypal"
            };

            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl,
                return_url = redirectUrl
            };
            var details = new Details()
            {
                tax = "1",
                shipping = "2",
                subtotal = carts.Sum(x => x.Quantity * x.Product.UnitPrice).ToString()
            };
            var amount = new Amount()
            {
                currency = "USD",
                total = (Convert.ToDouble(details.tax) + Convert.ToDouble(details.shipping) + Convert.ToDouble(details.subtotal)).ToString(),
                details = details
            };

            var transactionList = new List<Transaction>();
            transactionList.Add(new Transaction()
            {
                description = "LaptopEshop testing transaction description",
                invoice_number = Convert.ToString((new Random()).Next(100000)),
                amount = amount,
                item_list = listItems

            }) ;


            payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls,
            };
            return payment.Create(apiContext);

        }

       

        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            
            var paymentExecution = new PaymentExecution()
            {
                payer_id = payerId
            };
            payment = new Payment()
            {
                id = paymentId
            };
            return payment.Execute(apiContext, paymentExecution);
        }

        public ActionResult PaymentWithPaypal()
        {
            
            APIContext apiContext = PaypalConfiguration.GetAPIContext();
            try
            {
                string payerId = Request.Params["PayerID"];
                if (string.IsNullOrEmpty(payerId))
                {
                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/Order/PaymentWithPaypal?";
                    var guid = Convert.ToString((new Random()).Next(100000));
                    var createdPayment = CreatePayment(apiContext, baseURI + "guid=" + guid);
                    var links = createdPayment.links.GetEnumerator();
                    string paypalRedirectUrl = string.Empty;
                    while (links.MoveNext())
                    {
                        Links link = links.Current;
                        if (link.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            paypalRedirectUrl = link.href;
                        }
                    }
                    Session.Add(guid, createdPayment.id);
                    return Redirect(paypalRedirectUrl);
                }
                else
                {
                    var guid = Request.Params["guid"];
                    var executePayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
                    if(executePayment.state.ToLower() != "approved")
                    {
                        return View("Failure");
                    }
                }
            }catch(Exception ex)
            {
                PaypalLogger.Log("Error: " + ex.Message);
                return View("Failure");

            }
            var ord = (EF.Order) Session["order"];
            saveOrder(ord);
            return RedirectToAction("Index");
        }




      
        // GET: Admin/Order/Edit/5
        
    }
}
