using System;
using DRG_Api.Models;
using DRG_Api.Contexts;

namespace DRG_Api.Repositories
{
    public class GameRepository : GenericRepository<Game>
    {
        public GameRepository(PlayedGamesContext context) : base(context) {
            
        }
    }
}
