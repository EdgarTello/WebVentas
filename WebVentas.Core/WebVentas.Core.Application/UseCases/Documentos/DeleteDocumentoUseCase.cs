using System;
using System.Threading.Tasks;
using WebVentas.Core.Domain.Interfaces;

namespace WebVentas.Core.Application.UseCases.Documentos
{
    public class DeleteDocumentoUseCase
    {
        private readonly IDocumentoRepository _documentoRepository;

        public DeleteDocumentoUseCase(IDocumentoRepository documentoRepository)
        {
            _documentoRepository = documentoRepository;
        }

        public async Task ExecuteAsync(int id)
        {
            var documentoExistente = await _documentoRepository.GetByIdAsync(id);
            if (documentoExistente == null)
            {
                throw new Exception($"El documento con Id {id} no existe.");
            }

            await _documentoRepository.DeleteAsync(id);
        }
    }
}
