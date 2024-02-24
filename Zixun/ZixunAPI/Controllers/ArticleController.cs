using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ZixunAPI.Data;
using ZixunAPI.Data.Entities;

namespace ZixunAPI.Controllers//资讯管理
{
    [Route("api/[controller]")]
    [ApiController]
    public class ArticleController : ControllerBase
    {
        private readonly AppDbContext _context;
        public ArticleController(AppDbContext context)
        {
            _context = context;
        }

        [HttpPost("getall")]
        public JsonResult GetAll()
        {         
            var data = _context.Articles.OrderByDescending(x=>x.postdate).ToList();
            foreach(var item in data)
            {                
                item.pingluncount = _context.Feedbacks.Where(x => x.articleid == item.id).ToList().Count();
                item.shoucangcount = _context.Shoucangs.Where(x => x.articleid == item.id).ToList().Count();
                item.catname = _context.Categories.Find(item.catid)?.name;
            }
            return new JsonResult() { code = 0, msg = "列表数据获取成功！", data = data};
        }

        [HttpGet("gettop5shoucang")]
        public JsonResult GetTop5Shoucang()
        {
            var data = _context.Articles.ToList();
            foreach (var item in data)
            {
                item.pingluncount = _context.Feedbacks.Where(x => x.articleid == item.id).ToList().Count();
                item.shoucangcount = _context.Shoucangs.Where(x => x.articleid == item.id).ToList().Count();
                item.catname = _context.Categories.Find(item.catid)?.name;
            }

            var top5 = data.OrderByDescending(x => x.shoucangcount).Take(5);

            return new JsonResult() { code = 0, msg = "收藏最多列表数据获取成功！", data = top5 };
        }

        [HttpGet("gettop5pinglun")]
        public JsonResult GetTop5Pinglun()
        {
            var data = _context.Articles.ToList();
            foreach (var item in data)
            {
                item.pingluncount = _context.Feedbacks.Where(x => x.articleid == item.id).ToList().Count();
                item.shoucangcount = _context.Shoucangs.Where(x => x.articleid == item.id).ToList().Count();
                item.catname = _context.Categories.Find(item.catid)?.name;
            }

            var top5 = data.OrderByDescending(x => x.pingluncount).Take(5);

            return new JsonResult() { code = 0, msg = "评论最多列表数据获取成功！", data = top5 };
        }
        [HttpGet("gettop5hitcount")]

        public JsonResult GetTop5HitCount()
        {
            var top5 = _context.Articles.OrderByDescending(x=>x.hitcount).Take(5);          
            return new JsonResult() { code = 0, msg = "点击量最多列表数据获取成功！", data = top5 };
        }


        [HttpPost("category")]
        public JsonResult GetCategoryArticle(int catid)
        {
            var data = _context.Articles.Where(x=>x.catid == catid).OrderByDescending(x => x.postdate).ToList();

            foreach (var item in data)
            {
                item.pingluncount = _context.Feedbacks.Where(x => x.articleid == item.id).ToList().Count();
                item.shoucangcount = _context.Shoucangs.Where(x => x.articleid == item.id).ToList().Count();
                item.catname = _context.Categories.Find(item.catid)?.name;
            }
            return new JsonResult() { code = 0, msg = "列表数据获取成功！", data = data };
        }

        [HttpGet("detail")]
        public JsonResult Detail(int articleid)
        {
            var data = _context.Articles.Find(articleid);
            data.hitcount++;
            _context.SaveChanges();

            data.pingluncount = _context.Feedbacks.Where(x => x.articleid == data.id).ToList().Count();
            data.shoucangcount = _context.Shoucangs.Where(x => x.articleid == data.id).ToList().Count();            
            return new JsonResult() { code = 0, msg = "获取文章成功", data = data };

        }


        [HttpGet("shoucang")]
        public JsonResult AddShouCang(int userid, int articleid)
        {
            bool Shoucang = _context.Users.Find(userid).Shoucang;
            if (!Shoucang)
            {
                return new JsonResult() { code = -1, msg = "您没有收藏权限！" };
            }
            if (_context.Shoucangs.Any(x=>x.userid == userid && x.articleid == articleid))
            {
                return new JsonResult() { code = -1, msg = "不能重复收藏！" };
            }
            Shoucang shouCang = new Shoucang();
            shouCang.userid = userid;
            shouCang.articleid = articleid;
            _context.Shoucangs.Add(shouCang);
            _context.SaveChanges();

            var data = _context.Articles.Find(articleid);
            data.shoucangcount = _context.Shoucangs.Where(x => x.articleid == data.id).ToList().Count();
            return new JsonResult() { code = 0, msg = "收藏成功！",data = data };

        }

        [HttpGet("dianzan")]
        public JsonResult Dianzan(int articleid, int userid)
        {
            bool dianzan = _context.Users.Find(userid).Dianzan;
            if (!dianzan)
            {
                return new JsonResult() { code = -1, msg = "您没有点赞权限！" };
            }
            var article = _context.Articles.Find(articleid);
            article.zancount++;
            _context.SaveChanges();
            return new JsonResult() { code = 0, msg = "点赞成功！", data = article };

        }

        [HttpGet("getcategoryname")]
        public JsonResult GetCategoryNameByCatId(int catid)
        {
            var data  = _context.Categories.Find(catid);
            return new JsonResult() { code = 0, msg = "获取分类数据成功！", data = data };

        }

        [HttpPost("add")]
        public JsonResult Add([FromBody] Article article)
        {    

            //article.postdate = DateTime.Now;
            
            _context.Articles.Add(article);
            _context.SaveChanges();
            return new JsonResult() { code = 0, msg = "文章发布成功！" };
        }

        [HttpPost("edit")]
        public JsonResult Edit([FromBody] Article article)
        {
            var data = _context.Articles.Find(article.id);
            data.title = article.title;
            data.content = article.content;
            data.author = article.author;
            data.img = article.img;
            data.catid = article.catid;  
            data.starid = article.starid;
            data.postdate = article.postdate;

            _context.SaveChanges();
            return new JsonResult() { code = 0, msg = "文章编辑成功！" };
        }

        [HttpGet("delete")]
        public JsonResult Delete(int articleid)
        {  

            var article = _context.Articles.Find(articleid);
            if (article != null)
            {
                _context.Articles.Remove(article);
                _context.SaveChanges();          
                return new JsonResult() { code = 0, msg = "删除文章成功！" };
            }
            else
            {
                return new JsonResult() { code = -1, msg = "删除失败，文章不存在或已删除！" };
            }
        }

        [HttpGet("search")]
        public JsonResult Search(string title)
        {
            var data = _context.Articles.Where(x => x.title.Contains(title)).ToList();
            if ( data.LongCount() == 0)
            {
                return new JsonResult() { code = -1, msg = "未查找到数据！" };
            }
            foreach (var item in data)
            {
                item.pingluncount = _context.Feedbacks.Where(x => x.articleid == item.id).ToList().Count();
                item.shoucangcount = _context.Shoucangs.Where(x => x.articleid == item.id).ToList().Count();
                item.catname = _context.Categories.Find(item.catid)?.name;
            }
            return new JsonResult() { code = 0, msg = "查找文章成功！", data = data };
        }

        [HttpPost("getstarnews")]
        public JsonResult GetStarNews(int starid)
        {
            var data = _context.Articles.Where(x => x.starid == starid).ToList();
            return new JsonResult() { code = 0, msg = "获取明星资讯列表成功！", data = data };
        }

        [HttpGet("getlunbotu")]
        public JsonResult GetLunbotuList()
        {  
            var data = from t in _context.Articles 
                       orderby t.hitcount descending 
                       select new 
                       { 
                           id = t.id,
                           title = t.title,
                           url = t.img
                       } ;
            return new JsonResult() { code = 0, msg = "轮播图数据获取成功！", data = data.Take(5) };
        }

    }
}
