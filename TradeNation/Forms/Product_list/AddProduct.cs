using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TradeNation.Classes;

namespace TradeNation.Forms.Product_list
{
    public partial class AddProduct : Form
    {
        static string connect = ClassCnct.connection;
        SqlConnection sqlConnect = new SqlConnection(connect);
        public AddProduct()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //проверка артикля в базе данных
            sqlConnect.Open();
            SqlCommand comand = new SqlCommand($"Select * from Product Where ProductArticleNumber = '{TBArticle.Text}'");
            comand.Connection = sqlConnect;
            SqlDataReader sqlReader = comand.ExecuteReader();
            sqlReader.Read();
            if (sqlReader.HasRows)
            {
                MessageBox.Show("Товар с таким артиклем уже существует!");
                sqlConnect.Close();
            }
            else
            {
                //добавление товара в базу данных
                sqlConnect.Open();
                SqlCommand chProduct = new SqlCommand();
                chProduct.Connection = sqlConnect;
                chProduct.CommandType = CommandType.StoredProcedure;
                chProduct.CommandText = "Add_Product";
                chProduct.Parameters.AddWithValue("@ProductArticleNumber", TBArticle.Text); ;
                chProduct.Parameters.AddWithValue("@ProductName", TBName.Text); ;
                chProduct.Parameters.AddWithValue("@ProductUnit", TBUnit.Text); ;
                chProduct.Parameters.AddWithValue("@ProductCost", Convert.ToDecimal(TBCost.Text)); ;
                chProduct.Parameters.AddWithValue("@ProductDiscountAmount", Convert.ToInt16(TBDiscAm.Text)); ;
                chProduct.Parameters.AddWithValue("@ProductManufacturer", TBMnfct.Text); ;
                chProduct.Parameters.AddWithValue("@ProductProvider", TBPrvdr.Text); ;
                chProduct.Parameters.AddWithValue("@ProductCategory", TBCategory.Text); ;
                chProduct.Parameters.AddWithValue("@ProductCurrentDiscount", Convert.ToInt32(TBCurDisc.Text)); ;
                chProduct.Parameters.AddWithValue("@ProductQuantityInStock", Convert.ToInt32(TBStock.Text)); ;
                chProduct.Parameters.AddWithValue("@ProductDescription", TBDesc.Text); ;
                try
                {
                    chProduct.ExecuteNonQuery();
                    MessageBox.Show("Продукт добавлен");

                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка!: " + ex.Message);
                }
                sqlConnect.Close();
                this.Close();
            }
        }
    }
}
