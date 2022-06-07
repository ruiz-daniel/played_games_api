using System;
using System.IO;
using DRG_Api.Services;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DRG_Api.Controllers
{
    [Route("drgapi/[controller]")]
    [ApiController]
    public class ImagesController : ControllerBase
    {
        private readonly IUnitOfWork _repositories;

        private readonly IWebHostEnvironment _webHostEnvironment;

        public ImagesController(
            IUnitOfWork unitOfWork,
            IWebHostEnvironment environment
        )
        {
            _repositories = unitOfWork;
            _webHostEnvironment = environment;
        }

        [HttpPost]
        public string UploadFile(IFormFile image, string userid)
        {
            string uniqueFileName = null;
            string uploadsFolder = null;

            if (image != null)
            {
                string imagesFolder =
                    Path
                        .Combine(_webHostEnvironment.WebRootPath,
                        "game_images");
                if (userid != null)
                {
                    uploadsFolder = Path.Combine(imagesFolder, userid);
                    Directory.CreateDirectory (uploadsFolder);
                }
                else
                {
                    uploadsFolder = imagesFolder;
                }
                uniqueFileName = image.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (
                    var fileStream = new FileStream(filePath, FileMode.Create)
                )
                {
                    image.CopyTo (fileStream);
                }
            }
            return uniqueFileName;
        }
    }
}
