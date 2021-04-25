using System;
using System.Collections.Generic;
using System.Text;

namespace edbuddy.dal.DbQueries
{
    public interface ICommandText
    {
        string GetAppClientAuth { get; }
        string AuthenticateUser { get; }
        string GetUserData { get; }
    }
}
