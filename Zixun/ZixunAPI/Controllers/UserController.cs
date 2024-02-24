using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ZixunAPI.Data;
using ZixunAPI.Data.Entities;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ZixunAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase 
    {
        private readonly AppDbContext _context;
        private readonly ILogger<UserController> _logger;

        public UserController(AppDbContext context, ILogger<UserController> logger)
        {
            _context = context;
            _logger = logger;
        }

        // GET: api/user/login
        [HttpGet("login")]
        public  JsonResult Login(string username, string pwd)
        {
            var user =  _context.Users.Where(x => x.Username == username && x.Pwd == pwd).FirstOrDefault();
            if (user == null)
            {
                return new JsonResult() { code = -1, msg = "用户名或密码不正确！" }; 
            }
            else
            {
                return new JsonResult() { code = 0, data = user };
            }          
        }

        [HttpPost("reg")]
        public JsonResult Reg([FromBody] User user)
        {
            if (_context.Users.Any(x=>x.Username == user.Username))
            {
                return new JsonResult() { code = -1, msg = "用户名已存在！" };
            }
            _context.Users.Add(user);
            _context.SaveChanges();
            return new JsonResult() { code = 0, msg = "注册成功！"};
        }

        [HttpPost("modify")]
        public JsonResult Modify([FromBody] User user)
        {
            var model = _context.Users.Find(user.Id);
            // if user has changed username
            if (model.Username != user.Username)
            {
                if (_context.Users.Any(x=>x.Username == user.Username)) 
                {
                    return new JsonResult() { code = -1, msg = "用户名已存在！" };
                }
            }

            model.Username = user.Username;    
            model.Pwd = user.Pwd;
            model.Age = user.Age;
            model.Sex = user.Sex;   
            model.Tel = user.Tel;    
            model.Pinglun = user.Pinglun;
            model.Dianzan = user.Dianzan;
            model.Shoucang = user.Shoucang;
            model.Jianjie = user.Jianjie;
            _context.SaveChanges();
            return new JsonResult() { code = 0, msg = "用户信息修改成功！" };
        }

        [HttpGet("getuserlist")]
        public JsonResult GetUserList()
        {
            var data = _context.Users.ToList();
            return new JsonResult() { code = 0, msg = "获取用户列表成功！", data=data };
        }

        [HttpGet("delete")]
        public JsonResult Delete(int userid)
        {
            _logger.LogInformation("删除用户："+userid.ToString());  

            var user = _context.Users.Find(userid);
            if (user != null)
            {
                _context.Users.Remove(user);
                _context.SaveChanges();
                _logger.LogInformation("删除用户成功");
                return new JsonResult() { code = 0, msg = "删除用户成功！" };
            }
            else
            {
                return new JsonResult() { code = -1, msg = "删除失败，用户不存在或已删除！" };
            }

        }

        [HttpGet("search")]
        public JsonResult Search(string username)
        {
            var data = _context.Users.Where(x=>x.Username.Equals(username)).ToList();
            return new JsonResult() { code = 0, msg = "查找用户成功！", data = data };
        }


    }
}
