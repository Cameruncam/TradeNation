namespace TradeNation.Forms.Login
{
    partial class Captha
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.CpcthButton = new System.Windows.Forms.Button();
            this.textCptch = new System.Windows.Forms.TextBox();
            this.pictureCptch = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureCptch)).BeginInit();
            this.SuspendLayout();
            // 
            // CpcthButton
            // 
            this.CpcthButton.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(204)))), ((int)(((byte)(102)))), ((int)(((byte)(0)))));
            this.CpcthButton.ForeColor = System.Drawing.Color.White;
            this.CpcthButton.Location = new System.Drawing.Point(147, 255);
            this.CpcthButton.Margin = new System.Windows.Forms.Padding(4);
            this.CpcthButton.Name = "CpcthButton";
            this.CpcthButton.Size = new System.Drawing.Size(100, 32);
            this.CpcthButton.TabIndex = 5;
            this.CpcthButton.Text = "Проверить";
            this.CpcthButton.UseVisualStyleBackColor = false;
            this.CpcthButton.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // textCptch
            // 
            this.textCptch.Location = new System.Drawing.Point(14, 206);
            this.textCptch.Margin = new System.Windows.Forms.Padding(4);
            this.textCptch.Name = "textCptch";
            this.textCptch.Size = new System.Drawing.Size(367, 26);
            this.textCptch.TabIndex = 4;
            // 
            // pictureCptch
            // 
            this.pictureCptch.Location = new System.Drawing.Point(14, 15);
            this.pictureCptch.Margin = new System.Windows.Forms.Padding(4);
            this.pictureCptch.Name = "pictureCptch";
            this.pictureCptch.Size = new System.Drawing.Size(367, 182);
            this.pictureCptch.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureCptch.TabIndex = 3;
            this.pictureCptch.TabStop = false;
            // 
            // Captha
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 18F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(394, 303);
            this.Controls.Add(this.CpcthButton);
            this.Controls.Add(this.textCptch);
            this.Controls.Add(this.pictureCptch);
            this.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Captha";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Капча";
            this.Load += new System.EventHandler(this.Captha_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureCptch)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button CpcthButton;
        private System.Windows.Forms.TextBox textCptch;
        private System.Windows.Forms.PictureBox pictureCptch;
    }
}