using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;
using TradeNation.Classes;
using TradeNation.Forms.Product_list;

namespace TradeNation.Client
{
    public partial class PoductList : Form
    {
        static string connect = ClassCnct.connection;
        SqlConnection sqlConnect = new SqlConnection(connect);
        int RowsCount1;
        decimal price;
        static public DataTable BasketTable = new DataTable();
        decimal discount;
        int Ee;
        public PoductList()
        {
            InitializeComponent();
        }

        private void ProductList_FormClosed(object sender, FormClosedEventArgs e)
        {
            LoginForm log = new LoginForm();
            log.Show();
        }

        private void ProductList_Load(object sender, EventArgs e)
        {
            Import();
            FIOlbl.Text = UsrClass.UsrSecondName + " " + UsrClass.UsrName + " " + UsrClass.UsrPatr;
            filterBox.SelectedIndex = 0;
            RowsCount1 = PoductListView.RowCount;
            Countlbl.Text = Convert.ToString(PoductListView.RowCount) + "/" + RowsCount1;
            PoductListView.Columns[11].Visible = false;
            buttonOrder.Visible = false;
            if (UsrClass.UsrRole == 2)
            {
                buttonAdd.Visible = false;
                buttonChange.Visible = false;
                buttonDel.Visible = false;
            }
            else if(UsrClass.UsrRole == 3)
            {
                buttonAdd.Visible = false;
                buttonChange.Visible = false;
                buttonDel.Visible = false;
                buttonOrderList.Visible = false;
            }
            else
            {
            }
            BasketTable.Columns.Add("Артикль");
            BasketTable.Columns.Add("Название");
            BasketTable.Columns.Add("Цена");
            BasketTable.Columns.Add("Производитель");
            BasketTable.Columns.Add("Скидка");
            BasketTable.Columns.Add("Описание");
            BasketTable.Columns.Add("Фото");
            BasketTable.Columns.Add("Количество");
        }

        private void Import()
        {
            sqlConnect.Open();
            SqlCommand logRequst = new SqlCommand();
            logRequst.CommandText = "SELECT * FROM View_Product";
            logRequst.Connection = sqlConnect;
            SqlDataAdapter adapter = new SqlDataAdapter(logRequst);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            PoductListView.DataSource = dataSet.Tables[0];
            sqlConnect.Close();
        }

        private void PoductList_CellContextMenuStripNeeded(object sender, DataGridViewCellContextMenuStripNeededEventArgs e)
        {
            if (e.ColumnIndex != -1 && e.RowIndex != -1)
            {
                contextMenuStrip1.Show(Cursor.Position);
            }

        }

        private void PoductList_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            if (BasketTable.Rows.Count != 0)
            {
                buttonOrder.Visible = true;
            }
            Ee = e.RowIndex;
            //Звпоминание артикля
            if (PoductListView.Rows[e.RowIndex].Cells[0].Value != DBNull.Value)
            {
                SlctClass.slctProduct = Convert.ToString(PoductListView.Rows[e.RowIndex].Cells[0].Value);
            }
            else
            {

            }
            //Вставка изображения или заглушки
            if (PoductListView.Rows[e.RowIndex].Cells[11].Value != DBNull.Value)
            {
                pictureProduct.Image = Image.FromFile($"C:\\Users\\dOb\\source\\repos\\TradeNation\\TradeNation\\Images\\ProductImage\\{Convert.ToString(PoductListView.Rows[e.RowIndex].Cells[11].Value )}") ;
            }
            else
            {
                pictureProduct.Image = Image.FromFile("C:\\Users\\dOb\\source\\repos\\TradeNation\\TradeNation\\Images\\Logo and ico\\picture.png");
            }
            //Заполнение данных о товаре
            if(Convert.ToDecimal(PoductListView.Rows[e.RowIndex].Cells[8].Value) != 0)
            {
                price = Convert.ToDecimal(PoductListView.Rows[e.RowIndex].Cells[3].Value);
                discount = Convert.ToDecimal(PoductListView.Rows[e.RowIndex].Cells[8].Value);
                price = price - (price * (discount/100));
                label1.Text = "Цена: " + Convert.ToString(Math.Round(Convert.ToDecimal(PoductListView.Rows[e.RowIndex].Cells[3].Value), 2)) + " Итог: " + Convert.ToString(Math.Round(price, 2));
            }
            else
            {
                label1.Text = "Цена: " + Convert.ToString(PoductListView.Rows[e.RowIndex].Cells[3].Value);
            }
            label4.Text ="Название: " + Convert.ToString(PoductListView.Rows[e.RowIndex].Cells[1].Value);
            label3.Text ="Описание: " + Convert.ToString(PoductListView.Rows[e.RowIndex].Cells[10].Value);
            label2.Text ="Производитель: " + Convert.ToString(PoductListView.Rows[e.RowIndex].Cells[5].Value);
            label5.Text =Convert.ToString(PoductListView.Rows[e.RowIndex].Cells[8].Value) + "%";
        }

        private void textSearch_TextChanged(object sender, EventArgs e)
        {
            FilterSearch();
        }

        private void filterBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterSearch();
        }

        private void FilterSearch()
        {
            //Сортировка по клику на зоголовок столбца работает совместно с поиском и фильтром
            if (filterBox.SelectedIndex == 0)
            {
                (PoductListView.DataSource as DataTable).DefaultView.RowFilter = $"[Название] LIKE '%{textFilter.Text}%'";
            }
            //Фильтр по скидке
            else if (filterBox.SelectedIndex == 1)
            {
                (PoductListView.DataSource as DataTable).DefaultView.RowFilter = $"[Скидка] >= 0 and [Скидка] <= 10 and [Название] LIKE '%{textFilter.Text}%'";
            }
            else if (filterBox.SelectedIndex == 2)
            {
                (PoductListView.DataSource as DataTable).DefaultView.RowFilter = $"[Скидка] >= 10 and[Скидка] <= 15 and [Название] LIKE '%{textFilter.Text}%'";
            }
            else { (PoductListView.DataSource as DataTable).DefaultView.RowFilter = $"[Скидка] >= 15 and [Название] LIKE '%{textFilter.Text}%'"; }
            Countlbl.Text = Convert.ToString(PoductListView.RowCount) + "/" + RowsCount1;
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonChange_Click(object sender, EventArgs e)
        {
            ChangeProduct ch = new ChangeProduct();
            ch.ShowDialog();
        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            sqlConnect.Open();
            SqlCommand delRequst = new SqlCommand();
            delRequst.Connection = sqlConnect;
            delRequst.CommandType = CommandType.StoredProcedure;
            delRequst.CommandText = "DELETE_Product";
            delRequst.Parameters.AddWithValue("@ProductAticle", SlctClass.slctProduct);
            try
            {
                delRequst.ExecuteNonQuery();
                MessageBox.Show("Товар удален");
                sqlConnect.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка! : " + ex.Message);
                sqlConnect.Close();
            }
            FilterSearch();
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            AddProduct ad = new AddProduct();
            ad.ShowDialog();
        }

        private void PoductList_Activated(object sender, EventArgs e)
        {
            Import();
            FilterSearch();
        }

        private void добавитьКЗаказуToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BasketTable.Rows.Add(new object[] { SlctClass.slctProduct, PoductListView.Rows[Ee].Cells[1].Value, PoductListView.Rows[Ee].Cells[3].Value, PoductListView.Rows[Ee].Cells[5].Value, PoductListView.Rows[Ee].Cells[8].Value, PoductListView.Rows[Ee].Cells[10].Value, PoductListView.Rows[Ee].Cells[11].Value, 1 });
        }

        private void buttonOrder_Click(object sender, EventArgs e)
        {
            Basket bask = new Basket();
            bask.ShowDialog();
        }
    }
}
