using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ZixunAPI.Controllers//测试后端是否能运行
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        public JsonResult Get()
        {
            return new JsonResult() { code = 0, msg = "api service was started!" };
        }
    }
}
