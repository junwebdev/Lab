using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MVC_Login_System.Startup))]
namespace MVC_Login_System
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
