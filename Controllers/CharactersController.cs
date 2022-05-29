using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using DRG_Api.Authentication;
using DRG_Api.Models;
using DRG_Api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DRG_Api.Controllers
{
    [Route("drgapi/[controller]")]
    [ApiController]
    public class CharactersController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        private readonly IJwtAuth jwtAuth;

        public CharactersController(IUnitOfWork unitOfWork, IJwtAuth jwtAuth)
        {
            _repositories = unitOfWork;
            this.jwtAuth = jwtAuth;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Character>>> GetCharacters()
        {
            return await _repositories.Characters.FindAll();
        }

        [HttpPost]
        public async Task<ActionResult<Character>>
        PostCharacter(Character character)
        {
            character.image =
                Path
                    .Combine("https://localhost:5001/game_images/",
                    character.image);
            await _repositories.Characters.CreateAsync(character);

            return CreatedAtAction(nameof(GetCharacters),
            new { id = character.id },
            character);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult>
        PutCharacter(int id, Character character)
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

        [HttpDelete("{id}")]
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
    }
}
