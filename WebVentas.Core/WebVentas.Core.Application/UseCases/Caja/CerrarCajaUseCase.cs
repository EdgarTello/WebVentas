using System;
using System.Threading.Tasks;
using WebVentas.Core.Domain.Interfaces;
using WebVentas.Core.Application.DTOs;

namespace WebVentas.Core.Application.UseCases.Caja
{
    public class CerrarCajaUseCase
    {
        private readonly IOperacionCajaRepository _cajaRepository;

        public CerrarCajaUseCase(IOperacionCajaRepository cajaRepository)
        {
            _cajaRepository = cajaRepository;
        }

        public async Task<OperacionCajaDto> ExecuteAsync(int id, CierreCajaRequest request)
        {
            var operacion = await _cajaRepository.GetByIdAsync(id);

            if (operacion == null)
            {
                throw new Exception($"Operación de Caja {id} no encontrada.");
            }

            operacion.Cerrar(request.EfectivoCierre, request.TarjetaCierre);

            await _cajaRepository.UpdateAsync(operacion);

            return new OperacionCajaDto
            {
                Id = operacion.Id,
                IdCaja = operacion.IdCaja,
                Serie = operacion.Serie,
                Empleado = operacion.Empleado,
                EfectivoApertura = operacion.EfectivoApertura,
                FechaApertura = operacion.FechaApertura,
                EfectivoCierre = operacion.EfectivoCierre,
                TarjetaCierre = operacion.TarjetaCierre,
                FechaCierre = operacion.FechaCierre,
                EstaAbierta = operacion.EstaAbierta
            };
        }
    }
}
