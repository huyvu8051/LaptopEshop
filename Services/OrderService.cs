using LaptopEshop.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaptopEshop.Services
{

    public class OrderService
    {
        private static LaptopEshopDbContext db = new LaptopEshopDbContext();
        public static IEnumerable<Order> findAll(int pageNumber, int pageSize)
        {
            return db.Orders.ToList().OrderByDescending(x => x.Id).ToPagedList(pageNumber, pageSize);
        }

        

        public static IEnumerable<Order>  FindByUserId(string id)
        {

            return db.Orders.SqlQuery("Select * from Orders where CustomerId = '"+id+"'");
        }public static Order FindOneByUserId(int id)
        {

            return db.Orders.Find(id);
        }
        public static Order Create(Order order)
        { 
            Order newItem = db.Orders.Add(order);
            db.SaveChanges();
            return newItem;
        }
        
    }
}