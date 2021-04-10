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

namespace LaptopEshop.Controllers
{
    public class CartAPIController : ApiController
    {


        // GET: api/CartAPI
        [Authorize]
        public string Create(int productId)
        {
            
            CartService.add(User.Identity.GetUserId(), productId);
            return "";
        }

        // GET: api/CartAPI/5
        /*public string Get(int id)
        {
            return "value";
        }*/

        // POST: api/CartAPI
       /* public void Post([FromBody]string value)
        {

        }*/

        // PUT: api/CartAPI/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/CartAPI/5
        public void Delete(int id)
        {
        }
    }
}
