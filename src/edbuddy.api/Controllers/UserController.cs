using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using edbuddy.api.Helpers;
using edbuddy.api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace edbuddy.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private List<User> appUsers = new List<User>
            {
            new User { UserName = "admin", Password = "1234", UserRole = "Anoni" },
            new User {  UserName = "user", Password = "1234", UserRole = "User" }
            };
        private readonly IConfiguration _config;
        public UserController(IConfiguration config)
        {
            _config = config;
        }
        [HttpGet]
        [Route("GetUserData")]
        [Authorize(Policy = Policies.User)]
        public IActionResult GetUserData()
        {
            return Ok("This is a response from user method");
        }
        [HttpGet]
        [Route("GetClientData")]
        [Authorize(Policy = Policies.Client)]
        public IActionResult GetClientData()
        {
            return Ok("This is a response from client method");
        }

        [HttpPost]
        [Authorize(Policy = Policies.Client)]
        public IActionResult Login([FromBody] User login)
        {
            IActionResult response = Unauthorized();
            User user = AuthenticateUser(login);
            if (user != null)
            {
                JwtHelper jwtHealper = new JwtHelper(_config);
                var tokenString = jwtHealper.GenerateJWTToken(user.UserName, Policies.User);
                response = Ok(new
                {
                   userToken = tokenString,
                   userID=1,
                   fullName="Aadya Nair",
                   profileImage="",
                   UserRole="User"
                });
            }
            return response;
        }
        User AuthenticateUser(User loginCredentials)
        {
            User user = appUsers.SingleOrDefault(x => x.UserName == loginCredentials.UserName && x.Password == loginCredentials.Password);
            return user;
        }
    }
}
