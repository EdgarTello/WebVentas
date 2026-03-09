using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace TwoTecnology.WebVentas.Formulario.GestorDocumental
{
    public class Shared
    {
        public static void FilePdfOutAddPage(string outputFile, List<string> lista)
        {
            using (FileStream stream = new FileStream(outputFile, FileMode.Create))
            {
                using (iTextSharp.text.Document pdfDoc = new iTextSharp.text.Document(iTextSharp.text.PageSize.A4, 2, 0, 0, 0))
                {

                    using (PdfCopy pdf = new PdfCopy(pdfDoc, stream))
                    {
                        pdfDoc.Open();

                        foreach (string item in lista)
                        {
                            using (PdfReader reader = new PdfReader(item))
                            {
                                pdf.AddDocument(reader);
                            }
                        }
                    }
                }
            }
        }

        public static string GetPage(string pathfile)
        {
            PdfReader pdfReader = new PdfReader(pathfile);
            return pdfReader.NumberOfPages.ToString();
        }

        public static byte[] FileToByteArray(string fileName)
        {
            byte[] buff = null;
            FileStream fs = new FileStream(fileName,
                                           FileMode.Open,
                                           FileAccess.Read);
            BinaryReader br = new BinaryReader(fs);
            long numBytes = new FileInfo(fileName).Length;
            buff = br.ReadBytes((int)numBytes);
            return buff;
        }
    }
}