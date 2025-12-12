using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OnTapTMDT
{
    public class Connection : System.Web.UI.Page
    {
        private SqlConnection connection;
        private string connectionString;

        private void OpenConnection()
        {
            connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\OnTapTMDT\OnTapTMDT\App_Data\DonHang.mdf;Integrated Security=True";
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
        // dùng cho getALl
        public DataTable getData(string query)
        {
            try
            {
                OpenConnection();
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                adapter.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Lỗi: {ex.Message}');</script>");
                return null;
            }
            finally
            {
                CloseConnection();
            }
        }
        // dùng cho get khi WHere
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
                Response.Write($"<script>alert('Lỗi: {ex.Message}');</script>");
                return null;
            }
            finally
            {
                CloseConnection();
            }

        }

        public int Create_Update_Delete(string query, Dictionary<string, object> parameters = null)
        {
            try
            {
                OpenConnection();
                SqlCommand command = new SqlCommand(query, connection);
                if (parameters != null)
                {
                    foreach (var param in parameters)
                        command.Parameters.AddWithValue(param.Key, param.Value ?? DBNull.Value);
                }
                return command.ExecuteNonQuery();
            }
            catch (Exception ex) {
                Response.Write($"<script>alert('Lỗi: {ex.Message}');</script>");
                return 0;
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
                Response.Write($"<script>alert('Lỗi: {ex.Message}');</script>");
                return 0;
            }
            finally
            {
                CloseConnection();
            }
        }
    }
}