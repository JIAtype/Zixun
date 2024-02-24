namespace ZixunAPI
{
    public class JsonResult
    {
        public int code { get; set; }
        public string msg { get; set; } = string.Empty;
        public object? data { get; set; } = null;
    }
}
