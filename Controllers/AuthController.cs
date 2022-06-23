using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DRG_Api.Authentication;
using DRG_Api.Dtos;
using DRG_Api.Models;
using DRG_Api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DRG_Api.Controllers
{
    [Authorize]
    [Route("drgapi/user")]
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

        [AllowAnonymous]
        [HttpPost("register")]
        public async Task<ActionResult<PlayedGame>> PostUser(User user)
        {
            user.userid = System.Guid.NewGuid().ToString();
            user.password = BCrypt.Net.BCrypt.HashPassword(user.password);
            await _repositories.Users.CreateAsync(user);

            return CreatedAtAction(nameof(PostUser),
            new { id = user.userid },
            user);
        }

        [AllowAnonymous]
        [HttpPost("login")]
        public async Task<IActionResult>
        Authentication([FromBody] UserCredential userCredential)
        {
            var user =
                await _repositories
                    .Users
                    .FindBy(u => u.username == userCredential.username);
            if (user.Count == 0)
            {
                Console.WriteLine("Invalid Username ");
                return BadRequest(new { message = "Invalid Credentials" });
            }
            if (
                !BCrypt
                    .Net
                    .BCrypt
                    .Verify(userCredential.password, user[0].password)
            )
            {
                Console.WriteLine("Invalid Password");
                return BadRequest(new { message = "Invalid Credentials" });
            }
            var token =
                jwtAuth
                    .Authentication(userCredential.username,
                    userCredential.password);
            if (token == null) return Unauthorized();

            var dto =
                new UserDTO(user[0].username,
                    user[0].display_name,
                    user[0].userid,
                    token);

            return Ok(dto);
        }
    }
}
