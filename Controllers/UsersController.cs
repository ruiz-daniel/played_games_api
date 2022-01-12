using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DRG_Api.Models;
using DRG_Api.Services;

namespace DRG_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        public UsersController(IUnitOfWork unitOfWork)
        {
            _repositories = unitOfWork;
        }

        [HttpGet("login")]
        public async Task<ActionResult<User>> Login(string username, string password)
        {
            return await _repositories.Users.login(username, password);
        }
        [HttpPost("user")]
        public async Task<ActionResult<PlayedGame>> PostUser(User user)
        {
            user.userid = System.Guid.NewGuid().ToString();
            await _repositories.Users.CreateAsync(user);

            return CreatedAtAction(nameof(PostUser), new { id = user.userid }, user);
        }
    }
}