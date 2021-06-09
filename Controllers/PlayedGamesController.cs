using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DRG_Api.Models;
using DRG_Api.Contexts;
using System.Net.Http;
using System.Text.Json;
using Microsoft.AspNetCore.Hosting;
using System.IO;
using Microsoft.AspNetCore.Cors;

namespace DRG_Api.Controllers
{
    [Route("api/PlayedGames")]
    [ApiController]
    public class PlayedGamesController : ControllerBase
    {
        private readonly PlayedGamesContext _context;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public PlayedGamesController(PlayedGamesContext context, IHttpClientFactory httpClientFactory, IWebHostEnvironment environment)
        {
            _context = context;
            _httpClientFactory = httpClientFactory;
            _webHostEnvironment = environment;
        }

        // GET: api/PlayedGames
        [HttpGet]

        public async Task<ActionResult<IEnumerable<PlayedGame>>> GetplayedGames()
        {
            var playedgames = await _context.playedgame.ToListAsync();
            foreach (PlayedGame game in playedgames)
            {
                game.platform = await _context.platform.FindAsync(game.platformid);
                game.status = await _context.status.FindAsync(game.statusid);
            }
            return playedgames;


        }

        [HttpGet("api")]
        public async Task<ActionResult<List<APIGame>>> GetFromAPI()
        {
            var client = _httpClientFactory.CreateClient("games");
            var request = new HttpRequestMessage(HttpMethod.Get, "game");
            var response = await client.SendAsync(request);

            if (response.IsSuccessStatusCode)
            {
                using var responseStream = await response.Content.ReadAsStreamAsync();
                return await JsonSerializer.DeserializeAsync<List<APIGame>>(responseStream);
            }
            else
            {
                return new List<APIGame>();
            }
        }

        // GET: api/PlayedGames/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PlayedGame>> GetPlayedGame(string id)
        {
            var playedGame = await _context.playedgame.FindAsync(id);

            if (playedGame == null)
            {
                return NotFound();
            }

            return playedGame;
        }

        [HttpGet("name/{name}")]
        public async Task<ActionResult<IEnumerable<PlayedGame>>> GetGamesFromName(string name)
        {
            var playedgames = await _context.playedgame.Where(game => game.name.Contains(name)).ToListAsync();
            foreach (PlayedGame game in playedgames)
            {
                game.platform = await _context.platform.FindAsync(game.platformid);
                game.status = await _context.status.FindAsync(game.statusid);
            }
            return playedgames;
        }

        //GET: api/PlayedGames/publisher/pub
        [HttpGet("publisher/{publisher}")]
        public async Task<ActionResult<IEnumerable<PlayedGame>>> GetGamesFromPublisher(string publisher)
        {
            var playedgames = await _context.playedgame.Where(game => game.publisher.Contains(publisher)).ToListAsync();
            foreach (PlayedGame game in playedgames)
            {
                game.platform = await _context.platform.FindAsync(game.platformid);
                game.status = await _context.status.FindAsync(game.statusid);
            }
            return playedgames;
        }

        //GET: api/PlayedGames/developer/dev
        [HttpGet("developer/{dev}")]
        public async Task<ActionResult<IEnumerable<PlayedGame>>> GetGamesFromDeveloper(string dev)
        {
            var playedgames = await _context.playedgame.Where(game => game.developer.Contains(dev)).ToListAsync();
            foreach (PlayedGame game in playedgames)
            {
                game.platform = await _context.platform.FindAsync(game.platformid);
                game.status = await _context.status.FindAsync(game.statusid);
            }
            return playedgames;
        }

        //GET: api/PlayedGames/genre/genre
        [HttpGet("genre/{genre}")]
        public async Task<ActionResult<IEnumerable<PlayedGame>>> GetGamesFromGenre(string genre)
        {
            var playedgames = await _context.playedgame.Where(game => game.genre.Contains(genre)).ToListAsync();
            foreach (PlayedGame game in playedgames)
            {
                game.platform = await _context.platform.FindAsync(game.platformid);
                game.status = await _context.status.FindAsync(game.statusid);
            }
            return playedgames;
        }

        [HttpGet("year/{year}")]
        public async Task<ActionResult<IEnumerable<PlayedGame>>> GetGamesFromYear(string year)
        {
            var playedgames = await _context.playedgame.Where(game => game.year.Equals(year)).ToListAsync();
            foreach (PlayedGame game in playedgames)
            {
                game.platform = await _context.platform.FindAsync(game.platformid);
                game.status = await _context.status.FindAsync(game.statusid);
            }
            return playedgames;
        }

        [HttpGet("rating/{rating}")]
        public async Task<ActionResult<IEnumerable<PlayedGame>>> GetGamesFromRating(int rating)
        {
            var playedgames = await _context.playedgame.Where(game => game.rating == rating).ToListAsync();
            foreach (PlayedGame game in playedgames)
            {
                game.platform = await _context.platform.FindAsync(game.platformid);
                game.status = await _context.status.FindAsync(game.statusid);
            }
            return playedgames;
        }

        [HttpGet("status/{status}")]
        public async Task<ActionResult<IEnumerable<PlayedGame>>> GetGamesFromStatus(int status)
        {
            var playedgames = await _context.playedgame.Where(game => game.statusid == status).ToListAsync();
            foreach (PlayedGame game in playedgames)
            {
                game.platform = await _context.platform.FindAsync(game.platformid);
                game.status = await _context.status.FindAsync(game.statusid);
            }
            return playedgames;
        }

        [HttpGet("platform/{platform}")]
        public async Task<ActionResult<IEnumerable<PlayedGame>>> GetGamesFromPlatform(int platform)
        {
            var playedgames = await _context.playedgame.Where(game => game.platformid == platform).ToListAsync();
            foreach (PlayedGame game in playedgames)
            {
                game.platform = await _context.platform.FindAsync(game.platformid);
                game.status = await _context.status.FindAsync(game.statusid);
            }
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

            _context.Entry(playedGame).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PlayedGameExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/PlayedGames
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<PlayedGame>> PostPlayedGame(PlayedGame playedGame)
        {
            playedGame.id = System.Guid.NewGuid().ToString();
            _context.playedgame.Add(playedGame);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetPlayedGame), new { id = playedGame.id }, playedGame);
        }

        // DELETE: api/PlayedGames/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePlayedGame(string id)
        {
            var playedGame = await _context.playedgame.FindAsync(id);
            if (playedGame == null)
            {
                return NotFound();
            }

            _context.playedgame.Remove(playedGame);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PlayedGameExists(string id)
        {
            return _context.playedgame.Any(e => e.id == id);
        }

        //GET: api/PlayedGames/platforms
        [HttpGet("platforms")]
        public async Task<ActionResult<IEnumerable<Platform>>> GetPlatforms()
        {
            return await _context.platform.ToListAsync();
        }

        //GET: api/PlayedGames/statuses
        [HttpGet("statuses")]
        public async Task<ActionResult<IEnumerable<Status>>> GetStatuses()
        {
            return await _context.status.ToListAsync();
        }

        [HttpPost("gameImage")]
        public string UploadFile(IFormFile image)
        {
            string uniqueFileName = null;

            if (image != null)
            {
                Console.WriteLine("FILE: " + image.FileName);
                Console.WriteLine("FOLDER: " + _webHostEnvironment.WebRootPath);

                string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "game_images");
                Console.WriteLine("ROOT: " + uploadsFolder);
                uniqueFileName = image.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    image.CopyTo(fileStream);
                }
            }
            return uniqueFileName;
        }
    }
}
