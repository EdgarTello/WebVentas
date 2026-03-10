using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using System.Collections.Generic;
using WebVentas.Core.Application.DTOs;
using WebVentas.Core.Application.UseCases.Documentos;

namespace WebVentas.Core.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DocumentosController : ControllerBase
    {
        private readonly GetDocumentoByIdUseCase _getDocumentoByIdUseCase;
        private readonly GetAllDocumentosUseCase _getAllDocumentosUseCase;
        private readonly CreateDocumentoUseCase _createDocumentoUseCase;
        private readonly DeleteDocumentoUseCase _deleteDocumentoUseCase;
        private readonly AnularDocumentoUseCase _anularDocumentoUseCase;
        private readonly UpdateDocumentoUseCase _updateDocumentoUseCase;
        private readonly SyncDocumentoToErpUseCase _syncDocumentoToErpUseCase;

        // Inyección de todos los casos de uso
        public DocumentosController(
            GetDocumentoByIdUseCase getDocumentoByIdUseCase,
            GetAllDocumentosUseCase getAllDocumentosUseCase,
            CreateDocumentoUseCase createDocumentoUseCase,
            DeleteDocumentoUseCase deleteDocumentoUseCase,
            AnularDocumentoUseCase anularDocumentoUseCase,
            UpdateDocumentoUseCase updateDocumentoUseCase,
            SyncDocumentoToErpUseCase syncDocumentoToErpUseCase)
        {
            _getDocumentoByIdUseCase = getDocumentoByIdUseCase;
            _getAllDocumentosUseCase = getAllDocumentosUseCase;
            _createDocumentoUseCase = createDocumentoUseCase;
            _deleteDocumentoUseCase = deleteDocumentoUseCase;
            _anularDocumentoUseCase = anularDocumentoUseCase;
            _updateDocumentoUseCase = updateDocumentoUseCase;
            _syncDocumentoToErpUseCase = syncDocumentoToErpUseCase;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<DocumentoDto>>> GetAll()
        {
            var documentos = await _getAllDocumentosUseCase.ExecuteAsync();
            return Ok(documentos);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var documento = await _getDocumentoByIdUseCase.ExecuteAsync(id);
            if (documento == null) return NotFound();

            return Ok(documento);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] DocumentoDto request)
        {
            try
            {
                var nuevoDocumento = await _createDocumentoUseCase.ExecuteAsync(request);
                return CreatedAtAction(nameof(GetById), new { id = nuevoDocumento.Id }, nuevoDocumento);
            }
            catch (System.Exception ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] DocumentoDto request)
        {
            try
            {
                await _updateDocumentoUseCase.ExecuteAsync(id, request);
                return NoContent();
            }
            catch (System.NotImplementedException ex)
            {
                return StatusCode(501, new { Error = ex.Message });
            }
            catch (System.Exception ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                await _deleteDocumentoUseCase.ExecuteAsync(id);
                return NoContent();
            }
            catch (System.Exception ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
        }

        [HttpPatch("{id}/anular")]
        public async Task<IActionResult> Anular(int id)
        {
            try
            {
                await _anularDocumentoUseCase.ExecuteAsync(id);
                return NoContent();
            }
            catch (System.Exception ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
        }

        [HttpPost("{id}/sync-sap")]
        public async Task<IActionResult> SyncSap(int id)
        {
            try
            {
                var result = await _syncDocumentoToErpUseCase.ExecuteAsync(id);
                return Ok(new { Success = result, Message = "Sincronización SAP exitosa." });
            }
            catch (System.Exception ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
        }
    }
}
