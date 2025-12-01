using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace VoTrungHieu_0216.Connection
{
    public class SQLFuntion : System.Web.UI.Page
    {
        private SqlConnection connection;
        private string connectionString;

        private void OpenConnection()
        {
            connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\VoTrungHieu_0216\VoTrungHieu_0216\App_Data\XayDung.mdf;Integrated Security=True";
             if (connection == null)
            {
                connection = new SqlConnection(connectionString);
            }

            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
        }
        private void CloseConnection()
        {
            if (connection != null && connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }

        public DataTable getData(string query)
        {
            try
            {
                OpenConnection();
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                return dataTable;

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
        public int getValue(string query)
        {
            try
            {
                DataTable dt = getData(query);

                if (dt.Rows.Count > 0 && dt.Rows[0][0] != DBNull.Value)
                    return Convert.ToInt32(dt.Rows[0][0]);

                return 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi khi lấy dữ liệu: " + ex.Message);
            }
        }
    }
}