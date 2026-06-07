namespace WindowsForms_0605_02
{
    partial class Form1
    {
        /// <summary>
        /// 필수 디자이너 변수입니다.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 사용 중인 모든 리소스를 정리합니다.
        /// </summary>
        /// <param name="disposing">관리되는 리소스를 삭제해야 하면 true이고, 그렇지 않으면 false입니다.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form 디자이너에서 생성한 코드

        /// <summary>
        /// 디자이너 지원에 필요한 메서드입니다. 
        /// 이 메서드의 내용을 코드 편집기로 수정하지 마세요.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnB_Forward = new System.Windows.Forms.Button();
            this.btnB_Backward = new System.Windows.Forms.Button();
            this.btnC_Forward = new System.Windows.Forms.Button();
            this.btnC_Backward = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnB_Forward
            // 
            this.btnB_Forward.Location = new System.Drawing.Point(99, 240);
            this.btnB_Forward.Name = "btnB_Forward";
            this.btnB_Forward.Size = new System.Drawing.Size(75, 23);
            this.btnB_Forward.TabIndex = 0;
            this.btnB_Forward.Text = "B 전진";
            this.btnB_Forward.UseVisualStyleBackColor = true;
            this.btnB_Forward.Click += new System.EventHandler(this.btnB_Forward_Click);
            // 
            // btnB_Backward
            // 
            this.btnB_Backward.Location = new System.Drawing.Point(237, 240);
            this.btnB_Backward.Name = "btnB_Backward";
            this.btnB_Backward.Size = new System.Drawing.Size(75, 23);
            this.btnB_Backward.TabIndex = 1;
            this.btnB_Backward.Text = "B 후진";
            this.btnB_Backward.UseVisualStyleBackColor = true;
            this.btnB_Backward.Click += new System.EventHandler(this.btnB_Backward_Click);
            // 
            // btnC_Forward
            // 
            this.btnC_Forward.Location = new System.Drawing.Point(99, 309);
            this.btnC_Forward.Name = "btnC_Forward";
            this.btnC_Forward.Size = new System.Drawing.Size(75, 23);
            this.btnC_Forward.TabIndex = 2;
            this.btnC_Forward.Text = "C 전진";
            this.btnC_Forward.UseVisualStyleBackColor = true;
            this.btnC_Forward.Click += new System.EventHandler(this.btnC_Forward_Click);
            // 
            // btnC_Backward
            // 
            this.btnC_Backward.Location = new System.Drawing.Point(237, 309);
            this.btnC_Backward.Name = "btnC_Backward";
            this.btnC_Backward.Size = new System.Drawing.Size(75, 23);
            this.btnC_Backward.TabIndex = 3;
            this.btnC_Backward.Text = "C 후진";
            this.btnC_Backward.UseVisualStyleBackColor = true;
            this.btnC_Backward.Click += new System.EventHandler(this.btnC_Backward_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnC_Backward);
            this.Controls.Add(this.btnC_Forward);
            this.Controls.Add(this.btnB_Backward);
            this.Controls.Add(this.btnB_Forward);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnB_Forward;
        private System.Windows.Forms.Button btnB_Backward;
        private System.Windows.Forms.Button btnC_Forward;
        private System.Windows.Forms.Button btnC_Backward;
    }
}

