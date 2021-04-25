using edbuddy.api.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace edbuddy.api.Helpers
{
    public class JwtHelper
    {
        private readonly IConfiguration _config;
        public JwtHelper(IConfiguration config)
        {
            _config = config;
        }
        internal string GenerateJWTToken(IEnumerable<Claim> claims)
        {
            var jwtConfig = _config.GetSection("Jwt");
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtConfig["SecretKey"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var jwt = new JwtSecurityToken(
                issuer: jwtConfig["Issuer"],
                audience: jwtConfig["Audience"],
                claims: claims, 
                notBefore: DateTime.UtcNow,
                expires: DateTime.UtcNow.AddMinutes(5),
                signingCredentials: credentials
            );    

            return new JwtSecurityTokenHandler().WriteToken(jwt); //the method is called WriteToken but returns a string
        }
        public string GenerateJWTToken(string key1, string key2, params string[] keys)
        {
            var jwtConfig = _config.GetSection("Jwt");
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtConfig["SecretKey"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var claims = new[]
            {
            new Claim(JwtRegisteredClaimNames.Sub, key1),
            new Claim("role",key2),
            new Claim("gentime",DateTime.Now.Ticks.ToString()),

            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            };
            for (int i = 0; i < keys.Length; i++)
            {
                if (!string.IsNullOrEmpty(keys[i]))
                    claims.Append(new Claim(string.Format("AdditionalKey{0}", i.ToString()), keys[i].ToString()));
            }
            var token = new JwtSecurityToken(
            issuer: jwtConfig["Issuer"],
            audience: jwtConfig["Audience"],
            claims: claims,
            expires: DateTime.Now.AddMinutes(30),
            signingCredentials: credentials
            );
            return new JwtSecurityTokenHandler().WriteToken(token);
        }
        internal string GenerateRefreshToken()
        {
            var randomNumber = new byte[32];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(randomNumber);
                return Convert.ToBase64String(randomNumber);
            }
        }
        internal ClaimsPrincipal GetPrincipalFromExpiredToken(string token)
        {
            var jwtConfig = _config.GetSection("Jwt");
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtConfig["SecretKey"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var tokenValidationParameters = new TokenValidationParameters
            {
                ValidateAudience = true, //you might want to validate the audience and issuer depending on your use case
                ValidateIssuer = true,
                  ValidIssuer = jwtConfig["Issuer"],
                ValidAudience = jwtConfig["Audience"],
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtConfig["SecretKey"])),
                ValidateLifetime = true //here we are saying that we don't care about the token's expiration date
            };

            var tokenHandler = new JwtSecurityTokenHandler();
            SecurityToken securityToken;
            var principal = tokenHandler.ValidateToken(token, tokenValidationParameters, out securityToken);
            var jwtSecurityToken = securityToken as JwtSecurityToken;
            if (jwtSecurityToken == null || !jwtSecurityToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256, StringComparison.InvariantCultureIgnoreCase))
                throw new SecurityTokenException("Invalid token");

            return principal;
        }
        internal void DeleteRefreshToken(string username,string token){

        }
        internal void SaveRefreshToken(string username,string token){

        }
    }
}
