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

// Configuracion EF Core
var connectionString = builder.Configuration.GetConnectionString("WebVentas.Core") ?? throw new InvalidOperationException("Connection string 'WebVentas.Core' not found.");
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(connectionString));

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

// Siempre activar Swagger en entorno local de pruebas
app.UseSwagger();
app.UseSwaggerUI();

// Redirigir el trafico de la raiz hacia la interfaz de Swagger para evitar página vacía
app.MapGet("/", context => {
    context.Response.Redirect("/swagger");
    return Task.CompletedTask;
});

// app.UseHttpsRedirection(); // Comentado para prevenir error Failed to determine https port
app.UseAuthorization();
app.MapControllers();

app.Run();
