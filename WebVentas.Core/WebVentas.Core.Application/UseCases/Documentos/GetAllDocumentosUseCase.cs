using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebVentas.Core.Domain.Interfaces;
using WebVentas.Core.Application.DTOs;

namespace WebVentas.Core.Application.UseCases.Documentos
{
    public class GetAllDocumentosUseCase
    {
        private readonly IDocumentoRepository _documentoRepository;

        public GetAllDocumentosUseCase(IDocumentoRepository documentoRepository)
        {
            _documentoRepository = documentoRepository;
        }

        public async Task<IEnumerable<DocumentoDto>> ExecuteAsync()
        {
            var documentos = await _documentoRepository.GetAllAsync();
            return documentos.Select(d => new DocumentoDto
            {
                Id = d.Id,
                Numero = d.Numero,
                Tipo = d.Tipo,
                FechaEmision = d.FechaEmision,
                ClienteRuc = d.ClienteRuc,
                ClienteRazonSocial = d.ClienteRazonSocial,
                Total = d.Total,
                Estado = d.EstaAnulado ? "Anulado" : "Activo"
            });
        }
    }
}
