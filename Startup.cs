using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TwoTecnology.WebVentas.Startup))]
namespace TwoTecnology.WebVentas
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
