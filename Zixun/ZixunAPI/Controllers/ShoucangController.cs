using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ZixunAPI.Data;
using ZixunAPI.Data.Entities;

namespace ZixunAPI.Controllers//收藏管理
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShoucangController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly ILogger<ShoucangController> _logger;

        public ShoucangController(AppDbContext context, ILogger<ShoucangController> logger)
        {
            _context = context;
            _logger = logger;
        }

        [HttpGet("getmyshoucang")]
        public JsonResult GetMyShoucang(int userid)
        {
            _logger.LogInformation("收藏列表获取用户ID："+userid.ToString());
            var data = from t in _context.Shoucangs
                       join a in _context.Articles
                       on t.articleid equals a.id
                       select new {
                           articleId = a.id,
                           shoucangId = t.id,
                           title = a.title
                       };           
            return new JsonResult() { code = 0, msg = "列表我的收藏数据获取成功！", data = data };
        }

        [HttpGet("delete")]
        public JsonResult Delete(int shoucangId)
        {
            var model = _context.Shoucangs.Find(shoucangId);
            if(model == null)
            {
                return new JsonResult() { code = 0, msg = "删除收藏成功！" };
            }
            _context.Shoucangs.Remove(model);
            _context.SaveChanges();
            return new JsonResult() { code = 0, msg = "删除收藏成功！" };
        }

    }
}
