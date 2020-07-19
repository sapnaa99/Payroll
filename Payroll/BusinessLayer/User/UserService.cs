using BusinessEntities;
using Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BusinessLayer.User
{
    public class UserService : IUserService
    {
        public ReturnMessageModel UserIns(UserModel model)
        {
            ReturnMessageModel result = new ReturnMessageModel();
            ObjectParameter returnMessage = new ObjectParameter("ReturnMessage", typeof(String));
            if (model.Password != model.PasswordConfirmation)
            {
                result.ReturnMessage = "Password does not match";
                return result;
            }

            if (model.Email != model.EmailConfirmation)
            {
                result.ReturnMessage = "Email does not match";
                return result;
            }
            model.Password = HashPassword(model.Password);
            var userInformationModel = JsonConvert.SerializeObject(model.UserInformation);
            model.UserInformation = null;
            var userModel = JsonConvert.SerializeObject(model);
            using (PayrollEntities db = new PayrollEntities())
            {
                if (model.UserId == 0)
                {
                    db.SpUserIns(userModel, userInformationModel, returnMessage);
                    result.ReturnMessage = returnMessage.Value.ToString();
                }
                else if (model.UserId > 0)
                {
                    db.SpClientUserIns(model.UserId, userModel, userInformationModel, model.UserId, returnMessage);
                    result.ReturnMessage = returnMessage.Value.ToString();
                }
                return result;
            }
        }


        private static string GetRandomSalt()
        {
            return BCrypt.Net.BCrypt.GenerateSalt(12);
        }

        public static string HashPassword(string password)
        {
            return BCrypt.Net.BCrypt.HashPassword(password, GetRandomSalt());
        }

        //public static bool ValidatePassword(string password, string correctHash)
        //{
        //    return BCrypt.Net.BCrypt.Verify(password, correctHash);
        //}


        public object UserSel(int userId)
        {
            var jsonResult = "";
            using (PayrollEntities db = new PayrollEntities())
            {
                var jsonlist = db.SpUserSel(userId).ToList();
                jsonResult = String.Join("", jsonlist.ToArray());
            }
            if (jsonResult == "")
            {
                return jsonResult;
            }
            else
            {
                return JsonConvert.DeserializeObject(jsonResult);
            }
        }
    }
}
