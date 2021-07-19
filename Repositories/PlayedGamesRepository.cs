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
    public class PlayedGamesRepository : GenericRepository<PlayedGame>, IPlayedGamesRepository
    {
        public PlayedGamesRepository(PlayedGamesContext context) : base(context)
        {

        }
        new public async Task<List<PlayedGame>> FindAll()
        {
            var playedgames = await _context.playedgame.OrderByDescending(game => game.rating).ToListAsync();
            foreach (PlayedGame game in playedgames)
            {
                game.platform = await _context.platform.FindAsync(game.platformid);
                game.status = await _context.status.FindAsync(game.statusid);
            }
            return playedgames;
        }

        new public async Task<PlayedGame> Find(string id)
        {
            var game = await _context.playedgame.FindAsync(id);
            game.platform = await _context.platform.FindAsync(game.platformid);
            game.status = await _context.status.FindAsync(game.statusid);

            return game;
        }

        new public async Task<List<PlayedGame>> FindBy(Expression<Func<PlayedGame, bool>> expression)
        {
            var playedgames = await _context.playedgame.OrderByDescending(game => game.rating).Where(expression).ToListAsync();
            foreach (PlayedGame game in playedgames)
            {
                game.platform = await _context.platform.FindAsync(game.platformid);
                game.status = await _context.status.FindAsync(game.statusid);
            }
            return playedgames;

        }
    }
}