using DRG_Api.Contexts;
using DRG_Api.Repositories;
namespace DRG_Api.Services
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly PlayedGamesContext _context;
        public UnitOfWork(PlayedGamesContext context)
        {
            _context = context;
            PlayedGames = new PlayedGamesRepository(_context);
            Statuses = new StatusRepository(_context);
            Platforms = new PlatformRepository(_context);
            Top10Games = new Top10GamesRepository(_context);

        }

        public IPlayedGamesRepository PlayedGames { get; private set; }
        public IStatusRepository Statuses { get; private set; }
        public IPlatformRepository Platforms { get; private set; }
        public ITop10GamesRepository Top10Games { get; private set; }
        public int Save()
        {
            return _context.SaveChanges();
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}