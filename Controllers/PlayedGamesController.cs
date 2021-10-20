using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DRG_Api.Models;
using DRG_Api.Services;
using Microsoft.AspNetCore.Hosting;
using System.IO;

namespace DRG_Api.Controllers
{
    [Route("api/PlayedGames")]
    [ApiController]
    public class PlayedGamesController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;
        // private readonly IHttpClientFactory _httpClientFactory;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public PlayedGamesController(IUnitOfWork unitOfWork, IWebHostEnvironment environment)
        {
            _repositories = unitOfWork;
            _webHostEnvironment = environment;
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

        [HttpGet("characters")]
        public async Task<ActionResult<IEnumerable<Character>>> GetCharacters()
        {
            return await _repositories.Characters.FindAll();
        }

        [HttpPost("characters")]
        public async Task<ActionResult<Character>> PostCharacter(Character character)
        {
            
            character.image = Path.Combine("https://localhost:5001/game_images/", character.image);
            await _repositories.Characters.CreateAsync(character);

            return CreatedAtAction(nameof(GetCharacters), new { id = character.id }, character);
        }

        [HttpPut("characters/{id}")]
        public async Task<IActionResult> PutCharacter(int id, Character character)
        {
            if (id != character.id)
            {
                return BadRequest();
            }

            try
            {
                await _repositories.Characters.UpdateAsync(character);
            }
            catch
            {
                return NotFound();
            }


            return NoContent();
        }

        [HttpDelete("characters/{id}")]
        public async Task<IActionResult> DeleteCharacter(int id)
        {
            var character = await _repositories.Characters.Find(id);
            if (character == null)
            {
                return NotFound();
            }

            await _repositories.Characters.DeleteAsync(character);

            return NoContent();
        }


        [HttpGet("top10characters")]
        public async Task<ActionResult<IEnumerable<Top10Character>>> GetTop10Characters()
        {
            return await _repositories.Top10Characters.FindAll();
        }
        
        [HttpGet("top10characters/{name}")]
        public async Task<ActionResult<IEnumerable<Top10Character>>> GetTop10CharactersBy(string name)
        {
            var top10name = await _repositories.Top10Names.FindOneBy(top10name => top10name.name.Contains(name));
            var top10 = await _repositories.Top10Characters.FindBy(character => character.top10nameid == top10name.id);

            return top10;
        }

        [HttpPost("top10characters/{top10name}")]
        public async Task<ActionResult<Top10Character>> PostTop10Characters(Top10Character character, string top10name)
        {
            var top10nameObject = await _repositories.Top10Names.FindOneBy(top10 => top10.name.Contains(top10name));
            character.top10nameid = top10nameObject.id;
            await _repositories.Top10Characters.CreateAsync(character);

            return CreatedAtAction(nameof(GetTop10Characters), new { id = character.id }, character);
        }

        [HttpPut("top10characters/{id}")]
        public async Task<IActionResult> PutTop10Characters(int id, Top10Character character)
        {
            if (id != character.id)
            {
                return BadRequest();
            }

            try
            {
                await _repositories.Top10Characters.UpdateAsync(character);
            }
            catch
            {
                return NotFound();
            }


            return NoContent();
        }

        [HttpDelete("top10characters/{id}")]
        public async Task<IActionResult> DeleteTop10Characters(int id)
        {
            var character = await _repositories.Top10Characters.Find(id);
            if (character == null)
            {
                return NotFound();
            }

            await _repositories.Top10Characters.DeleteAsync(character);

            return NoContent();
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
        // }

        // [HttpGet("fiximages")]
        // public async Task<IActionResult> fix()
        // {
        //     var playedgames = await _context.playedgame.OrderByDescending(game => game.rating).ToListAsync();
        //     foreach (PlayedGame playedGame in playedgames)
        //     {
        //         playedGame.image = Path.Combine("https://localhost:5001/game_images/", playedGame.name + ".jpg");
        //         _context.Entry(playedGame).State = EntityState.Modified;

        //         try
        //         {
        //             await _context.SaveChangesAsync();
        //         }
        //         catch (DbUpdateConcurrencyException) { }
        //     }

        //     return NoContent();

        // }
    }
}
