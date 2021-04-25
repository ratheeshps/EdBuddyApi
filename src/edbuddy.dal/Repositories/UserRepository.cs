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
    public class UserRepository : BaseRepository, IUserRepository

    {
        private readonly ICommandText _commandText;
        public UserRepository(IConfiguration configuration, ICommandText commandText) : base(configuration)
        {
            _commandText = commandText;
        }

        public async Task<ApiResponse<IEnumerable<LoginResponse>>> AuthenitcateUser(UserLogin login)
        {
            ApiResponse<IEnumerable<LoginResponse>> dbResponse = new ApiResponse<IEnumerable<LoginResponse>>();
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("Username", login.Username);
            parameters.Add("Password", login.Password);
            parameters.Add("IpAddress", login.IpAddress);
            //   parameters.Add("DeviceId", login.DeviceId);
            parameters.Add("Status", dbType: DbType.Int32, direction: ParameterDirection.Output);
            parameters.Add("Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 4000);
            await WithConnection(async conn =>
               {
                   var query = await conn.QueryAsync<LoginResponse>(_commandText.AuthenticateUser, parameters, commandType: CommandType.StoredProcedure);

                   dbResponse.Code = parameters.Get<int>("Status");
                   dbResponse.Message = parameters.Get<string>("Message");
                   dbResponse.Data = query.ToList();


               });
            return await Task.FromResult<ApiResponse<IEnumerable<LoginResponse>>>(dbResponse);
        }

        public async Task<ApiResponse<LoginResponse>> GetUserData(string userName)
        {
            ApiResponse<LoginResponse> dbResponse = new ApiResponse<LoginResponse>();
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("username", userName);
            //   parameters.Add("DeviceId", login.DeviceId);
            parameters.Add("Status", dbType: DbType.Int32, direction: ParameterDirection.Output);
            parameters.Add("Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 4000);
            await WithConnection(async conn =>
               {
                   var query = await conn.QueryAsync<LoginResponse>(_commandText.GetUserData, parameters, commandType: CommandType.StoredProcedure);

                   dbResponse.Code = parameters.Get<int>("Status");
                   dbResponse.Message = parameters.Get<string>("Message");
                   dbResponse.Data = query.FirstOrDefault();


               });
            return await Task.FromResult<ApiResponse<LoginResponse>>(dbResponse);
        }
    }
}