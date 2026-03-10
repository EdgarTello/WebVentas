using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using WebVentas.Core.Domain.Entities;
using WebVentas.Core.Domain.Interfaces;
using WebVentas.Core.Infrastructure.Data;

namespace WebVentas.Core.Infrastructure.Repositories
{
    public class OperacionCajaRepository : IOperacionCajaRepository
    {
        private readonly AppDbContext _context;

        public OperacionCajaRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<OperacionCaja> GetByIdAsync(int id)
        {
            return await _context.OperacionesCaja.FindAsync(id);
        }

        public async Task<OperacionCaja> GetCajaActivaAsync(int idCaja)
        {
            return await _context.OperacionesCaja
                .FirstOrDefaultAsync(c => c.IdCaja == idCaja && c.EstaAbierta);
        }

        public async Task<IEnumerable<OperacionCaja>> GetAllAsync()
        {
            return await _context.OperacionesCaja.ToListAsync();
        }

        public async Task AddAsync(OperacionCaja operacionCaja)
        {
            await _context.OperacionesCaja.AddAsync(operacionCaja);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(OperacionCaja operacionCaja)
        {
            _context.OperacionesCaja.Update(operacionCaja);
            await _context.SaveChangesAsync();
        }
    }
}
