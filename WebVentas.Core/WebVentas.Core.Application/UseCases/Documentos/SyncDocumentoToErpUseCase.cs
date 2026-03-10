using System;
using System.Threading.Tasks;
using WebVentas.Core.Domain.Interfaces;
using WebVentas.Core.Application.Interfaces;

namespace WebVentas.Core.Application.UseCases.Documentos
{
    public class SyncDocumentoToErpUseCase
    {
        private readonly IDocumentoRepository _documentoRepository;
        private readonly ISapSyncService _sapSyncService;

        public SyncDocumentoToErpUseCase(IDocumentoRepository documentoRepository, ISapSyncService sapSyncService)
        {
            _documentoRepository = documentoRepository;
            _sapSyncService = sapSyncService;
        }

        public async Task<bool> ExecuteAsync(int id)
        {
            var documento = await _documentoRepository.GetByIdAsync(id);
            if (documento == null) throw new Exception("Documento no encontrado para sincronizar.");
            if (documento.EstaAnulado) throw new Exception("Un documento anulado no puede ser sincronizado al ERP.");

            return await _sapSyncService.SyncDocumentoAsync(documento.Numero, documento.Total);
        }
    }
}
