using LaptopEshop.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaptopEshop.Services
{
    public class OrderDetailService
    {
        private static LaptopEshopDbContext db = new LaptopEshopDbContext();
        public static IEnumerable<OrderDetail> findByOrderId(int id, int pageNumber, int pageSize)
        {
            return db.OrderDetails.OrderByDescending(x => x.Id).ToPagedList(pageNumber, pageSize);
        }
        public static void Create(OrderDetail orderDetail)
        {
            db.OrderDetails.Add(orderDetail);
            db.SaveChanges();
        }
    }
}