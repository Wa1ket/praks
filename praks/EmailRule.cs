using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Windows.Controls;

namespace praks_validation_rules
{
    internal class EmailRule : ValidationRule
    {
        public override ValidationResult Validate(object value, System.Globalization.CultureInfo cultureInfo)
        {
            string email = string.Empty;
            if (value == null)
            {
                email = value.ToString();
            }
            else
            
                return new ValidationResult(false, "Адрес электронной почты не задан");
                if(email.Contains("@") && email.Contains("."))
                {
                    return new ValidationResult(true, null);
                }
                else
                {
                    return new ValidationResult(false, "Адрес электронной почты должен содержать символы @ и (.)");
                }
            
        }
    }
}
