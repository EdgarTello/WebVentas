using System.Threading.Tasks;
using WebVentas.Core.Domain.Entities;
using System.Collections.Generic;

namespace WebVentas.Core.Domain.Interfaces
{
    public interface IVentaPosRepository
    {
        Task<VentaPos> GetByIdAsync(int id);
        Task<IEnumerable<VentaPos>> GetVentasPorCajaAsync(int cajaOperacionId);
        Task GuardarNuevoAsync(VentaPos venta);
        Task ActualizarAsync(VentaPos venta);
    }
}
