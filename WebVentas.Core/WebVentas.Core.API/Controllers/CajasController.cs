using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using System.Collections.Generic;
using WebVentas.Core.Application.DTOs;
using WebVentas.Core.Application.UseCases.Caja;

namespace WebVentas.Core.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CajasController : ControllerBase
    {
        private readonly AperturarCajaUseCase _aperturarCajaUseCase;
        private readonly CerrarCajaUseCase _cerrarCajaUseCase;
        private readonly GetOperacionesCajaUseCase _getOperacionesCajaUseCase;

        public CajasController(
            AperturarCajaUseCase aperturarCajaUseCase,
            CerrarCajaUseCase cerrarCajaUseCase,
            GetOperacionesCajaUseCase getOperacionesCajaUseCase)
        {
            _aperturarCajaUseCase = aperturarCajaUseCase;
            _cerrarCajaUseCase = cerrarCajaUseCase;
            _getOperacionesCajaUseCase = getOperacionesCajaUseCase;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<OperacionCajaDto>>> GetAll()
        {
            var operaciones = await _getOperacionesCajaUseCase.ExecuteAsync();
            return Ok(operaciones);
        }

        [HttpPost("aperturar")]
        public async Task<IActionResult> Aperturar([FromBody] AperturaCajaRequest request)
        {
            try
            {
                var operacion = await _aperturarCajaUseCase.ExecuteAsync(request);
                return Ok(operacion);
            }
            catch (System.Exception ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
        }

        [HttpPost("{id}/cerrar")]
        public async Task<IActionResult> Cerrar(int id, [FromBody] CierreCajaRequest request)
        {
            try
            {
                var operacion = await _cerrarCajaUseCase.ExecuteAsync(id, request);
                return Ok(operacion);
            }
            catch (System.Exception ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
        }
    }
}
