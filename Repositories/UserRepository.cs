using System.Security.Cryptography;
using DRG_Api.Models;
using DRG_Api.Contexts;

using System.Threading.Tasks;
using System;
using System.Linq;
using System.Linq.Expressions;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DRG_Api.Repositories
{
    public class UserRepository : GenericRepository<User>, IUserRepository
    {
        public UserRepository(PlayedGamesContext context) : base(context)
        {
            
        }
        public async Task<User> login(string username, string password) {
                var user = await _context.user.Where(user => user.username == username && user.password  == password).FirstAsync();
                return user;
            }
    }
}