using DRG_Api.Models;

using System.Threading.Tasks;
using System;
using System.Linq.Expressions;
using System.Collections.Generic;

namespace DRG_Api.Repositories
{
    public interface IUserRepository: IGenericRepository<User>
    {
         Task<User> login(string username, string password);
    }
}