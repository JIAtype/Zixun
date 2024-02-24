using Microsoft.EntityFrameworkCore;
using ZixunAPI.Data.Entities;

namespace ZixunAPI.Data
{
    public class AppDbContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Article> Articles { get; set; }
        public DbSet<Shoucang> Shoucangs { get; set; }
        public DbSet<Feedback> Feedbacks { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Star> Stars { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseMySQL("server=127.0.0.1;database=zixun;user=root;password=MySQL666;Character Set=utf8;");
        }

    }
}
//数据库连接