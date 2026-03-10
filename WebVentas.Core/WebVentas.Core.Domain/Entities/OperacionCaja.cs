using System;

namespace WebVentas.Core.Domain.Entities
{
    public class OperacionCaja
    {
        public int Id { get; private set; }
        public int IdCaja { get; private set; }
        public string Serie { get; private set; }
        public string Empleado { get; private set; }
        public decimal EfectivoApertura { get; private set; }
        public DateTime FechaApertura { get; private set; }
        public decimal? EfectivoCierre { get; private set; }
        public decimal? TarjetaCierre { get; private set; }
        public DateTime? FechaCierre { get; private set; }
        public bool EstaAbierta { get; private set; }

        public OperacionCaja(int idCaja, string serie, string empleado, decimal efectivoApertura)
        {
            IdCaja = idCaja;
            Serie = serie ?? throw new ArgumentNullException(nameof(serie));
            Empleado = empleado ?? throw new ArgumentNullException(nameof(empleado));
            EfectivoApertura = efectivoApertura;
            FechaApertura = DateTime.UtcNow;
            EstaAbierta = true;
        }

        // Required for EF Core mapping
        protected OperacionCaja() { }

        public void Cerrar(decimal efectivoCierre, decimal tarjetaCierre)
        {
            if (!EstaAbierta)
            {
                throw new InvalidOperationException("La caja ya se encuentra cerrada.");
            }

            EfectivoCierre = efectivoCierre;
            TarjetaCierre = tarjetaCierre;
            FechaCierre = DateTime.UtcNow;
            EstaAbierta = false;
        }
    }
}
