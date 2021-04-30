using LaptopEshop.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LaptopEshop.Services
{
    
    public class UserService
    {
        private static LaptopEshopDbContext db = new LaptopEshopDbContext();
        public static IEnumerable<AspNetUser> findAll(int pageNumber, int pageSize)
        {
            return db.AspNetUsers.ToList().OrderByDescending(x => x.Id).ToPagedList(pageNumber, pageSize);
        }
        public static AspNetUser findByUsername(string userName){
        
                return db.AspNetUsers.Where(s => s.UserName == userName).FirstOrDefault();
        }
      
    }
}