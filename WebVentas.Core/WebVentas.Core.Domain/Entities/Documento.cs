using System;

namespace WebVentas.Core.Domain.Entities
{
    public class Documento
    {
        public int Id { get; private set; }
        public string Numero { get; private set; }
        public string Tipo { get; private set; } // Ej: Factura, Boleta, Guia
        public DateTime FechaEmision { get; private set; }
        public string ClienteRuc { get; private set; }
        public string ClienteRazonSocial { get; private set; }
        public decimal Total { get; private set; }
        public bool EstaAnulado { get; private set; }

        // EF Constructor
        protected Documento() { }

        public Documento(string numero, string tipo, DateTime fechaEmision, string clienteRuc, string clienteRazonSocial, decimal total)
        {
            Numero = numero ?? throw new ArgumentNullException(nameof(numero));
            Tipo = tipo ?? throw new ArgumentNullException(nameof(tipo));
            FechaEmision = fechaEmision;
            ClienteRuc = clienteRuc ?? throw new ArgumentNullException(nameof(clienteRuc));
            ClienteRazonSocial = clienteRazonSocial ?? throw new ArgumentNullException(nameof(clienteRazonSocial));
            Total = total;
            EstaAnulado = false;
        }

        public void Anular()
        {
            EstaAnulado = true;
        }
    }
}
