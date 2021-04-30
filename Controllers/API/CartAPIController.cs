using LaptopEshop.Models;
using LaptopEshop.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using AuthorizeAttribute = System.Web.Mvc.AuthorizeAttribute;
using LaptopEshop.EF;
using HttpPutAttribute = System.Web.Mvc.HttpPutAttribute;

namespace LaptopEshop.Controllers
{
    public class CartAPIController : ApiController
    {
        private LaptopEshopDbContext db;

        public CartAPIController()
        {
            db = new LaptopEshopDbContext();
        }

        // GET: api/CartAPI

        public string Get(int productId = 0)
        {
            try
            {
                var userId = User.Identity.GetUserId();

              
                Cart cart = db.Carts.Find(userId, productId);
                
                if (cart != null)
                {

                    cart.Quantity += 1;

               
                }
                else
                {
                    cart = new Cart();

                    cart.UserId = userId;
                    cart.ProductId = productId;
                    cart.Quantity += 1;
                    db.Carts.Add(cart);
                }
                db.SaveChanges();
                cart.Product = db.Products.Find(cart.ProductId);
                return cart.Product.Name;
            }
            catch
            {
                return null;
            }
            
            
        }

     
        [HttpPut]
        public IHttpActionResult Put(int id, int qty)
        {
            var userId = User.Identity.GetUserId();
            var cart = db.Carts.Find(userId, id);
            if(cart == null)
            {
                return NotFound();
            }
            cart.Quantity = qty;
            db.SaveChanges();
            return Ok();
        }

        // DELETE: api/CartAPI/5
        public void Delete(int id)
        {
        }
    }
}
