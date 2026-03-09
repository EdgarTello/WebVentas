using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace TwoTecnology.WebVentas.Formulario.MesaPartes
{
    public class Shared
    {
        public static string GetPage(string pathfile)
        {
            PdfReader pdfReader = new PdfReader(pathfile);
            return pdfReader.NumberOfPages.ToString();
        }

        
        public static void GetTexto(string ruta, string idocumento)
        {

            using (PdfReader reader = new PdfReader(ruta))
            {
                for (int page = 1; page <= reader.NumberOfPages; page++)
                {
                    string text = PdfTextExtractor.GetTextFromPage(reader, page);

                    using (TwoTecnology.Repositorio.MPOcr doc = new TwoTecnology.Repositorio.MPOcr())
                    {
                        doc.Agregar(idocumento, page.ToString(), text);
                    }
                }
            }
        }
        public static void PdfStamp(string inputFilePath, string outputFilePath, string texto)
        {
            //string watermarkImagePath = @"D:/Projects/MaterialDetails/MaterialDetails/img/Stamp.png";

            System.Drawing.Bitmap bitmap = new System.Drawing.Bitmap(1, 1);
            System.Drawing.Font font = new System.Drawing.Font("Calibri", 10f, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Pixel);
            System.Drawing.Graphics graphics = System.Drawing.Graphics.FromImage(bitmap);
            int width = (int)graphics.MeasureString(texto, font).Width;
            int height = (int)graphics.MeasureString(texto, font).Height;
            bitmap = new System.Drawing.Bitmap(bitmap, new System.Drawing.Size(width, height));
            graphics = System.Drawing.Graphics.FromImage(bitmap);
            graphics.Clear(System.Drawing.Color.White);
            graphics.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
            graphics.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;
            graphics.DrawString(texto, font, new System.Drawing.SolidBrush(System.Drawing.Color.DarkBlue), 0, 0);
            graphics.Flush();
            //bitmap.Save(@"D:\Temporal\texto.png");
            //////////////////////////////////////////////////////////////////////////////////////////////////////////
            MemoryStream memoryStream = new MemoryStream();
            bitmap.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Png);
            var pngData = memoryStream.ToArray();
            //////////////////////////////////////////////////////////////////////////////////////////////////////////
            iTextSharp.text.Document document = new iTextSharp.text.Document();
            PdfReader pdfReader = new PdfReader(inputFilePath);
            PdfStamper pdfStamper = new PdfStamper(pdfReader, new FileStream(outputFilePath, FileMode.Create, FileAccess.Write, FileShare.None));
            iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(pngData);
            //img.SetAbsolutePosition(480, 760);
            img.SetAbsolutePosition(pdfReader.GetPageSize(1).Width - 100, pdfReader.GetPageSize(1).Height - 15);
            PdfContentByte waterMark;

            for (int pageIndex = 1; pageIndex <= pdfReader.NumberOfPages; pageIndex++)
            {
                waterMark = pdfStamper.GetOverContent(pageIndex);
                waterMark.AddImage(img);
            }
            pdfStamper.FormFlattening = true;
            pdfStamper.Close();
            //////////////////////////////////////////////////////////////////////////////////////////////////////////
        }
        public static decimal ConvertBytesToMegabytes(long bytes)
        {
            return Math.Round(Convert.ToDecimal((bytes / 1024f) / 1024f), 6);
        }
    }
}