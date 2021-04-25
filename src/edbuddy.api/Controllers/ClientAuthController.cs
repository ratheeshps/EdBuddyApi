using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using edbuddy.api.Helpers;
using edbuddy.api.Models;
using edbuddy.common.entities;
using edbuddy.dal;
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
    public class ClientAuthController : ControllerBase
    {
        private readonly IConfiguration _config;
        private readonly IAppClientRepository _appClientRepository;

        public ClientAuthController(IConfiguration config,IAppClientRepository appClientRepository)
        {
            _appClientRepository = appClientRepository;
            _config = config;
        }
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> Post(ClientAuth clientAuth)
        {
            IActionResult response = Unauthorized();
                var validClient =   await _appClientRepository.AuthenitcateClient(clientAuth);
                if (validClient.Code == 1)
            {
                JwtHelper jwtHelper = new JwtHelper(_config);
                 var claims = new[]
                {
                new Claim(JwtRegisteredClaimNames.Sub, clientAuth.ClientKey),
                new Claim("role", Policies.Client),
                new Claim(ClaimTypes.Name, clientAuth.ClientKey),
                new Claim("gentime",DateTime.Now.Ticks.ToString()),
                new Claim("source",clientAuth.DeviceMacAddress),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                };
                var tokenString = jwtHelper.GenerateJWTToken(claims);
                response = Ok(new
                {
                    token = tokenString,
                    expiryTime="300"
                });
            }
            return response;
        }
        
    }
}
