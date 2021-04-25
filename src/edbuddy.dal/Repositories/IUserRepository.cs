using edbuddy.common;
using edbuddy.common.entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace edbuddy.dal.Repositories
{
   public interface IUserRepository
    {
       Task<ApiResponse<IEnumerable<LoginResponse>>> AuthenitcateUser(UserLogin login);
       Task<ApiResponse<LoginResponse>> GetUserData(string userName);
    }
}
