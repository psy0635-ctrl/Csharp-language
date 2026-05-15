using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsForms_0515_02
{
    internal class CartItem
    {
        public string Name { get; set; }
        public int Price { get; set; }
        public int Qty { get; set; }
        public int Total => Price * Qty;
    }
}
