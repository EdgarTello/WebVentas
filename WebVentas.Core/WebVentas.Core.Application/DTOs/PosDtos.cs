using System.Collections.Generic;

namespace WebVentas.Core.Application.DTOs
{
    public class RegistrarVentaPosRequest
    {
        public int CajaOperacionId { get; set; }
        public string? ClienteId { get; set; }
        public List<VentaPosDetalleDto> Detalles { get; set; } = new List<VentaPosDetalleDto>();
    }

    public class VentaPosDetalleDto
    {
        public string IdProducto { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public decimal Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
    }

    public class VentaPosResponseDto
    {
        public int Id { get; set; }
        public string Estado { get; set; } = string.Empty;
        public string SerieDocumento { get; set; } = string.Empty;
        public string NroDocumento { get; set; } = string.Empty;
        public decimal Total { get; set; }
    }
}
