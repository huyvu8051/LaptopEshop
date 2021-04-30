using LaptopEshop.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace LaptopEshop.Services
{
  
    public class ProductService
    {  
        private static LaptopEshopDbContext db = new LaptopEshopDbContext();
        public static IEnumerable<Product> FindAll(int pageNumber, int pageSize)
        {
           
            return db.Products.OrderByDescending(x => x.Id).ToPagedList(pageNumber, pageSize);
        }

        public static IEnumerable<Product> FindAllByCategoryId(int id, int pageNumber, int pageSize)
        {
            //throw new NotImplementedException();
            return db.Products.Where(x => x.CategoryId == id).OrderByDescending(x => x.Id).ToPagedList(pageNumber, pageSize);
        }

        public static Product FindOneById(int id) {

            return db.Products.Find(id);
        }
        public static void Create(Product product)
        {
            product.Category = db.Categories.Find(product.CategoryId);
            product.ProductDate = DateTime.Now;
            db.Products.Add(product);
            
            db.SaveChanges();
        }
        public static void Update(Product product)
        {
            var pro = db.Products.Find(product.Id);
            pro.CategoryId = product.CategoryId;
            pro.Available = product.Available;
            pro.Description = product.Description;
            pro.Discount = product.Discount;
            pro.Image = product.Image;
            pro.Name = product.Name;
            pro.ProductDate = product.ProductDate;
            pro.Quantity = product.Quantity;
            pro.UnitPrice = product.UnitPrice;
            db.SaveChanges();
        }
        public static void Delete(int  id)
        {
            /*Product product = db.Products.Find(id);
            db.Products.Remove(product);*/
            /*db.Products.SqlQuery("Delete from Products where id ='" + id + "'");*/
            db.Products.Remove(db.Products.Single(a => a.Id == id));
            db.SaveChanges();
        }
    }
}