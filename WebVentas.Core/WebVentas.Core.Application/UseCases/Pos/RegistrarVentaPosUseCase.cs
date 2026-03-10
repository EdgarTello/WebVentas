using System;
using System.Threading.Tasks;
using WebVentas.Core.Application.DTOs;
using WebVentas.Core.Domain.Entities;
using WebVentas.Core.Domain.Interfaces;

namespace WebVentas.Core.Application.UseCases.Pos
{
    public class RegistrarVentaPosUseCase
    {
        private readonly IVentaPosRepository _ventaPosRepository;
        private readonly IOperacionCajaRepository _cajaRepository;

        public RegistrarVentaPosUseCase(IVentaPosRepository ventaPosRepository, IOperacionCajaRepository cajaRepository)
        {
            _ventaPosRepository = ventaPosRepository;
            _cajaRepository = cajaRepository;
        }

        public async Task<VentaPosResponseDto> ExecuteAsync(RegistrarVentaPosRequest request)
        {
            if (request.Detalles == null || request.Detalles.Count == 0)
                throw new ArgumentException("La venta debe contener al menos un detalle.");

            // Validar que la caja exista y esté abierta
            var cajaOperacion = await _cajaRepository.GetByIdAsync(request.CajaOperacionId);
            if (cajaOperacion == null)
                throw new InvalidOperationException($"No se encontró la operación de caja con ID {request.CajaOperacionId}.");

            if (!cajaOperacion.EstaAbierta)
                throw new InvalidOperationException("No se puede registrar una venta en una caja que ya está cerrada.");

            // Crear Entidad Venta
            var venta = new VentaPos(request.CajaOperacionId, request.ClienteId);

            foreach (var item in request.Detalles)
            {
                venta.AgregarDetalle(item.IdProducto, item.Descripcion, item.Cantidad, item.PrecioUnitario);
            }

            // Una venta entra como PENDIENTE. Para PoC, la pagamos y finalizamos automáticamente.
            venta.Pagar();

            await _ventaPosRepository.GuardarNuevoAsync(venta);

            return new VentaPosResponseDto
            {
                Id = venta.Id,
                Estado = venta.Estado,
                SerieDocumento = venta.SerieDocumento,
                NroDocumento = venta.NroDocumento,
                Total = venta.Total
            };
        }
    }
}
