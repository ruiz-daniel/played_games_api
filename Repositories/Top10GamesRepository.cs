using DRG_Api.Models;
using DRG_Api.Contexts;

using System.Threading.Tasks;
using System.Linq;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DRG_Api.Repositories
{
    public class Top10GamesRepository : GenericRepository<Top10Game>, ITop10GamesRepository
    {
        public Top10GamesRepository(PlayedGamesContext context) : base(context)
        {

        }

        new public async Task<List<Top10Game>> FindAll()
        {
            var playedgames = await _context.top10games.OrderBy(game => game.pos).ToListAsync();
            foreach (Top10Game game in playedgames)
            {
                game.game = await _context.playedgame.FindAsync(game.gameid);
                game.game.status = await _context.status.FindAsync(game.game.statusid);
                game.game.platform = await _context.platform.FindAsync(game.game.platformid);
            }
            return playedgames;
        }
    }
}