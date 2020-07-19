using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.User
{
    public interface IUserService
    {
        ReturnMessageModel UserIns(UserModel model);
        object UserSel(int userId);
    }
}
