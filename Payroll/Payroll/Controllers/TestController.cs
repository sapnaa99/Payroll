using System.Web.Mvc;
using  BCrypt.Net;
namespace Payroll.Controllers
{
    [AllowAnonymous]
    public class TestController : Controller
    {
        public ActionResult Test()
        {
            return View();
        }

        public ActionResult Index()
        {
            var a = HashPassword("Rosan");
            var b = ValidatePassword("Rosan", "$2a$12$N8BRniGUKSiQFQ7A0QIsn.3rhibZA/Tl4SOUP20GnFMLxDlty01/y");
            return View();
        }
        private static string GetRandomSalt()
        {
            return BCrypt.Net.BCrypt.GenerateSalt(12);
        }

        public static string HashPassword(string password)
        {
            return BCrypt.Net.BCrypt.HashPassword(password, GetRandomSalt());
        }

        public static bool ValidatePassword(string password, string correctHash)
        {
            return BCrypt.Net.BCrypt.Verify(password, correctHash);
        }
    }
}