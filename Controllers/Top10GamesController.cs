using System.Collections.Generic;
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
    public class Top10GamesController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        public Top10GamesController(IUnitOfWork unitOfWork)
        {
            _repositories = unitOfWork;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Top10Game>>> GetTop10Games()
        {
            return await _repositories.Top10Games.FindAll();
        }

        [HttpGet("user")]
        public async Task<ActionResult<IEnumerable<Top10Game>>>
        GetTop10Games(string userid)
        {
            return await _repositories
                .Top10Games
                .FindBy(game => game.userid == userid);
        }

        [HttpGet("user/{userid}/{name}")]
        public async Task<ActionResult<IEnumerable<Top10Game>>>
        GetTop10GamesBy(string name, string userid)
        {
            var top10name =
                await _repositories
                    .Top10Names
                    .FindOneBy(top10name =>
                        top10name.name.Contains(name) &&
                        top10name.userid == userid);
            var top10 =
                await _repositories
                    .Top10Games
                    .FindBy(game =>
                        game.top10nameid == top10name.id &&
                        game.userid == userid);

            return top10;
        }

        [HttpPost("{top10name}")]
        public async Task<ActionResult<Top10Game>>
        PostTop10Game(Top10Game game, string top10name)
        {
            var top10nameObject =
                await _repositories
                    .Top10Names
                    .FindOneBy(top10 => top10.name.Contains(top10name));
            game.top10nameid = top10nameObject.id;
            await _repositories.Top10Games.CreateAsync(game);

            return CreatedAtAction(nameof(GetTop10Games),
            new { id = game.id },
            game);
        }

        [HttpPut("{id}")]
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

        [HttpDelete("{id}")]
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
    }
}
