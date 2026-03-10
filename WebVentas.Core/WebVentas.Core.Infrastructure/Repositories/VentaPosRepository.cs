using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebVentas.Core.Domain.Entities;
using WebVentas.Core.Domain.Interfaces;

namespace WebVentas.Core.Infrastructure.Repositories
{
    public class VentaPosRepository : IVentaPosRepository
    {
        private readonly WebVentas.Core.Infrastructure.Data.AppDbContext _context;

        public VentaPosRepository(WebVentas.Core.Infrastructure.Data.AppDbContext context)
        {
            _context = context;
        }

        public async Task<VentaPos> GetByIdAsync(int id)
        {
            var venta = await _context.VentasPos.FindAsync(id);
            if (venta != null)
            {
                await _context.Entry(venta).Collection(v => v.Detalles).LoadAsync();
            }
            return venta!;
        }

        public async Task<IEnumerable<VentaPos>> GetVentasPorCajaAsync(int cajaOperacionId)
        {
            // Requires reference to System.Linq and EF.Core query, simulating with standard Linq 
            // as EF Core is active on _context.VentasPos
            var list = _context.VentasPos.Where(v => v.CajaOperacionId == cajaOperacionId).ToList();
            return await Task.FromResult(list);
        }

        public async Task GuardarNuevoAsync(VentaPos venta)
        {
            _context.VentasPos.Add(venta);
            
            // Simular generación de correlativos si fuera SQL puro, pero EF Core asigna el ID.
            if (string.IsNullOrEmpty(venta.NroDocumento) || venta.NroDocumento == "00000000")
            {
                // Un correlativo mock para la PoC:
                var correlativoFormat = new Random().Next(100, 9999).ToString("D8");
                
                // Usar reflexión para setear el private setter (en EF Core no hace falta, pero para este mock rapido de nroDoc si)
                var property = typeof(VentaPos).GetProperty("NroDocumento");
                property?.SetValue(venta, correlativoFormat);
            }

            await _context.SaveChangesAsync();
        }

        public async Task ActualizarAsync(VentaPos venta)
        {
            _context.VentasPos.Update(venta);
            await _context.SaveChangesAsync();
        }
    }
}
