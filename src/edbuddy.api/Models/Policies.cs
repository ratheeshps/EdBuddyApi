using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace edbuddy.api.Models
{
    public class Policies
    {
        public const string Client = "Client";
        public const string User = "User";
    public static AuthorizationPolicy ClientPolicy()
        {
            return new AuthorizationPolicyBuilder().RequireAuthenticatedUser().RequireRole(Client).Build();
        }
        public static AuthorizationPolicy UserPolicy()
        {
            return new AuthorizationPolicyBuilder().RequireAuthenticatedUser().RequireRole(User).Build();
        }
    }
}
