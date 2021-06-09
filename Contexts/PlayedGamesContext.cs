using Microsoft.EntityFrameworkCore;
using DRG_Api.Models;

namespace DRG_Api.Contexts
{
    public class PlayedGamesContext : DbContext
    {
        public PlayedGamesContext(DbContextOptions<PlayedGamesContext> options) : base(options)
        {

        }

        public DbSet<PlayedGame> playedgame { get; set; }
        public DbSet<Platform> platform { get; set; }
        public DbSet<Status> status { get; set; }

    }
}