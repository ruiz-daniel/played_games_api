using System.Collections.Generic;
using System.Threading.Tasks;
using DRG_Api.Authentication;
using DRG_Api.Models;
using DRG_Api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DRG_Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        private readonly IJwtAuth jwtAuth;

        public AuthController(IUnitOfWork unitOfWork, IJwtAuth jwtAuth)
        {
            _repositories = unitOfWork;
            this.jwtAuth = jwtAuth;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> AllUsers()
        {
            return await _repositories.Users.FindAll();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<User>> UserById(string id)
        {
            var user = await _repositories.Users.Find(id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }

        [AllowAnonymous]
        [HttpPost("authentication")]
        public IActionResult
        Authentication([FromBody] UserCredential userCredential)
        {
            var token =
                jwtAuth
                    .Authentication(userCredential.username,
                    userCredential.password);
            if (token == null) return Unauthorized();
            return Ok(token);
        }
    }
}
