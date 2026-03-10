using System;
using System.Threading.Tasks;
using WebVentas.Core.Domain.Interfaces;
using WebVentas.Core.Domain.Entities;
using WebVentas.Core.Application.DTOs;

namespace WebVentas.Core.Application.UseCases.Documentos
{
    public class CreateDocumentoUseCase
    {
        private readonly IDocumentoRepository _documentoRepository;

        public CreateDocumentoUseCase(IDocumentoRepository documentoRepository)
        {
            _documentoRepository = documentoRepository;
        }

        public async Task<DocumentoDto> ExecuteAsync(DocumentoDto request)
        {
            // Validaciones básicas de negocio (en un sistema real se usa FluentValidation)
            if (string.IsNullOrWhiteSpace(request.Numero)) throw new ArgumentException("El número de documento es requerido.");

            var nuevoDocumento = new Documento(
                request.Numero,
                request.Tipo,
                request.FechaEmision == default ? DateTime.UtcNow : request.FechaEmision,
                request.ClienteRuc,
                request.ClienteRazonSocial,
                request.Total
            );

            await _documentoRepository.AddAsync(nuevoDocumento);

            return new DocumentoDto
            {
                Id = nuevoDocumento.Id,
                Numero = nuevoDocumento.Numero,
                Tipo = nuevoDocumento.Tipo,
                FechaEmision = nuevoDocumento.FechaEmision,
                ClienteRuc = nuevoDocumento.ClienteRuc,
                ClienteRazonSocial = nuevoDocumento.ClienteRazonSocial,
                Total = nuevoDocumento.Total,
                Estado = "Activo"
            };
        }
    }
}
