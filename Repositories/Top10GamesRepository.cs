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
    public class Top10GamesRepository : GenericRepository<Top10Game>
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
                game.top10name = await _context.top10name.FindAsync(game.top10nameid);
            }
            return playedgames;
        }

        new public async Task<List<Top10Game>> FindBy(Expression<Func<Top10Game, bool>> expression)
        {
            var top10 = await _context.top10games.OrderBy(game => game.pos).Where(expression).ToListAsync();
            foreach (Top10Game game in top10)
            {
                game.game = await _context.playedgame.FindAsync(game.gameid);
                game.game.status = await _context.status.FindAsync(game.game.statusid);
                game.game.platform = await _context.platform.FindAsync(game.game.platformid);
                game.top10name = await _context.top10name.FindAsync(game.top10nameid);
            }
            return top10;

        }
    }
}