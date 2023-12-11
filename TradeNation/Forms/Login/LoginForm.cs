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
using System.Xml;
using TradeNation.Classes;
using TradeNation.Client;
using TradeNation.Forms.Login;

namespace TradeNation
{
    public partial class LoginForm : Form
    {
        static string connect = ClassCnct.connection;
        SqlConnection sqlConnect = new SqlConnection(connect);
        int sec = 10;
        public LoginForm()
        {
            InitializeComponent();
            textBox1.Text = TradeNation.Properties.Settings.Default.LogPast;
            textBox2.Text = TradeNation.Properties.Settings.Default.PassPast;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //авторизированный вход

            //запомнить меня
            if (Rmb.Checked == true)
            {
                TradeNation.Properties.Settings.Default.PassPast = textBox2.Text;
                TradeNation.Properties.Settings.Default.Save();

                TradeNation.Properties.Settings.Default.LogPast = textBox1.Text;
                TradeNation.Properties.Settings.Default.Save();
            }
            else
            {
                TradeNation.Properties.Settings.Default.PassPast = String.Empty;
                TradeNation.Properties.Settings.Default.Save();

                TradeNation.Properties.Settings.Default.LogPast = String.Empty;
                TradeNation.Properties.Settings.Default.Save();
            }

            //функция входа
            if (textBox1.Text != ""  && textBox2.Text != "" )
            {
                try
                {
                    sqlConnect.Open();
                    SqlCommand Login = new SqlCommand();
                    Login.CommandType = CommandType.StoredProcedure;
                    Login.CommandText = "Login";
                    Login.Parameters.AddWithValue("@logins", textBox1.Text);
                    Login.Parameters.AddWithValue("@passwords", textBox2.Text);
                    Login.Connection = sqlConnect;
                    SqlDataReader sqlReader = Login.ExecuteReader();
                    sqlReader.Read();
                    if (sqlReader.HasRows)
                    {
                        int numb = sqlReader.GetInt32(6);
                        UsrClass.UsrID = sqlReader.GetInt32(0);
                        UsrClass.UsrName = sqlReader["UserName"].ToString();
                        UsrClass.UsrSecondName = sqlReader["UserSurname"].ToString();
                        UsrClass.UsrPatr = sqlReader["UserPatronymic"].ToString();
                        UsrClass.UsrRole = sqlReader.GetInt32(6);
                        sqlConnect.Close();
                        PoductList cl = new PoductList();
                        cl.Show(this);
                        this.Hide();
                    }
                    else
                    {
                        MessageBox.Show($"Неверный логин или пароль. ");
                        OpenCaptcha();
                        sqlConnect.Close();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка: " + ex.Message);
                    sqlConnect.Close();
                }
            }
            else
            {
                MessageBox.Show("Все поля должны быть заполнены");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //вход гостя
            UsrClass.UsrID = 0;
            UsrClass.UsrName = "Гость";
            UsrClass.UsrSecondName = "";
            UsrClass.UsrPatr = "";
            PoductList cl = new PoductList();
            cl.Show(this);
            this.Hide();
        }

        private void LoginForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void OpenCaptcha()
        {
            Captha c = new Captha();
            c.ShowDialog();
        }

        private void LoginForm_Activated(object sender, EventArgs e)
        {
            //проверка капчи
            if(CapchaClass.cap == 0)
            { 
            }
            else
            {
                timer1.Enabled = true;
                timer2.Enabled = true;
                textBox1.Enabled = false;
                textBox2.Enabled = false;
                button1.Enabled = false;
                button2.Enabled = false;
            }
        }

        //блокировка на 10 секунд
        private void timer1_Tick(object sender, EventArgs e)
        {
            textBox1.Enabled = true;
            textBox2.Enabled = true;
            button1.Enabled = true;
            button2.Enabled = true;
            button1.Text = "Войти";
            timer1.Enabled = false;
            timer2.Enabled = false;
        }

        //показ оставшегося времени блокировки
        private void timer2_Tick(object sender, EventArgs e)
        {
            sec -= 1;
            button1.Text = $"({sec})";
        }
    }
}
