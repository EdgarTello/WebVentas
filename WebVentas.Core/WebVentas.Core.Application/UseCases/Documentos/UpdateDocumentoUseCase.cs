using System;
using System.Threading.Tasks;
using WebVentas.Core.Domain.Interfaces;
using WebVentas.Core.Application.DTOs;

namespace WebVentas.Core.Application.UseCases.Documentos
{
    public class UpdateDocumentoUseCase
    {
        private readonly IDocumentoRepository _documentoRepository;

        public UpdateDocumentoUseCase(IDocumentoRepository documentoRepository)
        {
            _documentoRepository = documentoRepository;
        }

        public async Task ExecuteAsync(int id, DocumentoDto request)
        {
            if (id != request.Id) throw new ArgumentException("El ID de la ruta no coincide con el del cuerpo de la petición.");

            var documento = await _documentoRepository.GetByIdAsync(id);
            if (documento == null) throw new Exception($"El documento con Id {id} no existe.");

            // Dependiendo del diseño, la entidad Documento podría requerir métodos específicos para actualizarse:
            // Por ejemplo: documento.ActualizarTotales(request.Total);
            // Para propósitos de este PoC dejaremos que EF Core rastree objetos, o crearemos una mutación.
            // Aquí, lo ideal en CQRS es evitar exponer "setters" públicos y usar métodos de dominio.
            
            throw new NotImplementedException("Para el Update robusto, se deberían exponer métodos en la entidad de dominio. Ejemplo: documento.ModificarCabecera(...)");
        }
    }
}
