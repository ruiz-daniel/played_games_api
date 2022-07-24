using System.Threading.Tasks;
using DRG_Api.Dtos;
using DRG_Api.Models;
using DRG_Api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DRG_Api.Controllers
{
    [Authorize]
    [Route("drgapi")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        public UsersController(IUnitOfWork unitOfWork)
        {
            _repositories = unitOfWork;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutUser(string id, User user)
        {
            if (id != user.userid)
            {
                return BadRequest();
            }

            try
            {
                await _repositories.Users.UpdateAsync(user);
            }
            catch
            {
                return NotFound();
            }

            return NoContent();
        }

        // [HttpDelete("user/{id}")]
        // public async Task<IActionResult> DeleteUser(string id)
        // {
        //     var user = await _repositories.Users.Find(id);
        //     if (user == null)
        //     {
        //         return NotFound();
        //     }

        //     await _repositories.Users.DeleteAsync(user);

        //     return NoContent();
        // }
    }
}
