using Microsoft.EntityFrameworkCore;
using WebVentas.Core.Domain.Entities;

namespace WebVentas.Core.Infrastructure.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<Documento> Documentos { get; set; }
        public DbSet<OperacionCaja> OperacionesCaja { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Fluent API Configuración para la entidad Documento
            modelBuilder.Entity<Documento>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Numero).IsRequired().HasMaxLength(50);
                entity.Property(e => e.Tipo).IsRequired().HasMaxLength(20);
                entity.Property(e => e.ClienteRuc).IsRequired().HasMaxLength(11);
                entity.Property(e => e.ClienteRazonSocial).IsRequired().HasMaxLength(200);
                entity.Property(e => e.Total).HasColumnType("decimal(18,2)");
            });
            modelBuilder.Entity<OperacionCaja>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Serie).IsRequired();
                entity.Property(e => e.Empleado).IsRequired();
                entity.Property(e => e.EfectivoApertura).HasColumnType("decimal(18,2)");
                entity.Property(e => e.EfectivoCierre).HasColumnType("decimal(18,2)").IsRequired(false);
                entity.Property(e => e.TarjetaCierre).HasColumnType("decimal(18,2)").IsRequired(false);
            });
        }
    }
}
