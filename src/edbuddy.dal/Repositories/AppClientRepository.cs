using edbuddy.common;
using edbuddy.dal.DbQueries;
using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using edbuddy.common.entities;
using System.Data;
using System.Linq;
using System.Data.SqlClient;

namespace edbuddy.dal.Repositories
{
    public class AppClientRepository : BaseRepository, IAppClientRepository

    {
        private readonly ICommandText _commandText;
        private readonly IConfiguration _configuration;
        public AppClientRepository(ICommandText commandText, IConfiguration configuration) : base(configuration)
        {
            _commandText = commandText;
            _configuration = configuration;
        }
   
        /*
        * AuthenitcateClient
        * Important 
        ! Depreciated
        @param clientauth
        TODO: Hello
        ? Question

        */
        public async Task<ApiResponse<IEnumerable<ClientAuthResponse>>> AuthenitcateClient(ClientAuth clientAuth)
        {
            ApiResponse<IEnumerable<ClientAuthResponse>> dbResponse = new ApiResponse<IEnumerable<ClientAuthResponse>>();
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("ClientKey", clientAuth.ClientKey);
            parameters.Add("ClientSecret", clientAuth.ClientSecret);
            parameters.Add("Status", dbType: DbType.Int32, direction: ParameterDirection.Output);
            parameters.Add("Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 4000);
            await WithConnection(async conn =>
               {
                   var query = await conn.QueryAsync<ClientAuthResponse>(_commandText.GetAppClientAuth, parameters, commandType: CommandType.StoredProcedure);

                   dbResponse.Code = parameters.Get<int>("Status");
                   dbResponse.Message = parameters.Get<string>("Message");
                   dbResponse.Data = query.ToList();


               });
            return await Task.FromResult<ApiResponse<IEnumerable<ClientAuthResponse>>>(dbResponse);
        }
    }
}
