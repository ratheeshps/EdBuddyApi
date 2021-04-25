using System;
using System.Collections.Generic;
using System.Text;

namespace edbuddy.common.entities
{
    public class ClientAuth
    {
        public string ClientKey { get; set; }
        public string ClientSecret { get; set; }
        public string DeviceMacAddress { get; set; }
    }
    public class ClientAuthResponse{
        public int AppID {get;set;}
        public string AppName {get;set;}
    }
}
