using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace edbuddy.api.Models
{
    public class    User
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string UserRole { get; set; }
        public string IpAddress { get; set; }
        public string DeviceID { get; set; }
    }
}
