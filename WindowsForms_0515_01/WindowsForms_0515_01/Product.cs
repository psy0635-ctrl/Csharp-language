using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsForms_0515_01
{
    internal class Product
    {
        public string Name { get; set; }
        public int Price { get; set; }

        public override string ToString() => $"{Name} - {Price:No}원";
    }
}
