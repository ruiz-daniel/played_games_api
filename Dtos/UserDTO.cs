using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DRG_Api.Dtos
{
    public class UserDTO
    {
        public UserDTO(string username, string display_name)
        {
            this.username = username;
            this.display_name = display_name;
        }
        
        public string username {get; set;}
        public string display_name {get; set;}
    }
}