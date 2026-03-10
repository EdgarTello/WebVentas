using System;
using System.Threading.Tasks;
using WebVentas.Core.Domain.Interfaces;

namespace WebVentas.Core.Application.UseCases.Documentos
{
    public class AnularDocumentoUseCase
    {
        private readonly IDocumentoRepository _documentoRepository;

        public AnularDocumentoUseCase(IDocumentoRepository documentoRepository)
        {
            _documentoRepository = documentoRepository;
        }

        public async Task ExecuteAsync(int id)
        {
            var documento = await _documentoRepository.GetByIdAsync(id);
            
            if (documento == null)
                throw new Exception($"No se encontró el documento con ID {id}.");

            if (documento.EstaAnulado)
                throw new Exception("El documento ya se encuentra anulado.");

            // Regla de Negocio: Invoca el método seguro del Dominio.
            documento.Anular();

            await _documentoRepository.UpdateAsync(documento);
        }
    }
}
