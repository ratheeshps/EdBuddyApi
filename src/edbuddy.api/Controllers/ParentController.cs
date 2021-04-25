using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using edbuddy.api.Helpers;
using edbuddy.api.Models;
using edbuddy.common.entities;
using edbuddy.dal.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace edbuddy.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ParentController : ControllerBase
    {

        private readonly IConfiguration _config;
        private readonly IHttpContextAccessor _http;
        private readonly IUserRepository _userRepository;
        private JwtHelper jwtHelper;

        public ParentController(IConfiguration config, IHttpContextAccessor http, IUserRepository userRepository)
        {
            _config = config;
            _http = http;
            _userRepository = userRepository;
            jwtHelper = new JwtHelper(_config);
        }
        [Authorize(Policy = Policies.User)]
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            IActionResult response = Unauthorized();
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var user = await _userRepository.GetUserData(identity.FindFirst(ClaimTypes.NameIdentifier).Value);
            if (user.Code == 1)
            {
                if(user.Data!=null)
                    response = Ok(new { user = user.Data });
            }
            return response;
        }
        [HttpPost("Login")]
        [Authorize(Policy = Policies.Client)]
        public async Task<IActionResult> Post([FromBody] UserLogin login)
        {
            IActionResult response = Unauthorized();
            var user = await _userRepository.AuthenitcateUser(login);
            if (user.Code == 1)
            {
                if (user.Data != null)
                {
                    JwtHelper jwtHelper = new JwtHelper(_config);
                    var claims = new[]
                    {
                        new Claim(JwtRegisteredClaimNames.Sub, login.Username),
                        new Claim("role", Policies.User),
                        new Claim("username", login.Username),
                        new Claim("gentime",DateTime.Now.Ticks.ToString()),
                        new Claim("source",login.IpAddress),
                        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                    };

                    var tokenString = jwtHelper.GenerateJWTToken(claims);
                    response = Ok(new
                    {
                        Code=user.Code,
                        Message=user.Message,
                        Data = user.Data,
                        Token=tokenString
                    });
                }

            }
            return response;
       }
        [HttpPost("refresh")]
        public IActionResult Refresh(string token, string refreshToken)
        {
            var principal = jwtHelper.GetPrincipalFromExpiredToken(token);
            var username = principal.Identity.Name;
            var savedRefreshToken = jwtHelper.GenerateRefreshToken(); //retrieve the refresh token from a data store
            if (savedRefreshToken != refreshToken)
                throw new SecurityTokenException("Invalid refresh token");

            var newJwtToken = jwtHelper.GenerateJWTToken(principal.Claims);
            var newRefreshToken = jwtHelper.GenerateRefreshToken();

            jwtHelper.DeleteRefreshToken(username, refreshToken);
            jwtHelper.SaveRefreshToken(username, newRefreshToken);

            return new ObjectResult(new
            {
                token = newJwtToken,
                refreshToken = newRefreshToken
            });
        }
        

    }
}
