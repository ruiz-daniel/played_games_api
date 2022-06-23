namespace DRG_Api.Models
{
    public class Top10Game
    {
        public int id { get; set; }

        public string gameid { get; set; }

        public PlayedGame game { get; set; }

        public int pos { get; set; }

        public int top10nameid { get; set; }

        public Top10Name top10name { get; set; }

        public string userid { get; set; }
    }
}
