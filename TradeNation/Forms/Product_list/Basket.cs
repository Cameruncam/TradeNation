using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using TradeNation.Classes;
using TradeNation.Client;

namespace TradeNation.Forms.Product_list
{
    public partial class Basket : Form
    {
        static string connect = ClassCnct.connection;
        SqlConnection sqlConnect = new SqlConnection(connect);
        decimal discount;
        decimal price;
        int Ee;
        int OrderID;
        int id;
        int index;
        string city;
        string street;
        string home;
        public Basket()
        {
            InitializeComponent();
        }

        class PickUpPoint
        {
            public int PointID { get; set; }
            public string PointAdress { get; set; }
            public PickUpPoint(int id, int index, string city, string street, string home)
            {
                PointID = id;
                PointAdress = Convert.ToString(index)  + " " + city + ", " + street + ", " + home;
            }
        }
        private void Basket_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = PoductList.BasketTable;
            dataGridView1.Columns[6].Visible = false;
            List<PickUpPoint> lst = new List<PickUpPoint>();
            sqlConnect.Open();
            SqlCommand ordrID = new SqlCommand();
            ordrID.CommandText = "SELECT TOP 1 * FROM [Order] ORDER BY [OrderID] DESC";
            ordrID.Connection = sqlConnect;
            SqlDataReader redr = ordrID.ExecuteReader();
            while (redr.Read())
            {
                OrderID = redr.GetInt32(0);
            }
            sqlConnect.Close();
            sqlConnect.Open();
            SqlCommand Cmb = new SqlCommand();
            Cmb.CommandText = "SELECT * FROM OrderPickupPoint";
            Cmb.Connection = sqlConnect;
            SqlDataReader rdr = Cmb.ExecuteReader();
            while(rdr.Read())
            {
                id = rdr.GetInt32(0);
                index = rdr.GetInt32(1);
                city = rdr.GetString(2);
                street = rdr.GetString(3);
                home = rdr.GetString(4);
                lst.Add(new PickUpPoint(id, index, city, street, home));
            }
            dateTimePicker1.Value = DateTime.Today;
            dateTimePicker1.MinDate = DateTime.Today;
            comboBox1.DataSource = lst;
            comboBox1.DisplayMember = "PointAdress";
            comboBox1.ValueMember = "PointID";
            sqlConnect.Close();

        }

        private void dataGridView1_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            Ee = e.RowIndex;
            if (dataGridView1.Rows[e.RowIndex].Cells[6].Value != DBNull.Value)
            {
                pictureProduct.Image = Image.FromFile($"C:\\Users\\dOb\\source\\repos\\TradeNation\\TradeNation\\Images\\ProductImage\\{Convert.ToString(dataGridView1.Rows[e.RowIndex].Cells[6].Value)}");
            }
            else
            {
                pictureProduct.Image = Image.FromFile("C:\\Users\\dOb\\source\\repos\\TradeNation\\TradeNation\\Images\\Logo and ico\\picture.png");
            }
            //Заполнение данных о товаре
            if (Convert.ToDecimal(dataGridView1.Rows[e.RowIndex].Cells[4].Value) != 0)
            {
                price = Convert.ToDecimal(dataGridView1.Rows[e.RowIndex].Cells[2].Value);
                discount = Convert.ToDecimal(dataGridView1.Rows[e.RowIndex].Cells[4].Value);
                price = price - (price * (discount / 100));
                label1.Text = "Цена: " + Convert.ToString(Math.Round(Convert.ToDecimal(dataGridView1.Rows[e.RowIndex].Cells[2].Value), 2)) + " Итог: " + Convert.ToString(Math.Round(price, 2));
            }
            else
            {
                label1.Text = "Цена: " + Convert.ToString(dataGridView1.Rows[e.RowIndex].Cells[2].Value);
            }
            label4.Text = "Название: " + Convert.ToString(dataGridView1.Rows[e.RowIndex].Cells[1].Value);
            label3.Text = "Описание: " + Convert.ToString(dataGridView1.Rows[e.RowIndex].Cells[5].Value);
            label2.Text = "Производитель: " + Convert.ToString(dataGridView1.Rows[e.RowIndex].Cells[3].Value);
            label5.Text = Convert.ToString(dataGridView1.Rows[e.RowIndex].Cells[4].Value) + "%";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            PoductList.BasketTable.Rows[Ee].Delete();
            dataGridView1.DataSource = PoductList.BasketTable;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            sqlConnect.Open();
            SqlCommand ordr = new SqlCommand();
            ordr.Connection = sqlConnect;
            ordr.CommandType = CommandType.StoredProcedure;
            ordr.CommandText = "OrderAdd";
            ordr.Parameters.AddWithValue("@OrderID", OrderID + 1);
            ordr.Parameters.AddWithValue("@OrderDate", DateTime.Today);
            ordr.Parameters.AddWithValue("@OrderDeliveryDate", dateTimePicker1.Value.Date);
            ordr.Parameters.AddWithValue("@OrderPickupPoint", comboBox1.SelectedValue);
            ordr.Parameters.AddWithValue("@OrderStatus", "Новый");
            ordr.Parameters.AddWithValue("@UserID", UsrClass.UsrID);
            try
            {
                ordr.ExecuteNonQuery();
                MessageBox.Show("Успешно");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка!: " + ex.Message);
            }
            for (int i = 0; i < dataGridView1.Rows.Count; i++)
            {
                SqlCommand ordrPrdct = new SqlCommand();
                ordrPrdct.Connection = sqlConnect;
                ordrPrdct.CommandType = CommandType.StoredProcedure;
                ordrPrdct.CommandText = "OrderProductAdd";
                ordrPrdct.Parameters.AddWithValue("@OrderID", OrderID+1); 
                ordrPrdct.Parameters.AddWithValue("@ProductArticleNumber", dataGridView1.Rows[i].Cells[0].Value); 
                ordrPrdct.Parameters.AddWithValue("@ProductQuanity", dataGridView1.Rows[i].Cells[7].Value);
                try
                {
                    ordr.ExecuteNonQuery();
                    MessageBox.Show("Успешно");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка!: " + ex.Message);
                }
            }
            sqlConnect.Close();
        }
    }
}
