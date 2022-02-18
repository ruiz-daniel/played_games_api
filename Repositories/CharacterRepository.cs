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
    public class CharacterRepository : GenericRepository<Character>, ICharacterRepository
    {
        public CharacterRepository(PlayedGamesContext context) : base(context)
        {
            

        }
        new public async Task<Character> Find(int id) 
        {
            var character = await _context.character.FindAsync(id);
            character.game = await _context.playedgame.FindAsync(character.gameid);
            return character;
        }
    }
}