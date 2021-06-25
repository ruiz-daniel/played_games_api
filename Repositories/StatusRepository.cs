using DRG_Api.Models;
using DRG_Api.Contexts;

namespace DRG_Api.Repositories
{
    public class StatusRepository : GenericRepository<Status>, IStatusRepository
    {
        public StatusRepository(PlayedGamesContext context) : base(context)
        {

        }
    }
}