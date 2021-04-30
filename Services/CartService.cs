using LaptopEshop.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace LaptopEshop.Services
{
    public class CartService
    {
        private static LaptopEshopDbContext db = new LaptopEshopDbContext();
        public static IEnumerable<Cart> findByUserId(String id)
        {
            return db.Carts.Where(s => s.UserId == id);
            // return db.Carts.SqlQuery("Select * from Carts where UserId ='" + id + "'");
            //return db.Carts.Find(id);
        }
        public static Cart add(string userId, int productId)
        {
            
           
            //Cart cart = db.Carts.SqlQuery("Select * from Carts where userId = '" + userId + "' and productId ='" +productId+"'").FirstOrDefault();
            Cart cart = db.Carts.Find(userId, productId);
            if (cart != null)
            {

                cart.Quantity += 1;

                //db.Carts.SqlQuery("Update set Quantity = "+cart.Quantity+" from Carts where userId = '" + userId + "' and productId = '" +productId+"'");
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
            return cart;



        }
        public static void delete(string userId, int productId)
        {
            Cart cart = db.Carts.Find(userId, productId);
            db.Carts.Remove(cart);
            db.SaveChanges();

        }
        public static void delete(string userId)
        {
            IEnumerable<Cart> cart = db.Carts.Where(s =>  s.UserId == userId);
            foreach(var item in cart)
            db.Carts.Remove(item);
            db.SaveChanges();

        }
    }
}