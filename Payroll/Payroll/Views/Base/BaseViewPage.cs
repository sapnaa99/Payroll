using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;

namespace Payroll.Views.Base
{
    public abstract class BaseViewPage<TModel> : WebViewPage<TModel>
    {
        protected AppUser CurrentUser
        {
            get { return new AppUser(this.User as ClaimsPrincipal); }
        }
    }
    public abstract class BaseViewPage : BaseViewPage<dynamic>
    {
    }
}