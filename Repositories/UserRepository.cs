using DRG_Api.Models;
using DRG_Api.Contexts;

namespace DRG_Api.Repositories
{
    public class UserRepository : GenericRepository<User>
    {
        public UserRepository(PlayedGamesContext context) : base(context)
        {
            
        }
       
    }
}