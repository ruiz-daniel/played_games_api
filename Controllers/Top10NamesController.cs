using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DRG_Api.Models;
using DRG_Api.Services;

namespace DRG_Api.Controllers
{
    [Route("drgapi/[controller]")]
    [ApiController]
    public class Top10NamesController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        public Top10NamesController(IUnitOfWork unitOfWork)
        {
            _repositories = unitOfWork;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Top10Name>>> GetTop10Names()
        {
            return await _repositories.Top10Names.FindAll();
        }
        [HttpPost]
        public async Task<ActionResult<Top10Name>> PostTop10Name(Top10Name top10)
        {
            await _repositories.Top10Names.CreateAsync(top10);

            return CreatedAtAction(nameof(GetTop10Names), new { id = top10.id }, top10);
        }
        [HttpPut("{id}")]
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
        [HttpDelete("{id}")]
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