using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiNhaHang.ENTITY
{
    class Bill
    {
        private int id;
        private int idTable;
        private DateTime dateCheckin;
        private int status;
        private int total;

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public int IdTable
        {
            get
            {
                return idTable;
            }

            set
            {
                idTable = value;
            }
        }

        public DateTime DateCheckin
        {
            get
            {
                return dateCheckin;
            }

            set
            {
                dateCheckin = value;
            }
        }

        public int Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }

        public int Total
        {
            get
            {
                return total;
            }

            set
            {
                total = value;
            }
        }
    }
}
