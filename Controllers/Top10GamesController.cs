using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DRG_Api.Models;
using DRG_Api.Services;

namespace DRG_Api.Controllers
{
    [Route("api/PlayedGames")]
    [ApiController]
    public class Top10GamesController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        public Top10GamesController(IUnitOfWork unitOfWork)
        {
            _repositories = unitOfWork;
        }

        [HttpGet("top10games")]
        public async Task<ActionResult<IEnumerable<Top10Game>>> GetTop10Games()
        {
            return await _repositories.Top10Games.FindAll();
        }
        
        [HttpGet("top10games/{name}")]
        public async Task<ActionResult<IEnumerable<Top10Game>>> GetTop10GamesBy(string name)
        {
            var top10name = await _repositories.Top10Names.FindOneBy(top10name => top10name.name.Contains(name));
            var top10 = await _repositories.Top10Games.FindBy(game => game.top10nameid == top10name.id);

            return top10;
        }

        [HttpPost("top10games/{top10name}")]
        public async Task<ActionResult<Top10Game>> PostTop10Game(Top10Game game, string top10name)
        {
            var top10nameObject = await _repositories.Top10Names.FindOneBy(top10 => top10.name.Contains(top10name));
            game.top10nameid = top10nameObject.id;
            await _repositories.Top10Games.CreateAsync(game);

            return CreatedAtAction(nameof(GetTop10Games), new { id = game.id }, game);
        }

        [HttpPut("top10games/{id}")]
        public async Task<IActionResult> PutTop10Game(int id, Top10Game game)
        {
            if (id != game.id)
            {
                return BadRequest();
            }

            try
            {
                await _repositories.Top10Games.UpdateAsync(game);
            }
            catch
            {
                return NotFound();
            }


            return NoContent();
        }

        [HttpDelete("top10games/{id}")]
        public async Task<IActionResult> DeleteTop10Game(int id)
        {
            var game = await _repositories.Top10Games.Find(id);
            if (game == null)
            {
                return NotFound();
            }

            await _repositories.Top10Games.DeleteAsync(game);

            return NoContent();
        }

        [HttpGet("top10names")]
        public async Task<ActionResult<IEnumerable<Top10Name>>> GetTop10Names()
        {
            return await _repositories.Top10Names.FindAll();
        }
        [HttpPost("top10names")]
        public async Task<ActionResult<Top10Name>> PostTop10Name(Top10Name top10)
        {
            await _repositories.Top10Names.CreateAsync(top10);

            return CreatedAtAction(nameof(GetTop10Names), new { id = top10.id }, top10);
        }
        [HttpPut("top10names/{id}")]
        public async Task<IActionResult> PutTop10Name(int id, Top10Name name)
        {
            if (id != name.id)
            {
                return BadRequest();
            }

            try
            {
                await _repositories.Top10Names.UpdateAsync(name);
            }
            catch
            {
                return NotFound();
            }


            return NoContent();
        }
        [HttpDelete("top10names/{id}")]
        public async Task<IActionResult> DeleteTop10Name(int id)
        {
            var name = await _repositories.Top10Names.Find(id);
            if (name == null)
            {
                return NotFound();
            }

            await _repositories.Top10Names.DeleteAsync(name);

            return NoContent();
        }
    }
}