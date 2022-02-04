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
    public class CharactersController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        public CharactersController(IUnitOfWork unitOfWork)
        {
            _repositories = unitOfWork;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Character>>> GetCharacters()
        {
            return await _repositories.Characters.FindAll();
        }

        [HttpPost]
        public async Task<ActionResult<Character>> PostCharacter(Character character)
        {
            
            character.image = Path.Combine("https://localhost:5001/game_images/", character.image);
            await _repositories.Characters.CreateAsync(character);

            return CreatedAtAction(nameof(GetCharacters), new { id = character.id }, character);
        }

        [HttpPut("{id}")]
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