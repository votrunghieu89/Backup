using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace TMDT22_9_2025.TMDT_Lazada._17_11_2025
{
    public class Connection : System.Web.UI.Page
    { 


        private SqlConnection connection;   // biến toàn cục
        private string connectionString;
        private void OpenConnection()
        {
            string path = Server.MapPath("~/App_Data/Database1.mdf");

            connectionString =
                $@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename={path};Integrated Security=True";
            if (connection == null)
            {
                connection = new SqlConnection(connectionString);
            }

            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
        }

        // ĐÓNG CONNECTION
        private void CloseConnection()
        {
            if (connection != null && connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }

        public DataTable getData(string SQL)
        {
            try
            {
                OpenConnection();
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(SQL,connection);
                adapter.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi khi lấy dữ liệu: " + ex.Message);
            }
            finally
            {
                CloseConnection();
            }
        }

        public DataTable getDataParameter(string SQL, List<SqlParameter> parameters)
        {
            try
            {
                OpenConnection();
                DataTable dt = new DataTable();
                using (SqlCommand command = new SqlCommand(SQL, connection))
                {
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters.ToArray());
                    }
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(dt);
                }
                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi khi lấy dữ liệu: " + ex.Message);
            }
            finally
            {
                CloseConnection();
            }
        }
    }
}