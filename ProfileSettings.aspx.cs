using KeysightMOR.Assets;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Web.Configuration;
using System.Security.Cryptography;

namespace KeysightMOR
{
    public partial class ProfileSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NewNameStatus.Text = null;
            NewEmailStatus.Text = null;
            oldPwStatus.Text = null;
            newPwStatus.Text = null;
            newPw2Status.Text = null;
            Session["UserID"] = 1;
            FillUserNameEmail();
        }

        protected void FillUserNameEmail()
        { 
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            using (sqlConn) 
            {
                try
                {
                    SqlCommand getUser = new SqlCommand("SELECT UserName, UserEmail FROM dbo.[User] WHERE UserID = @userid", sqlConn);
                    getUser.Parameters.AddWithValue("@userid", Session["UserID"].ToString());
                    sqlConn.Open();

                    SqlDataReader reader = getUser.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            currentname.Text = reader[0].ToString();
                            currentemail.Text = reader[1].ToString();
                        }
                    }
                }
                catch
                { 
                
                }
            }
        }

        protected void NewNameChange_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            using (sqlConn)
            {
                try
                {
                    if (!string.IsNullOrEmpty(NewName.Text))
                    {
                        SqlCommand ChangeUserName = new SqlCommand("UPDATE dbo.[User] SET UserName = @username WHERE UserID = @userid", sqlConn);
                        ChangeUserName.Parameters.AddWithValue("@username", NewName.Text);
                        ChangeUserName.Parameters.AddWithValue("@userid", Session["UserID"].ToString());

                        sqlConn.Open();
                        ChangeUserName.ExecuteNonQuery();
                        FillUserNameEmail();

                        NewNameStatus.ForeColor = System.Drawing.Color.Green;
                        NewNameStatus.Text = "UserName successfully changed";
                    }
                    else
                    {
                        NewNameStatus.ForeColor = System.Drawing.Color.Red;
                        NewNameStatus.Text = "New Name is required";
                    }
                }
                catch
                {

                }
            }               
        }

        protected void NewEmailChange_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
            using (sqlConn)
            {
                try
                {
                    if (!string.IsNullOrEmpty(NewEmail.Text))
                    {
                        SqlCommand CheckUserEmail = new SqlCommand("SELECT * FROM dbo.[User] WHERE UserEmail = @useremail", sqlConn);
                        CheckUserEmail.Parameters.AddWithValue("@useremail", NewEmail.Text);

                        sqlConn.Open();
                        SqlDataReader reader = CheckUserEmail.ExecuteReader();

                        if (reader.HasRows)
                        {
                            NewEmailStatus.ForeColor = System.Drawing.Color.Red;
                            NewEmailStatus.Text = "This email exists. Use another email";
                        }
                        else
                        {
                            SqlConnection sqlConn2 = new SqlConnection(Shared.SqlConnString);
                            using (sqlConn2)
                            {
                                try
                                {
                                    SqlCommand ChangeUserName = new SqlCommand("UPDATE dbo.[User] SET UserEmail = @useremail WHERE UserID = @userid", sqlConn2);
                                    ChangeUserName.Parameters.AddWithValue("@useremail", NewEmail.Text);
                                    ChangeUserName.Parameters.AddWithValue("@userid", Session["UserID"].ToString());

                                    sqlConn2.Open();
                                    ChangeUserName.ExecuteNonQuery();
                                    FillUserNameEmail();

                                    NewEmailStatus.ForeColor = System.Drawing.Color.Green;
                                    NewEmailStatus.Text = "UserEmail successfully changed";
                                }
                                catch 
                                { 
                                
                                }
                            }                      
                        }
                    }
                    else
                    {
                        NewEmailStatus.ForeColor = System.Drawing.Color.Red;
                        NewEmailStatus.Text = "New Email is required";
                    }
                }
                catch(Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void NewPwChange_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(oldPw.Text))
            {
                oldPwStatus.ForeColor = System.Drawing.Color.Red;
                oldPwStatus.Text = "Old Password is required";
            }

            if (string.IsNullOrEmpty(newPw.Text))
            {
                newPwStatus.ForeColor = System.Drawing.Color.Red;
                newPwStatus.Text = "New Password is required";
            }

            if (string.IsNullOrEmpty(newPw2.Text))
            {
                newPw2Status.ForeColor = System.Drawing.Color.Red;
                newPw2Status.Text = "Repeat Password is required";
            }

            if (!string.IsNullOrEmpty(newPw.Text) && !string.IsNullOrEmpty(newPw2.Text))
            {
                int result = (string.Compare(newPw.Text, newPw2.Text));

                if (result == -1) 
                { 
                   ChangePwStatus.ForeColor = System.Drawing.Color.Red;
                   ChangePwStatus.Text = "Repeat Password not match with New Password";
                }
                else if (!string.IsNullOrEmpty(oldPw.Text)) 
                {
                    SqlConnection sqlConn = new SqlConnection(Shared.SqlConnString);
                    using (sqlConn) 
                    {
                        try
                        {
                            SqlCommand checkoldpassword = new SqlCommand("SELECT * FROM dbo.[User] WHERE UserID = @userid AND Password = @password", sqlConn);
                            MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
                            Byte[] hashedBytes;
                            UTF32Encoding encoder = new UTF32Encoding();

                            hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(newPw.Text));
                            
                            checkoldpassword.Parameters.AddWithValue("@userid", Session["UserID"].ToString());
                            checkoldpassword.Parameters.AddWithValue("@password", hashedBytes);

                            sqlConn.Open();
                            SqlDataReader reader = checkoldpassword.ExecuteReader();

                            if (!reader.HasRows)
                            {
                                ChangePwStatus.ForeColor = System.Drawing.Color.Red;
                                ChangePwStatus.Text = "Incorrect old password";
                            }
                            else
                            {
                                SqlConnection sqlConn2 = new SqlConnection(Shared.SqlConnString);
                                using (sqlConn2)
                                {
                                    try
                                    {
                                        SqlCommand changepw = new SqlCommand("UPDATE dbo.[User] SET Password = @password WHERE UserID = @userid", sqlConn2);
                                        changepw.Parameters.AddWithValue("@userid", Session["UserID"].ToString());
                                        changepw.Parameters.AddWithValue("@password", hashedBytes);

                                        sqlConn2.Open();
                                        changepw.ExecuteNonQuery();
                                    }
                                    catch
                                    { 
                                    
                                    }                                
                                }
                            }
                        }
                        catch 
                        { 

                        }
                    }
                }
            }
        }

    }
}