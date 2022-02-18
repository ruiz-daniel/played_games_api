namespace DRG_Api.Models
{
    public class Character
    {
        public int id { get; set; }
        public string name { get; set; }
        public string gameid { get; set; }
        public PlayedGame game { get; set; }
        public string wikia_url { get; set; }
        public string image { get; set; }
        public bool favorite {get; set;}
        public string userid {get; set;}
        public User user {get; set;}
    }
}