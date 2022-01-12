using System;
using DRG_Api.Repositories;
namespace DRG_Api.Services
{
    public interface IUnitOfWork : IDisposable
    {
        IPlayedGamesRepository PlayedGames { get; }
        public IStatusRepository Statuses { get; }
        public IPlatformRepository Platforms { get; }
        public ITop10GamesRepository Top10Games { get; }
        public ITop10NameRepository Top10Names { get; }
        public ICharacterRepository Characters { get; }
        public ITop10CharactersRepository Top10Characters { get; }
        public IUserRepository Users { get; }
        int Save();
    }
}