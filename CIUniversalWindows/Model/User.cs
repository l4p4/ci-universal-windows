using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CIUniversalWindows.Model
{
    /// <summary>
    /// The User entity.
    /// </summary>
    public class User
    {
        /// <summary>
        /// The name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// The age.
        /// </summary>
        public DateTime Age { get; set; }

       override
        public string ToString()
        {
            return String.Format("My name is {0}.", Name);
        }
    }
}
