using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using BusinessLayer.Auth;
using BusinessLayer;
using BusinessEntities;

namespace Payroll.Controllers
{
    [AllowAnonymous]
    public class AuthController : Controller
    {

        [HttpGet]
        public ActionResult LogIn(string returnUrl)
        {
            var ctx = Request.GetOwinContext();
            var authManager = ctx.Authentication;

            authManager.SignOut("ApplicationCookie");
            var model = new LogInModel
            {
                ReturnUrl = returnUrl
            };

            return View(model);
        }


        [HttpPost]
        public ActionResult LogIn(LogInModel model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }


            IAuthService _ias = new AuthService();
            SpVerifyUserSel_Result isUserValidModel = _ias.VerifyUserSel(model.Email);
            SpVerifyEmployeeSel_Result isValidEmployee = _ias.verfiyEmployeeSel(model.Email);
            //User Login
            if (isUserValidModel != null)
            {
                var isPassworValid = ValidatePassword(model.Password, isUserValidModel.Password);
                // Don't do this in production!
                if (isPassworValid)
                {
                    var identity = new ClaimsIdentity(new[]
                        {
                            new Claim("DisplayName",isUserValidModel.FullName),
                            new Claim(ClaimTypes.Name, isUserValidModel.FullName),
                            new Claim(ClaimTypes.Email, isUserValidModel.Email),
                            new Claim("UserId", isUserValidModel.UserId.ToString()),
                            new Claim("ClientId", isUserValidModel.ClientId.ToString())
                        },
                        "ApplicationCookie");
                    var roles = _ias.UserRoleSel(isUserValidModel.UserId);
                    foreach (var userRole in roles)
                    {
                        identity.AddClaim(new Claim(ClaimTypes.Role, userRole.RoleName));
                    }
                    
                    //identity.AddClaim(new Claim(ClaimTypes.Role, "OmniUser"));
                    var ctx = Request.GetOwinContext();
                    var authManager = ctx.Authentication;

                    authManager.SignIn(identity);

                    return Redirect(GetRedirectUrl(model.ReturnUrl));
                }
            }

            //employee Login
            if (isValidEmployee != null)
            {
                var isPassworEmploeeValid = ValidatePassword(model.Password, isValidEmployee.Passsword);
                if (isPassworEmploeeValid)
                {
                    var identity = new ClaimsIdentity(new[]
                        {
                            new Claim("DisplayName",isValidEmployee.FullName),
                            new Claim(ClaimTypes.Name, isValidEmployee.FullName),
                            new Claim(ClaimTypes.Email, isValidEmployee.Email),
                            //new Claim("UserId", isValidEmployee.UserId.ToString()),
                             new Claim("UserId", isValidEmployee.EmployeeId.ToString()),
                            new Claim("EmployeeId", isValidEmployee.EmployeeId.ToString()),
                            new Claim("ClientId", isValidEmployee.ClientId.ToString()),
                            new Claim("CompanyId", isValidEmployee.CompanyId.ToString())
                        },
                        "ApplicationCookie");                 
                        identity.AddClaim(new Claim(ClaimTypes.Role, "Employee"));
                  

                    //identity.AddClaim(new Claim(ClaimTypes.Role, "OmniUser"));
                    var ctx = Request.GetOwinContext();
                    var authManager = ctx.Authentication;

                    authManager.SignIn(identity);

                    return Redirect(GetRedirectUrl(model.ReturnUrl));
                }
            }//Employee Login Ends Here
            

            // user authN failed
            ModelState.AddModelError("Email", "Invalid email or password Or your subscription might have ended");
            return View();
        }

        private string GetRedirectUrl(string returnUrl)
        {
            if (string.IsNullOrEmpty(returnUrl) || !Url.IsLocalUrl(returnUrl))
            {
                return Url.Action("UserSel", "User");
            }

            return returnUrl;
        }


        public ActionResult LogOut()
        {
            var ctx = Request.GetOwinContext();
            var authManager = ctx.Authentication;

            authManager.SignOut("ApplicationCookie");
            return RedirectToAction("index", "home");
        }

        private bool ValidatePassword(string password, string correctHash)
        {
            return BCrypt.Net.BCrypt.Verify(password, correctHash);
        }




    }


}