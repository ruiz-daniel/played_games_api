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
    public class Top10CharactersRepository : GenericRepository<Top10Character>, ITop10CharactersRepository
    {
        public Top10CharactersRepository ( PlayedGamesContext context) : base(context)
        {
            
        }

        new public async Task<List<Top10Character>> FindAll()
        {
            var characters = await _context.top10characters.OrderBy(character => character.pos).ToListAsync();
            foreach (Top10Character character in characters)
            {
                character.character = await _context.character.FindAsync(character.characterid);
                character.top10name = await _context.top10name.FindAsync(character.top10nameid);
            }
            return characters;
        }

        new public async Task<List<Top10Character>> FindBy(Expression<Func<Top10Character, bool>> expression)
        {
            var top10 = await _context.top10characters.OrderBy(character => character.pos).Where(expression).ToListAsync();
            foreach (Top10Character character in top10)
            {
                character.character = await _context.character.FindAsync(character.characterid);
                character.top10name = await _context.top10name.FindAsync(character.top10nameid);
            }
            return top10;

        }
    }
}