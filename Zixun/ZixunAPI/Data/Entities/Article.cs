using System.ComponentModel.DataAnnotations.Schema;

namespace ZixunAPI.Data.Entities
{
    [Table("articles")]
    public class Article
    {
        public string? title { get; set; } 
        public string? content { get; set; }

        public string? author { get; set; } 
        public string? img { get; set; }

        public int catid { get; set; }
        public int? starid { get; set; }

        public int zancount { get; set; } = 0;
        public int hitcount { get; set; } = 0;
        public DateTime postdate { get; set; } = DateTime.Now;
        public int id { get; set; }

        [NotMapped]
        public int shoucangcount { get; set; }
        [NotMapped]
        public int pingluncount { get; set; }

        [NotMapped]
        public string? catname { get; set; }

    }
}
