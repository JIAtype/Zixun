namespace ZixunAPI.Data.Entities
{
    public class Feedback
    {
        public int articleid { get; set; }
        public string username { get; set; } = string.Empty;    
        public string message { get; set; } = string.Empty;
        public DateTime adddate { get; set; } = DateTime.Now;
        public int id { get; set; }

    }
}
