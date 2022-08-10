using System;
using DRG_Api.Repositories;
namespace DRG_Api.Services
{
    public interface IUnitOfWork : IDisposable
    {
        public PlayedGamesRepository PlayedGames { get; }
        public StatusRepository Statuses { get; }
        public PlatformRepository Platforms { get; }
        public Top10GamesRepository Top10Games { get; }
        public Top10NameRepository Top10Names { get; }
        public CharacterRepository Characters { get; }
        public Top10CharactersRepository Top10Characters { get; }
        public UserRepository Users { get; }
        public AdditionalInfoRepository AdditionalInfo { get; }
        int Save();
    }
}