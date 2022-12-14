using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace spacemeet.Models
{
    public class User
    {
        public int Id { get; set; }
        public string email { get; set; } = string.Empty;
        public string fullName { get; set; } = string.Empty;


        public string phoneNumber { get; set; } = string.Empty;
        public string companyName { get; set; } = string.Empty;

        public byte[] passwordHash { get; set; }
        public byte[] passwordSalt { get; set; }
        public string role { get; set; } = string.Empty;
        public string address { get; set; } = string.Empty;
        public string? bvn { get; set; }
        public string? VerificationToken { get; set; }
        public DateTime? VerifiedAt { get; set; }
        public string? PasswordResetToken { get; set; }
        public DateTime? ResetTokenExpires { get; set; }


  }
}