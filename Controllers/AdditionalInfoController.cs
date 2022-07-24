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
    public class AdditionalInfoController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        public AdditionalInfoController(IUnitOfWork unitOfWork)
        {
            _repositories = unitOfWork;
        }

        // GET: api/AdditionalInfo
        [HttpGet]
        public async Task<ActionResult<IEnumerable<AdditionalInfo>>>
        GetAdditionalInfos()
        {
            return await _repositories.AdditionalInfo.FindAll();
        }

        // GET: api/AdditionalInfo?playedgameid
        [HttpGet("{playedgameid}")]
        public async Task<ActionResult<IEnumerable<AdditionalInfo>>>
        GetAdditionalInfo(string playedgameid)
        {
            return await _repositories
                .AdditionalInfo
                .FindBy(info => info.playedgameid == playedgameid);
        }

        // PUT: api/AdditionalInfos/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult>
        PutAdditionalInfo(int id, AdditionalInfo additionalInfo)
        {
            if (id != additionalInfo.id)
            {
                return BadRequest();
            }

            try
            {
                await _repositories.AdditionalInfo.UpdateAsync(additionalInfo);
            }
            catch
            {
                return NotFound();
            }

            return NoContent();
        }

        // POST: api/AdditionalInfos
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<AdditionalInfo>>
        PostAdditionalInfo(AdditionalInfo additionalInfo)
        {
            await _repositories.AdditionalInfo.CreateAsync(additionalInfo);

            return CreatedAtAction(nameof(GetAdditionalInfo),
            new { id = additionalInfo.id },
            additionalInfo);
        }

        // DELETE: api/AdditionalInfos/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAdditionalInfo(int id)
        {
            var additionalInfo = await _repositories.AdditionalInfo.Find(id);
            if (additionalInfo == null)
            {
                return NotFound();
            }

            await _repositories.AdditionalInfo.DeleteAsync(additionalInfo);

            return NoContent();
        }
    }
}
