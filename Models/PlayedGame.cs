namespace DRG_Api.Models
{
    public class PlayedGame
    {
        public string id { get; set; }
        public string name { get; set; }
        public string year { get; set; }
        public string developer { get; set; }
        public string publisher { get; set; }
        public string genre { get; set; }
        public int rating { get; set; }
        public Platform platform { get; set; }
        public int platformid { get; set; }
        public Status status { get; set; }
        public int statusid { get; set; }
        public string image { get; set; }
        public string userid {get; set;}
        public User user {get; set;}
    }
}