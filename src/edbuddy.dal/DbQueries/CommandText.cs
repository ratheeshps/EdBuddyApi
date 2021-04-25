using System;
using System.Collections.Generic;
using System.Text;

namespace edbuddy.dal.DbQueries
{
    public class CommandText : ICommandText
    {
        public string GetAppClientAuth => "GetClientAuth";
        public string AuthenticateUser => "AuthenticateUser";

        public string GetUserData => "GetUserData";
    }
}
