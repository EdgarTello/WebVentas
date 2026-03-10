using System;

namespace WebVentas.Core.Domain.Entities
{
    public class VentaPosDetalle
    {
        public int Id { get; private set; }
        
        public int VentaPosId { get; private set; }
        public VentaPos VentaPos { get; private set; } = null!; // Referencia navegacional para EF Core

        public string IdProducto { get; private set; } = string.Empty;
        public string Descripcion { get; private set; } = string.Empty;
        
        public decimal Cantidad { get; private set; }
        public decimal PrecioUnitario { get; private set; }
        public decimal Subtotal { get; private set; }

        // Para EF Core
        protected VentaPosDetalle() { }

        internal VentaPosDetalle(VentaPos ventaPos, string idProducto, string descripcion, decimal cantidad, decimal precioUnitario)
        {
            if (cantidad <= 0)
                throw new ArgumentException("La cantidad debe ser mayor a cero.", nameof(cantidad));
            if (precioUnitario < 0)
                throw new ArgumentException("El precio unitario no puede ser negativo.", nameof(precioUnitario));

            VentaPos = ventaPos ?? throw new ArgumentNullException(nameof(ventaPos));
            VentaPosId = ventaPos.Id;
            IdProducto = idProducto;
            Descripcion = descripcion;
            Cantidad = cantidad;
            PrecioUnitario = precioUnitario;
            Subtotal = cantidad * precioUnitario; // Asumiendo PrecioUnitario de mostrador directo
        }
    }
}
