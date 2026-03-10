using System;

namespace WebVentas.Core.Application.DTOs
{
    public class AperturaCajaRequest
    {
        public int IdCaja { get; set; }
        public string Serie { get; set; }
        public string Empleado { get; set; }
        public decimal EfectivoApertura { get; set; }
    }

    public class CierreCajaRequest
    {
        public decimal EfectivoCierre { get; set; }
        public decimal TarjetaCierre { get; set; }
    }

    public class OperacionCajaDto
    {
        public int Id { get; set; }
        public int IdCaja { get; set; }
        public string Serie { get; set; }
        public string Empleado { get; set; }
        public decimal EfectivoApertura { get; set; }
        public DateTime FechaApertura { get; set; }
        public decimal? EfectivoCierre { get; set; }
        public decimal? TarjetaCierre { get; set; }
        public DateTime? FechaCierre { get; set; }
        public bool EstaAbierta { get; set; }
    }
}
