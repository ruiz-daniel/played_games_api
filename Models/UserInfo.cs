namespace DRG_Api.Models
{
  public class UserInfo
  {
    public UserInfo(string id)
    {
      userid = id;
      playedgames = 0;
      completedGames = 0;
      playedgames = 0;
    }
    public string userid { get; set; }

    public int playedgames { get; set; }

    public int completedGames { get; set; }

    public int playingGames { get; set; }

    public PlayedGame favoriteGame { get; set; }
  }

}