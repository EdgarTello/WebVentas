using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebVentas.Core.Application.UseCases.Auth;

namespace WebVentas.Core.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly LoginUseCase _loginUseCase;

        public AuthController(LoginUseCase loginUseCase)
        {
            _loginUseCase = loginUseCase;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest request)
        {
            try
            {
                var token = await _loginUseCase.ExecuteAsync(request.Username, request.Password);
                return Ok(new { Token = token });
            }
            catch (UnauthorizedAccessException ex)
            {
                return Unauthorized(new { Error = ex.Message });
            }
        }
    }

    public class LoginRequest
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
