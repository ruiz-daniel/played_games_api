using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DRG_Api.Dtos
{
    public class UserDTO
    {
        public UserDTO(
            string username,
            string display_name,
            string userid,
            string access_token
        )
        {
            this.username = username;
            this.display_name = display_name;
            this.userid = userid;
            this.access_token = access_token;
        }

        public string username { get; set; }

        public string display_name { get; set; }

        public string userid { get; set; }

        public string access_token { get; set; }
    }
}
