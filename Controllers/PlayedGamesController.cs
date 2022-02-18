using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DRG_Api.Models;
using DRG_Api.Services;
using System.IO;

namespace DRG_Api.Controllers
{
    [Route("drgapi/[controller]")]
    [ApiController]
    public class PlayedGamesController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        public PlayedGamesController(IUnitOfWork unitOfWork)
        {
            _repositories = unitOfWork;
        }

        // GET: api/PlayedGames
        [HttpGet]

        public async Task<ActionResult<IEnumerable<PlayedGame>>> GetPlayedGames()
        {
            return await _repositories.PlayedGames.FindAll();
        }

        // GET: api/PlayedGames/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PlayedGame>> GetPlayedGame(string id)
        {
            var playedGame = await _repositories.PlayedGames.Find(id);

            if (playedGame == null)
            {
                return NotFound();
            }

            return playedGame;
        }

        [HttpGet("name/{name}")]
        public async Task<ActionResult<IEnumerable<PlayedGame>>> GetGamesFromName(string name)
        {
            var playedgames = await _repositories.PlayedGames.FindBy(game => game.name.Contains(name));
            return playedgames;
        }

        [HttpGet("status/{status}")]
        public async Task<ActionResult<IEnumerable<PlayedGame>>> GetGamesFromStatus(int status)
        {
            var playedgames = await _repositories.PlayedGames.FindBy(game => game.statusid == status);
            return playedgames;
        }

        // PUT: api/PlayedGames/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPlayedGame(string id, PlayedGame playedGame)
        {
            if (id != playedGame.id)
            {
                return BadRequest();
            }

            try
            {
                await _repositories.PlayedGames.UpdateAsync(playedGame);
            }
            catch
            {
                return NotFound();
            }


            return NoContent();
        }

        // POST: api/PlayedGames
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<PlayedGame>> PostPlayedGame(PlayedGame playedGame)
        {
            playedGame.id = System.Guid.NewGuid().ToString();
            playedGame.image = Path.Combine("https://localhost:5001/game_images/", playedGame.image);
            await _repositories.PlayedGames.CreateAsync(playedGame);

            return CreatedAtAction(nameof(GetPlayedGame), new { id = playedGame.id }, playedGame);
        }

        // DELETE: api/PlayedGames/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePlayedGame(string id)
        {
            var playedGame = await _repositories.PlayedGames.Find(id);
            if (playedGame == null)
            {
                return NotFound();
            }

            await _repositories.PlayedGames.DeleteAsync(playedGame);

            return NoContent();
        }

        //GET: api/PlayedGames/platforms
        [HttpGet("platforms")]
        public async Task<ActionResult<IEnumerable<Platform>>> GetPlatforms()
        {
            return await _repositories.Platforms.FindAll();
        }

        //GET: api/PlayedGames/statuses
        [HttpGet("statuses")]
        public async Task<ActionResult<IEnumerable<Status>>> GetStatuses()
        {
            return await _repositories.Statuses.FindAll();
        }

        

        
    }
}
