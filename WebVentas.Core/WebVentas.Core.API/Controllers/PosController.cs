using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using WebVentas.Core.Application.DTOs;
using WebVentas.Core.Application.UseCases.Pos;

namespace WebVentas.Core.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    // [Authorize] - Apagado temporalmente para facilitar testing en PoC
    public class PosController : ControllerBase
    {
        private readonly RegistrarVentaPosUseCase _registrarVentaPosUseCase;

        public PosController(RegistrarVentaPosUseCase registrarVentaPosUseCase)
        {
            _registrarVentaPosUseCase = registrarVentaPosUseCase;
        }

        [HttpPost("venta")]
        public async Task<IActionResult> RegistrarVenta([FromBody] RegistrarVentaPosRequest request)
        {
            try
            {
                var result = await _registrarVentaPosUseCase.ExecuteAsync(request);
                return Ok(result);
            }
            catch (System.Exception ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
        }
    }
}
