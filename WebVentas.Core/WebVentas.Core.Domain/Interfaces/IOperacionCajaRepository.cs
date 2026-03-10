using System.Collections.Generic;
using System.Threading.Tasks;
using WebVentas.Core.Domain.Entities;

namespace WebVentas.Core.Domain.Interfaces
{
    public interface IOperacionCajaRepository
    {
        Task<OperacionCaja> GetByIdAsync(int id);
        Task<OperacionCaja> GetCajaActivaAsync(int idCaja);
        Task<IEnumerable<OperacionCaja>> GetAllAsync();
        Task AddAsync(OperacionCaja operacionCaja);
        Task UpdateAsync(OperacionCaja operacionCaja);
    }
}
