
using DRG_Api.Models;
using DRG_Api.Contexts;
namespace DRG_Api.Repositories
{
    public class PlatformRepository : GenericRepository<Platform>, IPlatformRepository
    {
        public PlatformRepository(PlayedGamesContext context) : base(context)
        {

        }
    }
}