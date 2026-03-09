using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Helpers;
using System.Web.Script.Serialization;
using System.Web.Security;

namespace TwoTecnology.WebVentas
{
    public static class Metodos
    {
        public static string ConvertImageFileToBase64DataUri(string imagePath)
        {
            try
            {
                // 1. Read the image file into a byte array
                byte[] imageBytes = File.ReadAllBytes(imagePath);

                // 2. Convert the byte array to a Base64 string
                string base64String = Convert.ToBase64String(imageBytes);

                // 3. Determine the image format and construct the Data URI prefix
                string mimeType;
                using (Image image = Image.FromFile(imagePath))
                {
                    if (ImageFormat.Jpeg.Equals(image.RawFormat))
                    {
                        mimeType = "image/jpeg";
                    }
                    else if (ImageFormat.Png.Equals(image.RawFormat))
                    {
                        mimeType = "image/png";
                    }
                    else if (ImageFormat.Gif.Equals(image.RawFormat))
                    {
                        mimeType = "image/gif";
                    }
                    else // Default or handle other formats as needed
                    {
                        mimeType = "image/octet-stream";
                    }
                }

                // Construct the full Data URI string
                return $"data:{mimeType};base64,{base64String}";
            }
            catch (FileNotFoundException)
            {
                Console.WriteLine($"Error: Image file not found at '{imagePath}'");
                return null;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
                return null;
            }
        }
        public static void RemoveFile<T>(this List<T> list)
        {
            foreach (var item in list)
            {
                System.IO.File.Delete(item.ToString());
            }
        }

        public static bool AddIfNotExists<T>(this List<T> list, T value)
        {
            if (!list.Contains(value))
            {

                list.Add(value);
                return true;
            }
            return false;
        }
        public static int CountChar(this string text, char character)
        {
            return text.Count(c => c == character);
        }

        public static string ParsePdf(string fileName)
        {

            if (!File.Exists(fileName))
                throw new FileNotFoundException("fileName");



            using (PdfReader reader = new PdfReader(fileName))
            {
                StringBuilder sb = new StringBuilder();

                ITextExtractionStrategy strategy = new SimpleTextExtractionStrategy();
                for (int page = 0; page < reader.NumberOfPages; page++)
                {
                    string text = PdfTextExtractor.GetTextFromPage(reader, page + 1, strategy);
                    //String extractedText = PdfTextExtractor.GetTextFromPage(reader, page + 1, new LocationTextExtractionStrategy());

                    if (!string.IsNullOrEmpty(text))
                        sb.Append(Encoding.UTF8.GetString(ASCIIEncoding.Convert(Encoding.Default, Encoding.UTF8, Encoding.Default.GetBytes(text))));
                }

                return sb.ToString();
            }
        }
        public static string GetAntiXsrfToken(string pagina)
        {
            string cookieToken, formToken;
            AntiForgery.GetTokens(null, out cookieToken, out formToken);
            var responseCookie = new HttpCookie(string.Format("__AJAXAntiXsrfToken_{0}", pagina))
            {
                HttpOnly = true,
                Value = cookieToken
            };
            if (FormsAuthentication.RequireSSL && HttpContext.Current.Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            HttpContext.Current.Response.Cookies.Set(responseCookie);

            return formToken;
        }

        public static void ValidateAntiXsrfToken(string pagina)
        {
            string tokenHeader, tokenCookie;
            try
            {
                // get header token                    
                tokenHeader = HttpContext.Current.Request.Headers.Get("__RequestVerificationToken");

                // get cookie token
                var requestCookie = HttpContext.Current.Request.Cookies[string.Format("__AJAXAntiXsrfToken_{0}", pagina)];
                tokenCookie = requestCookie.Value;

                AntiForgery.Validate(tokenCookie, tokenHeader);
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.StatusCode = 403;
                HttpContext.Current.Response.End();
            }
        }
    

        public static string Serialize(this object value)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = 500000000;
            return serializer.Serialize(value);
        }

        public static string Configurate(this string value, string propiedad)
        {
            string valor = null;
            try
            {
                JArray a = JArray.Parse(value);
                valor = a.FirstOrDefault(x => x.Value<string>("nombre") == propiedad).Value<string>("valor");
            }
            catch { }

            return valor;
        }

        public static string ConverTo_YYYYMMDD(this string value)
        {
            string fechatmp = "";

            if (value == null)
                fechatmp = "";
            else
            {
                fechatmp = value;

                if (fechatmp.Length > 10) {
                    fechatmp = fechatmp.Left(10);
                }
            }

            return ((fechatmp == "") ? "" : string.Format("{0}{1}{2}", fechatmp.Substring(6), fechatmp.Substring(3, 2), fechatmp.Substring(0, 2)));
        }

        public static bool IsInyection(this string value)
        {
            bool isSQLInjection = false;

            if (value == string.Empty) { 
                return isSQLInjection;

            }
            //STARTING MOTOR GP - AIR # 7C-3372
            string[] sqlCheckList = { //"'",
                                      "--",
                                       ";--",
                                       ";",
                                       "/*",
                                       "*/",
                                       "@@",
                                       " @",
                                       " char",
                                       " nchar",
                                       " varchar",
                                       " nvarchar",
                                       " alter",
                                       " begin",
                                       " cast",
                                       " create",
                                       " cursor",
                                       " declare",
                                       " delete",
                                       " drop",
                                       " end ",
                                       " exec",
                                       " execute",
                                       " fetch",
                                        " insert",
                                        " kill",
                                        " select",
                                        " sys",
                                        " sysobjects",
                                        " syscolumns",
                                        " table",
                                        " update"
                                       };

            for (int i = 0; i <= sqlCheckList.Length - 1; i++)

            {

                if ((value.IndexOf(sqlCheckList[i], StringComparison.OrdinalIgnoreCase) >= 0))
                { 
                    isSQLInjection = true; 
                }
            }

            return isSQLInjection;
        }
 

        public static bool IsNumeric(this string value)
        {
            int resultado = 0;
            return Int32.TryParse(value, out resultado);
        }

        public static string Left(this string value, int maxLength)
        {
            if (string.IsNullOrEmpty(value)) return value;
            maxLength = Math.Abs(maxLength);

            return (value.Length <= maxLength
                   ? value
                   : value.Substring(0, maxLength)
                   );
        }


    }
}