using System.Threading.Tasks;

namespace WebVentas.Core.Application.Interfaces
{
    public interface IAuthService
    {
        Task<string> GenerateJwtTokenAsync(string username);
    }
}
