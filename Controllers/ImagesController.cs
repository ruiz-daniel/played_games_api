using System;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using DRG_Api.Services;
using Microsoft.AspNetCore.Hosting;
using System.IO;

namespace DRG_Api.Controllers
{
    [Route("drgapi/[controller]")]
    [ApiController]
    public class ImagesController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public ImagesController(IUnitOfWork unitOfWork, IWebHostEnvironment environment)
        {
            _repositories = unitOfWork;
            _webHostEnvironment = environment;
        }


        [HttpPost]
        public string UploadFile(IFormFile image)
        {
            string uniqueFileName = null;

            if (image != null)
            {
                Console.WriteLine("FILE: " + image.FileName);
                Console.WriteLine("FOLDER: " + _webHostEnvironment.WebRootPath);

                string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "game_images");
                Console.WriteLine("ROOT: " + uploadsFolder);
                uniqueFileName = image.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    image.CopyTo(fileStream);
                }
            }
            return uniqueFileName;
        }
    }
}