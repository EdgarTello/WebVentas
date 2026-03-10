using System.Collections.Generic;
using System.Threading.Tasks;
using WebVentas.Core.Domain.Entities;

namespace WebVentas.Core.Domain.Interfaces
{
    public interface IDocumentoRepository
    {
        Task<Documento> GetByIdAsync(int id);
        Task<IEnumerable<Documento>> GetAllAsync();
        Task AddAsync(Documento documento);
        Task UpdateAsync(Documento documento);
        Task DeleteAsync(int id);
    }
}
