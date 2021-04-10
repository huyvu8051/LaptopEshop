using LaptopEshop.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaptopEshop.Services
{
    public class CategoryService
    {
        private static LaptopEshopDbContext db = new LaptopEshopDbContext();
        public static IEnumerable<Category> FindAll()
        {
            return db.Categories.ToList();
        }
        public static Category FindOneById(int id)
        {

            return db.Categories.Find(id);
        }
        public static void Create(Category category)
        {
            db.Categories.Add(category);
            db.SaveChanges();
        }
        public static void Update(Category category)
        {
            var cate = db.Categories.Find(category.Id);      
            cate.Name = category.Name;
            cate.NameVN = category.NameVN;
            db.SaveChanges();
        }
        public static void Delete(int id)
        {
            Category category = db.Categories.Find(id);
            db.Categories.Remove(category);
            db.SaveChanges();
        }

    }
}