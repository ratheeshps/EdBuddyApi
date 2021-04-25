using edbuddy.common;
using edbuddy.common.entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace edbuddy.dal.Repositories
{
   public interface IAppClientRepository
    {
       Task<ApiResponse<IEnumerable<ClientAuthResponse>>> AuthenitcateClient(ClientAuth clientAuth);
    }
}
