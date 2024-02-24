using System.Globalization;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ZixunAPI.Data;
using ZixunAPI.Data.Entities;

namespace ZixunAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StarController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly ILogger<StarController> _logger;

        public StarController(AppDbContext context, ILogger<StarController> logger)
        {
            _context = context;
            _logger = logger;
        }

        [HttpPost("list")]
        public JsonResult GetAllStar()
        {
            var data = _context.Stars.ToList();
            var data_sort = data.OrderBy(s => s.name,StringComparer.Create(CultureInfo.GetCultureInfo("zh-cn"), true)).ToList();
            return new JsonResult() { code = 0, msg = "明星列表数据获取成功！", data = data_sort };
        }

        [HttpPost("toplist")]
        public JsonResult GetTopStar()
        {
            var data = _context.Stars.ToList().Take(8);
            return new JsonResult() { code = 0, msg = "明星列表数据获取成功！", data = data };
        }

        [HttpGet("getstardata")]
        public JsonResult GetStarData(int starid)
        {
            var data = _context.Stars.Find(starid);
            return new JsonResult() { code = 0, msg = "明星数据获取成功！", data = data };
        }

        [HttpPost("add")]
        public JsonResult Add([FromBody] Star star)
        {

            _context.Stars.Add(star);
            _context.SaveChanges();
            return new JsonResult() { code = 0, msg = "明星添加成功！" };
        }

        [HttpPost("edit")]
        public JsonResult Edit([FromBody] Star star)
        {
            var data = _context.Stars.Find(star.id);
            data.name = star.name;
            data.img = star.img;
            data.desc = star.desc;
            _context.SaveChanges();
            return new JsonResult() { code = 0, msg = "明星编辑成功！" };
        }

        [HttpGet("delete")]
        public JsonResult Delete(int starid)
        {

            var start = _context.Stars.Find(starid);
            if (start != null)
            {
                _context.Stars.Remove(start);
                _context.SaveChanges();
                return new JsonResult() { code = 0, msg = "明星删除成功！" };
            }
            else
            {
                return new JsonResult() { code = -1, msg = "删除失败，明星不存在或已删除！" };
            }
        }

        [HttpGet("search")]
        public JsonResult Search(string starname)
        {
            var data = _context.Stars.Where(x => x.name.Contains(starname)).ToList();
            if (data.LongCount() == 0)
            {
                return new JsonResult() { code = -1, msg = "未查找到数据！" };
            }
            return new JsonResult() { code = 0, msg = "查找明星成功！", data = data };
        }




    }
}
