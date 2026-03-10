using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using WebVentas.Core.Infrastructure.Data;
using WebVentas.Core.Domain.Interfaces;
using WebVentas.Core.Infrastructure.Repositories;
using WebVentas.Core.Application.UseCases.Documentos;
using WebVentas.Core.Application.Interfaces;
using WebVentas.Core.Infrastructure.Services;
using WebVentas.Core.Application.UseCases.Auth;
using WebVentas.Core.Application.UseCases.Caja;
using WebVentas.Core.Application.UseCases.Pos;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Configuracion EF Core en memoria para PoC
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseInMemoryDatabase("WebVentasPoCDb"));

// Dependencias de Infraestructura (Persistencia y Servicios Externos)
builder.Services.AddScoped<IDocumentoRepository, DocumentoRepository>();
builder.Services.AddScoped<IOperacionCajaRepository, OperacionCajaRepository>();
builder.Services.AddScoped<ISapSyncService, SapSyncService>();
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IVentaPosRepository, VentaPosRepository>();

// Dependencias de Aplicación (Casos de Uso Documentos)
builder.Services.AddScoped<GetDocumentoByIdUseCase>();
builder.Services.AddScoped<GetAllDocumentosUseCase>();
builder.Services.AddScoped<CreateDocumentoUseCase>();
builder.Services.AddScoped<UpdateDocumentoUseCase>();
builder.Services.AddScoped<DeleteDocumentoUseCase>();
builder.Services.AddScoped<AnularDocumentoUseCase>();
builder.Services.AddScoped<SyncDocumentoToErpUseCase>();

// Dependencias de Aplicación (Casos de Uso Auth)
builder.Services.AddScoped<LoginUseCase>();

// Dependencias de Aplicación (Casos de Uso Caja)
builder.Services.AddScoped<AperturarCajaUseCase>();
builder.Services.AddScoped<CerrarCajaUseCase>();
builder.Services.AddScoped<GetOperacionesCajaUseCase>();
builder.Services.AddScoped<RegistrarVentaPosUseCase>();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();

app.Run();
