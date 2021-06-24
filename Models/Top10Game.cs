namespace DRG_Api.Models
{
    public class Top10Game
    {
        public int id { get; set; }
        public string gameid { get; set; }
        public PlayedGame game { get; set; }
        public int pos { get; set; }
    }
}