using System.Threading.Tasks;
using System;
using System.Linq.Expressions;
using System.Collections.Generic;
namespace DRG_Api.Repositories
{
    public interface IGenericRepository<T> where T : class
    {
        Task<T> Find(int id);
        Task<T> Find(string id);
        Task<List<T>> FindAll();
        Task<List<T>> FindBy(Expression<Func<T, bool>> expression);
        Task<T> CreateAsync(T entity);
        // Task CreateListAsync(IEnumerable<T> entities);
        Task<T> UpdateAsync(T entity);
        Task<T> DeleteAsync(T entity);
    }
}