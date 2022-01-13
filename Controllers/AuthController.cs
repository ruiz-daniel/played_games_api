using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DRG_Api.Models;
using DRG_Api.Services;

namespace DRG_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        public AuthController(IUnitOfWork unitOfWork)
        {
            _repositories = unitOfWork;
        }
    }
}