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
    public class Top10CharactersController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        public Top10CharactersController(IUnitOfWork unitOfWork)
        {
            _repositories = unitOfWork;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Top10Character>>> GetTop10Characters()
        {
            return await _repositories.Top10Characters.FindAll();
        }
        
        [HttpGet("{name}")]
        public async Task<ActionResult<IEnumerable<Top10Character>>> GetTop10CharactersBy(string name)
        {
            var top10name = await _repositories.Top10Names.FindOneBy(top10name => top10name.name.Contains(name));
            var top10 = await _repositories.Top10Characters.FindBy(character => character.top10nameid == top10name.id);

            return top10;
        }

        [HttpPost("{top10name}")]
        public async Task<ActionResult<Top10Character>> PostTop10Characters(Top10Character character, string top10name)
        {
            var top10nameObject = await _repositories.Top10Names.FindOneBy(top10 => top10.name.Contains(top10name));
            character.top10nameid = top10nameObject.id;
            await _repositories.Top10Characters.CreateAsync(character);

            return CreatedAtAction(nameof(GetTop10Characters), new { id = character.id }, character);
        }

        [HttpPut("{id}")]
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

        [HttpDelete("{id}")]
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
    }
}