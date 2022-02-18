using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DRG_Api.Models;
using DRG_Api.Dtos;
using DRG_Api.Services;

namespace DRG_Api.Controllers
{
    [Route("drgapi")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        public UsersController(IUnitOfWork unitOfWork)
        {
            _repositories = unitOfWork;
        }

        [HttpPost("register")]
        public async Task<ActionResult<PlayedGame>> PostUser(User user)
        {
            user.userid = System.Guid.NewGuid().ToString();
            user.password = BCrypt.Net.BCrypt.HashPassword(user.password);
            await _repositories.Users.CreateAsync(user);

            return CreatedAtAction(nameof(PostUser), new { id = user.userid }, user);
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login(User userData)
        {
            var user = await _repositories.Users.FindOneBy(u => u.username == userData.username);
            if (user == null)
            {
                return BadRequest(new {message = "Invalid Credentials"});
            }
            if(!BCrypt.Net.BCrypt.Verify(userData.password, user.password))
            {
                return BadRequest(new {message = "Invalid Credentials"});
            }
            var userDTO = new UserDTO(user.username, user.display_name);
            return Ok(userDTO);
        }

        [HttpDelete("user/{id}")]
        public async Task<IActionResult> DeleteUser(string id)
        {
            var user = await _repositories.Users.Find(id);
            if (user == null)
            {
                return NotFound();
            }

            await _repositories.Users.DeleteAsync(user);

            return NoContent();
        }
    }
}