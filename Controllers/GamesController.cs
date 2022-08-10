using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using DRG_Api.Models;
using DRG_Api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DRG_Api.Controllers
{
    [Authorize]
    [Route("drgapi/[controller]")]
    [ApiController]
    public class GamesController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        public GamesController(IUnitOfWork unitOfWork)
        {
            _repositories = unitOfWork;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Game>>> GetGames()
        {
            return await _repositories.Games.FindAll();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutGame(string id, Game game)
        {
            if (id != game.id)
            {
                return BadRequest();
            }

            try
            {
                await _repositories.Games.UpdateAsync(game);
            }
            catch
            {
                return NotFound();
            }

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult<Game>> PostGame(Game game)
        {
            game.id = System.Guid.NewGuid().ToString();
            game.image = Path.Combine("https://localhost:5001/game_images/general", game.image);
            await _repositories.Games.CreateAsync(game);

            return CreatedAtAction(nameof(GetGame), new { id = game.id }, game);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteGame(string id)
        {
            var game = await _repositories.Games.Find(id);
            if (game == null)
            {
                return NotFound();
            }

            await _repositories.Games.DeleteAsync(game);

            return NoContent();
        }
    }
}
