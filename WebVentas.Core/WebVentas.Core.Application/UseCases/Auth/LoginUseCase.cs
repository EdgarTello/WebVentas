using System;
using System.Threading.Tasks;
using WebVentas.Core.Application.Interfaces;

namespace WebVentas.Core.Application.UseCases.Auth
{
    public class LoginUseCase
    {
        private readonly IAuthService _authService;

        public LoginUseCase(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<string> ExecuteAsync(string username, string password)
        {
            // Validacion DUMMY. Aquí iría la consulta real a base de datos y validación de hash de password.
            if (string.IsNullOrWhiteSpace(username) || password != "123456")
            {
                throw new UnauthorizedAccessException("Credenciales inválidas.");
            }

            return await _authService.GenerateJwtTokenAsync(username);
        }
    }
}
