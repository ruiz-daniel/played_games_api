using DRG_Api.Models;
using DRG_Api.Contexts;

namespace DRG_Api.Repositories
{
    public class Top10NameRepository : GenericRepository<Top10Name>
    {
        public Top10NameRepository(PlayedGamesContext context) : base(context)
        {
            
        }
    }
}