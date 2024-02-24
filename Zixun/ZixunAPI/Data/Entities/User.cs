namespace ZixunAPI.Data.Entities
{
    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; } = string.Empty;    
        public string Pwd { get; set; } = string.Empty;
        public string? Sex { get; set; }
        public int Age { get; set; }
        public string? Tel { get; set; }
        public bool IsAdmin { get; set; } = false;
        public bool Pinglun { get; set; } = true;
        public bool Dianzan { get; set; } = true;
        public bool Shoucang { get; set; } = true;
        public string? Jianjie { get; set; } 
    }
}