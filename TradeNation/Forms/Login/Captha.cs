using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TradeNation.Classes;
using static System.Net.Mime.MediaTypeNames;

namespace TradeNation.Forms.Login
{
    public partial class Captha : Form
    {
        string Cap;

        public Captha()
        {
            InitializeComponent();
        }

        private void Captha_Load(object sender, EventArgs e)
        {
            //выбор рандомного изображения из папки CapthaImg
            try
            {
                string[] files = Directory.GetFiles("C:\\Users\\dOb\\source\\repos\\TradeNation\\TradeNation\\Images\\CapthaImg", "*.*", SearchOption.TopDirectoryOnly);
                Random r = new Random();
                string file = files[r.Next(0, files.Length)];
                pictureCptch.Image = System.Drawing.Image.FromFile(file);
                Cap = Path.GetFileNameWithoutExtension(file);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            if (textCptch.Text == Cap)
            {
                CapchaClass.cap = 0;
            }
            else
            {
                CapchaClass.cap = 1;
            }
            this.Close();
        }
    }
}
