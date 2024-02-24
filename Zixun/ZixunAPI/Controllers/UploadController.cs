using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ZixunAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase//上传图片
    {
        public JsonResult Post([FromServices] IWebHostEnvironment env, IFormFile file)
        {
            var uploads = Path.Combine(env.WebRootPath, "uploads");
            var ext = Path.GetExtension(file.FileName);//获得文件扩展名
            var timeStamp = DateTimeOffset.Now.ToUnixTimeSeconds();
            var saveName = $"{timeStamp}{ext}";//实际保存文件名
            using (var fileStream = new FileStream(Path.Combine(uploads, saveName), FileMode.Create))
            {
                file.CopyTo(fileStream);
            }

            return new JsonResult() { code=0,msg="",data=new {img = saveName } };
        }
    }
}
