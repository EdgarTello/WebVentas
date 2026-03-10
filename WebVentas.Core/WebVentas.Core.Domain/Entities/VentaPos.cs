using System;
using System.Collections.Generic;
using System.Linq;

namespace WebVentas.Core.Domain.Entities
{
    public class VentaPos
    {
        public int Id { get; private set; }
        
        // Relación con el Módulo de Operaciones de Caja.
        // Una venta se realiza dentro de una sesión de caja abierta.
        public int CajaOperacionId { get; private set; }

        public string? ClienteId { get; private set; } // Puede ser nulo (público en general)
        public string SerieDocumento { get; private set; } = string.Empty;
        public string NroDocumento { get; private set; } = string.Empty;
        public DateTime FechaEmision { get; private set; }
        
        public decimal Subtotal { get; private set; }
        public decimal IGV { get; private set; }
        public decimal Total { get; private set; }
        
        public string Estado { get; private set; } = string.Empty; // PENDIENTE, PAGADO, ANULADO

        // Detalles de la venta
        private readonly List<VentaPosDetalle> _detalles = new List<VentaPosDetalle>();
        public IReadOnlyCollection<VentaPosDetalle> Detalles => _detalles.AsReadOnly();

        // Para EF Core
        protected VentaPos() { }

        public VentaPos(int cajaOperacionId, string? clienteId)
        {
            if (cajaOperacionId <= 0)
                throw new ArgumentException("La venta debe estar asociada a una operación de caja válida.", nameof(cajaOperacionId));

            CajaOperacionId = cajaOperacionId;
            ClienteId = clienteId;
            FechaEmision = DateTime.UtcNow;
            Estado = "PENDIENTE";
            SerieDocumento = "T001"; // Serie temporal o hardcodeada para POS local
            NroDocumento = "00000000"; // Se generará en persistencia
        }

        public void AgregarDetalle(string idProducto, string descripcion, decimal cantidad, decimal precioUnitario)
        {
            if (Estado != "PENDIENTE")
                throw new InvalidOperationException("Solo se pueden agregar ítems a una venta en estado PENDIENTE.");

            var detalle = new VentaPosDetalle(this, idProducto, descripcion, cantidad, precioUnitario);
            _detalles.Add(detalle);
            RecalcularTotales();
        }

        private void RecalcularTotales()
        {
            Total = _detalles.Sum(d => d.Subtotal);
            // Asumiendo un IGV de 18% para Perú si el precio estuviera sin IGV. 
            // Para simplificar la PoC en POS, asumiremos que PrecioUnitario incluye IGV.
            Subtotal = Total / 1.18m;
            IGV = Total - Subtotal;
        }

        public void Pagar()
        {
            if (Estado != "PENDIENTE")
                throw new InvalidOperationException("Solo se pueden pagar ventas en estado PENDIENTE.");

            if (!_detalles.Any())
                throw new InvalidOperationException("No se puede pagar una venta vacía.");

            Estado = "PAGADO";
        }

        public void Anular()
        {
            if (Estado == "ANULADO")
                throw new InvalidOperationException("La venta ya está anulada.");

            Estado = "ANULADO";
        }
    }
}
