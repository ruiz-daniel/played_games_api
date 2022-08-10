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
            Games = new GameRepository(_context);
            Statuses = new StatusRepository(_context);
            Platforms = new PlatformRepository(_context);
            Top10Games = new Top10GamesRepository(_context);
            Top10Names = new Top10NameRepository(_context);
            Characters = new CharacterRepository(_context);
            Top10Characters = new Top10CharactersRepository(_context);
            Users = new UserRepository(_context);
            AdditionalInfo = new AdditionalInfoRepository(_context);
        }

        public PlayedGamesRepository PlayedGames { get; private set; }

        public GameRepository Games { get; private set; }

        public StatusRepository Statuses { get; private set; }

        public PlatformRepository Platforms { get; private set; }

        public Top10GamesRepository Top10Games { get; private set; }

        public Top10NameRepository Top10Names { get; private set; }

        public CharacterRepository Characters { get; private set; }

        public Top10CharactersRepository Top10Characters { get; private set; }

        public UserRepository Users { get; private set; }

        public AdditionalInfoRepository AdditionalInfo { get; private set; }

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
