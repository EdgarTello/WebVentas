using System;
using System.Threading.Tasks;
using WebVentas.Core.Domain.Interfaces;
using WebVentas.Core.Domain.Entities;
using WebVentas.Core.Application.DTOs;

namespace WebVentas.Core.Application.UseCases.Caja
{
    public class AperturarCajaUseCase
    {
        private readonly IOperacionCajaRepository _cajaRepository;

        public AperturarCajaUseCase(IOperacionCajaRepository cajaRepository)
        {
            _cajaRepository = cajaRepository;
        }

        public async Task<OperacionCajaDto> ExecuteAsync(AperturaCajaRequest request)
        {
            var cajaAbierta = await _cajaRepository.GetCajaActivaAsync(request.IdCaja);

            if (cajaAbierta != null)
            {
                throw new InvalidOperationException($"La Caja {request.IdCaja} ya se encuentra aperturada y pendiente de cierre.");
            }

            var nuevaOperacion = new OperacionCaja(
                idCaja: request.IdCaja,
                serie: request.Serie,
                empleado: request.Empleado,
                efectivoApertura: request.EfectivoApertura
            );

            await _cajaRepository.AddAsync(nuevaOperacion);

            return new OperacionCajaDto
            {
                Id = nuevaOperacion.Id,
                IdCaja = nuevaOperacion.IdCaja,
                Serie = nuevaOperacion.Serie,
                Empleado = nuevaOperacion.Empleado,
                EfectivoApertura = nuevaOperacion.EfectivoApertura,
                FechaApertura = nuevaOperacion.FechaApertura,
                EstaAbierta = nuevaOperacion.EstaAbierta
            };
        }
    }
}
