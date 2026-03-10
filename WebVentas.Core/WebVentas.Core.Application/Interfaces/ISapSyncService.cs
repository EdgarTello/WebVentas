using System.Threading.Tasks;

namespace WebVentas.Core.Application.Interfaces
{
    public interface ISapSyncService
    {
        Task<bool> SyncDocumentoAsync(string numeroDocumento, decimal total);
    }
}
