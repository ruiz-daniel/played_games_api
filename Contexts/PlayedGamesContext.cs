using DRG_Api.Models;
using Microsoft.EntityFrameworkCore;

namespace DRG_Api.Contexts
{
    public class PlayedGamesContext : DbContext
    {
        public PlayedGamesContext(
            DbContextOptions<PlayedGamesContext> options
        ) :
            base(options)
        {
        }

        public DbSet<PlayedGame> playedgame { get; set; }

        public DbSet<Platform> platform { get; set; }

        public DbSet<Status> status { get; set; }

        public DbSet<Top10Game> top10games { get; set; }

        public DbSet<Top10Name> top10name { get; set; }

        public DbSet<Character> character { get; set; }

        public DbSet<Top10Character> top10characters { get; set; }

        public DbSet<User> user { get; set; }

        public DbSet<AdditionalInfo> additional_info { get; set; }
    }
}
