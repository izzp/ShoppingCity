using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace ShoppingCity
{
    public class SQLHelper
    {
        /// <summary>
        /// 管理员登录
        /// </summary>
        /// <param name="AdminName">用户名</param>
        /// <param name="AdminPwd">密码</param>
        /// <returns></returns>
        public bool AdminLogin(string AdminName,string AdminPwd)
        {
            SqlParameter[] parameters = { 
                new SqlParameter("@AdminName",SqlDbType.NVarChar,50),
                new SqlParameter("@AdminPwd",SqlDbType.NVarChar,50)};
            parameters[0].Value = AdminName;
            parameters[1].Value = AdminPwd;
            DataSet ds = SelectToDS("GetAdminByNamePwd", CommandType.StoredProcedure, parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="AdminName">用户名</param>
        /// <param name="AdminPwd">密码</param>
        /// <returns></returns>
        public DataSet UserLogin(string AdminName, string AdminPwd)
        {
            SqlParameter[] parameters = { 
                new SqlParameter("@UserName",SqlDbType.NVarChar,30),
                new SqlParameter("@UserPwd",SqlDbType.NVarChar,30)};
            parameters[0].Value = AdminName;
            parameters[1].Value = AdminPwd;
            DataSet ds = SelectToDS("GetUserByNamePwd", CommandType.StoredProcedure, parameters);
            return ds;
        }

        /// <summary>
        /// 查询管理员是否存在
        /// </summary>
        /// <param name="AdminName">用户名</param>
        /// <param name="AdminPwd">密码</param>
        /// <returns></returns>
        public bool SelectAdmin(string AdminName)
        {
            SqlParameter[] parameters = { 
                new SqlParameter("@AdminName",SqlDbType.NVarChar,50)};
            parameters[0].Value = AdminName;
            DataSet ds = SelectToDS("GetAdminByName", CommandType.StoredProcedure, parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 返回指定ID信息
        /// </summary>
        /// <param name="AdminName">管理员名称</param>
        /// <returns></returns>
        public DataSet SelectAdmin(int AdminID)
        {
            SqlParameter[] parameters = { 
                new SqlParameter("@AdminID",SqlDbType.Int)};
            parameters[0].Value = AdminID;
            DataSet ds = SelectToDS("GetAdminByID", CommandType.StoredProcedure, parameters);
            return ds;
        }

        /// <summary>
        /// 添加管理员
        /// </summary>
        /// <param name="AdminName">管理员名称</param>
        /// <param name="AdminPwd">管理员密码</param>
        /// <param name="AdminType">管理员类型</param>
        /// <returns></returns>
        public bool AddAdmin(string AdminName,string AdminPwd,int AdminType)
        {
            SqlParameter[] parameters = { 
                new SqlParameter("@AdminName",SqlDbType.NVarChar,50),
                new SqlParameter("@AdminPwd",SqlDbType.NVarChar,50),
                new SqlParameter("@AdminType",SqlDbType.Int)};
            parameters[0].Value=AdminName;
            parameters[1].Value=AdminPwd;
            parameters[2].Value = AdminType;
            int rows = ExecuteSql("InsertAdmin", CommandType.StoredProcedure, parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 更改Admin
        /// </summary>
        /// <param name="AdminName"></param>
        /// <param name="AdminPwd"></param>
        /// <param name="AdminType"></param>
        /// <returns></returns>
        public bool UpdateAdmin(string AdminName, string AdminPwd, int AdminType)
        {
            SqlParameter[] parameters = { 
                new SqlParameter("@AdminName",SqlDbType.NVarChar,50),
                new SqlParameter("@AdminPwd",SqlDbType.NVarChar,50),
                new SqlParameter("@AdminType",SqlDbType.Int)};
            parameters[0].Value = AdminName;
            parameters[1].Value = AdminPwd;
            parameters[2].Value = AdminType;
            int rows = ExecuteSql("UpdateAdmin", CommandType.StoredProcedure, parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 获取购物车ID
        /// </summary>
        /// <param name="uID">用户ID</param>
        /// <returns></returns>
        public int getCarIdByUid(int uID)
        {
            SqlParameter[] parameters = { 
                new SqlParameter("@uID",SqlDbType.Int,4)};
            parameters[0].Value = uID;
            int scID = (int)(SelectToDS("upGetScidByUid", CommandType.StoredProcedure, parameters).Tables[0].Rows[0][0]);
            return scID;
        }

        /// <summary>
        /// 添加商品到购物车
        /// </summary>
        /// <param name="scID">购物车ID</param>
        /// <param name="gdID">商品ID</param>
        public void AddGoodsToCar(int scID, int gdID)
        {
            SqlParameter[] parameters = { 
                new SqlParameter("@scID",SqlDbType.Int),
                new SqlParameter("@gdID",SqlDbType.Int),
                new SqlParameter("@num",1)};
            parameters[0].Value=scID;
            parameters[1].Value=gdID;
            ExecuteSql("upAddGoodsToCar",CommandType.StoredProcedure,parameters);
        }

        /// <summary>
        /// 根据购物车编号清空购物车
        /// </summary>
        /// <param name="scID">购物车编号</param>
        public bool ClearCarByScid(int scID)
        {
            SqlParameter[] parameters = { 
                new SqlParameter("@scID",SqlDbType.Int)};
            parameters[0].Value = scID;
            int rows=ExecuteSql("upClearCarByScid", CommandType.StoredProcedure, parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }



        #region 访问数据库操作
        static string connStr;
        public SQLHelper()
        {
            connStr = System.Configuration.ConfigurationManager.ConnectionStrings["SMDB"].ToString();
        }
        /// <summary>
        /// 初始化sqlcommand
        /// </summary>
        /// <param name="comm">sqlcommand</param>
        /// <param name="conn">连接connection</param>
        /// <param name="sql">命令字符串</param>
        /// <param name="comType">解释命令字符串</param>
        /// <param name="comParms">数据库参数列表</param>
        private static void PrepareCommand(SqlCommand comm, SqlConnection conn, string sql, CommandType comType, SqlParameter[] comParms)
        {
            if (conn.State != ConnectionState.Open)
            {
                try
                {
                    conn.Open();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            comm.Connection = conn;
            comm.CommandText = sql;
            comm.CommandType = comType;
            if (comParms != null)
            {
                foreach (SqlParameter p in comParms)
                {
                    comm.Parameters.Add(p);
                }
            }
        }

        /// <summary>
        /// 读取数据库到DataSet
        /// </summary>
        /// <param name="sql">命令字符串</param>
        /// <param name="comType">解释命令字符串</param>
        /// <param name="comPrams">数据库参数列表</param>
        /// <returns>DataSet</returns>
        private static DataSet SelectToDS(string sql, CommandType comType, params SqlParameter[] comPrams)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    PrepareCommand(comm, conn, sql, comType, comPrams);
                    using (SqlDataAdapter adapter = new SqlDataAdapter(comm))
                    {
                        DataSet ds = new DataSet();
                        try
                        {
                            adapter.Fill(ds);
                            comm.Parameters.Clear();
                            conn.Close();
                        }
                        catch (Exception ex)
                        {
                            conn.Close();
                            return null;
                            throw ex;
                        }
                        return ds;
                    }
                }
            }
        }

        /// <summary>
        /// 执行数据库操作:增删改
        /// </summary>
        /// <param name="sql">命令字符串</param>
        /// <param name="comType">解释命令字符串</param>
        /// <param name="comPrams">数据库参数列表</param>
        /// <returns>返回受影响行数</returns>
        private static int ExecuteSql(string sql, CommandType comType, params SqlParameter[] comPrams)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    try
                    {
                        PrepareCommand(comm, conn, sql, comType, comPrams);
                        int rows = comm.ExecuteNonQuery();
                        comm.Parameters.Clear();
                        conn.Close();
                        return rows;
                    }
                    catch (Exception ex)
                    {
                        conn.Close();
                        return 0;
                        throw ex;
                    }
                }
            }
        }
        #endregion
    }
}
