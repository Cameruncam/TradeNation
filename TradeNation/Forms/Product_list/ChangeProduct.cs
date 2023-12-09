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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Xml.Linq;
using TradeNation.Classes;

namespace TradeNation.Forms.Product_list
{
    public partial class ChangeProduct : Form
    {
        static string connect = ClassCnct.connection;
        SqlConnection sqlConnect = new SqlConnection(connect);
        public ChangeProduct()
        {
            InitializeComponent();
        }

        private void ChangeProduct_Load(object sender, EventArgs e)
        {
            sqlConnect.Open();
            SqlCommand comand = new SqlCommand($"Select * from Product Where ProductArticleNumber = '{SlctClass.slctProduct}'");
            comand.Connection = sqlConnect;
            SqlDataReader read = comand.ExecuteReader();
            while (read.Read())
            {
                TBArticle.Text = read["ProductArticleNumber"].ToString();
                TBName.Text = read["ProductName"].ToString();
                TBUnit.Text = read["ProductUnit"].ToString();
                TBCost.Text = read["ProductCost"].ToString();
                TBDiscAm.Text = read["ProductDiscountAmount"].ToString();
                TBMnfct.Text = read["ProductManufacturer"].ToString();
                TBPrvdr.Text = read["ProductProvider"].ToString();
                TBCategory.Text = read["ProductCategory"].ToString();
                TBCurDisc.Text = read["ProductCurrentDiscount"].ToString();
                TBStock.Text = read["ProductQuantityInStock"].ToString();
                TBDesc.Text = read["ProductDescription"].ToString();
            }
            sqlConnect.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            sqlConnect.Open();
            SqlCommand chProduct = new SqlCommand();
            chProduct.Connection = sqlConnect;
            chProduct.CommandType = CommandType.StoredProcedure;
            chProduct.CommandText = "Change_Product";
            chProduct.Parameters.AddWithValue("@ProductArticleNumber", TBArticle.Text);;
            chProduct.Parameters.AddWithValue("@ProductName", TBName.Text);;
            chProduct.Parameters.AddWithValue("@ProductUnit", TBUnit.Text);;
            chProduct.Parameters.AddWithValue("@ProductCost", Convert.ToDecimal(TBCost.Text));;
            chProduct.Parameters.AddWithValue("@ProductDiscountAmount", Convert.ToInt16(TBDiscAm.Text));;
            chProduct.Parameters.AddWithValue("@ProductManufacturer", TBMnfct.Text);;
            chProduct.Parameters.AddWithValue("@ProductProvider", TBPrvdr.Text);;
            chProduct.Parameters.AddWithValue("@ProductCategory", TBCategory.Text);;
            chProduct.Parameters.AddWithValue("@ProductCurrentDiscount", Convert.ToInt32(TBCurDisc.Text));;
            chProduct.Parameters.AddWithValue("@ProductQuantityInStock", Convert.ToInt32(TBStock.Text));;
            chProduct.Parameters.AddWithValue("@ProductDescription", TBDesc.Text);;
            try
            {
                chProduct.ExecuteNonQuery();
                MessageBox.Show("Данные продукта изменены");

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
