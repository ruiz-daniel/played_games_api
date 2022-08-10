using System;
using DRG_Api.Contexts;
using DRG_Api.Models;

namespace DRG_Api.Repositories
{
    public class AdditionalInfoRepository : GenericRepository<AdditionalInfo>
    {
        public AdditionalInfoRepository(PlayedGamesContext context) : base(context)
        {
        }
    }
}
