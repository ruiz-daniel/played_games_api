namespace DRG_Api.Models
{
    public class Top10Character
    {
        public int id { get; set; }
        public int characterid { get; set; }
        public Character character { get; set; }
        public int pos { get; set; }
        public int top10nameid { get; set; }
        public Top10Name top10name { get; set; }
    }
}