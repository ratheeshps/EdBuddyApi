using System;
using System.Collections.Generic;
using System.Text;

namespace edbuddy.common.entities
{
    public class UserLogin
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string IpAddress { get; set; }
        public string DeviceId { get; set; }
    }
    public class LoginResponse{
        public int ParentId {get;set;}
        public string Username {get;set;}
        public string Status {get;set;}
        public string Token{get;set;}
        public string Expiry{get;set;}
    }
}
