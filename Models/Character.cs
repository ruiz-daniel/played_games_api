namespace DRG_Api.Models
{
    public class Character
    {
        public int id { get; set; }
        public string name { get; set; }
        public string gameid { get; set; }
        public string wikia_url { get; set; }
        public string image { get; set; }
        public bool favorite {get; set;}
        public string username {get; set;}
        public User user {get; set;}
    }
}