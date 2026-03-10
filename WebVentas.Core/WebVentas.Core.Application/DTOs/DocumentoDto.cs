using System;

namespace WebVentas.Core.Application.DTOs
{
    public class DocumentoDto
    {
        public int Id { get; set; }
        public string Numero { get; set; }
        public string Tipo { get; set; }
        public DateTime FechaEmision { get; set; }
        public string ClienteRuc { get; set; }
        public string ClienteRazonSocial { get; set; }
        public decimal Total { get; set; }
        public string Estado { get; set; }
    }
}
