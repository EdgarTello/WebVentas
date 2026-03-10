using System.Threading.Tasks;
using WebVentas.Core.Domain.Interfaces;
using WebVentas.Core.Application.DTOs;

namespace WebVentas.Core.Application.UseCases.Documentos
{
    public class GetDocumentoByIdUseCase
    {
        private readonly IDocumentoRepository _documentoRepository;

        public GetDocumentoByIdUseCase(IDocumentoRepository documentoRepository)
        {
            _documentoRepository = documentoRepository;
        }

        public async Task<DocumentoDto> ExecuteAsync(int id)
        {
            var documento = await _documentoRepository.GetByIdAsync(id);
            if (documento == null) return null;

            return new DocumentoDto
            {
                Id = documento.Id,
                Numero = documento.Numero,
                Tipo = documento.Tipo,
                FechaEmision = documento.FechaEmision,
                ClienteRuc = documento.ClienteRuc,
                ClienteRazonSocial = documento.ClienteRazonSocial,
                Total = documento.Total,
                Estado = documento.EstaAnulado ? "Anulado" : "Activo"
            };
        }
    }
}
