using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using WebVentas.Core.Domain.Entities;
using WebVentas.Core.Domain.Interfaces;
using WebVentas.Core.Infrastructure.Data;

namespace WebVentas.Core.Infrastructure.Repositories
{
    public class DocumentoRepository : IDocumentoRepository
    {
        private readonly AppDbContext _context;

        public DocumentoRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<Documento> GetByIdAsync(int id)
        {
            return await _context.Documentos.FindAsync(id);
        }

        public async Task<IEnumerable<Documento>> GetAllAsync()
        {
            return await _context.Documentos.ToListAsync();
        }

        public async Task AddAsync(Documento documento)
        {
            await _context.Documentos.AddAsync(documento);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(Documento documento)
        {
            _context.Documentos.Update(documento);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(int id)
        {
            var doc = await GetByIdAsync(id);
            if (doc != null)
            {
                _context.Documentos.Remove(doc);
                await _context.SaveChangesAsync();
            }
        }
    }
}
