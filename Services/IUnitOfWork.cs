using System;
using DRG_Api.Repositories;
namespace DRG_Api.Services
{
    public interface IUnitOfWork : IDisposable
    {
        IPlayedGamesRepository PlayedGames { get; }
        public IStatusRepository Statuses { get; }
        public IPlatformRepository Platforms { get; }
        int Save();
    }
}