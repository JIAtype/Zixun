using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ZixunAPI.Data;
using ZixunAPI.Data.Entities;

namespace ZixunAPI.Controllers//留言评论管理
{
    [Route("api/[controller]")]
    [ApiController]
    public class FeedbackController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly ILogger<FeedbackController> _logger;

        public FeedbackController(AppDbContext context, ILogger<FeedbackController> logger)
        {
            _context = context;
            _logger = logger;
        }

        [HttpPost("add")]
        public JsonResult Add(Feedback feedback, int userid)
        {
            bool Pinglun = _context.Users.Find(userid).Pinglun;
            if (!Pinglun)
            {
                return new JsonResult() { code = -1, msg = "您没有评论权限！" };
            }
            if (string.IsNullOrEmpty(feedback.message))
            {
                return new JsonResult() { code = -1, msg = "评论内容不能为空！" };
            }
            feedback.adddate = DateTime.Now;
            _context.Feedbacks.Add(feedback);
            _context.SaveChanges();
            return new JsonResult() { code = 0, msg = "评论成功"};
        }

        [HttpGet("list")]
        public JsonResult GetFeedbackByArticleId(int articleId)
        {
            _logger.LogInformation("获取评论列表,文章ID:" + articleId.ToString());

            var data = _context.Feedbacks.Where(x=>x.articleid == articleId).ToList();
            return new JsonResult() { code = 0, msg = "获取评论列表成功", data = data };
        }

        [HttpGet("delete")]
        public JsonResult Delete(int pinglunId)
        {
        
            var data = _context.Feedbacks.Find(pinglunId);
            if(data != null)
            {
                _context.Feedbacks.Remove(data);
                _context.SaveChanges();
            }           

            return new JsonResult() { code = 0, msg = "评论删除成功！" };
        }

    }
}
