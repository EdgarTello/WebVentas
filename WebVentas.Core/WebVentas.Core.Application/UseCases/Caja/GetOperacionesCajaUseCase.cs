using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebVentas.Core.Domain.Interfaces;
using WebVentas.Core.Application.DTOs;

namespace WebVentas.Core.Application.UseCases.Caja
{
    public class GetOperacionesCajaUseCase
    {
        private readonly IOperacionCajaRepository _cajaRepository;

        public GetOperacionesCajaUseCase(IOperacionCajaRepository cajaRepository)
        {
            _cajaRepository = cajaRepository;
        }

        public async Task<IEnumerable<OperacionCajaDto>> ExecuteAsync()
        {
            var operaciones = await _cajaRepository.GetAllAsync();

            return operaciones.Select(o => new OperacionCajaDto
            {
                Id = o.Id,
                IdCaja = o.IdCaja,
                Serie = o.Serie,
                Empleado = o.Empleado,
                EfectivoApertura = o.EfectivoApertura,
                FechaApertura = o.FechaApertura,
                EfectivoCierre = o.EfectivoCierre,
                TarjetaCierre = o.TarjetaCierre,
                FechaCierre = o.FechaCierre,
                EstaAbierta = o.EstaAbierta
            });
        }
    }
}
