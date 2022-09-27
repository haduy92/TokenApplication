using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Drawing;

namespace TokenApplication
{
	public partial class _Default : Page
	{
		private string ConnectionString { get { return ConfigurationManager.ConnectionStrings["mysql"].ConnectionString; } }
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!this.IsPostBack)
			{
				BindGridView();
			}
		}

		protected void btnSave_Click(object sender, EventArgs e)
		{
			if (txtID.Value == null || txtID.Value == "")
			{
				Insert();
			}
			else
			{
				Update();
			}
				
		}

		private void Update()
		{
			// TODO: update token
		}

		private void Insert()
		{
			using (var con = new MySqlConnection(ConnectionString))
			{
				var sql = $"insert into token (symbol, name, total_supply, contract_address, total_holders) values (@symbol, @name, @totalSupply, @contractAddress, @totalHolders)";
				con.Open();
				var cmd = new MySqlCommand(sql, con);
				cmd.Parameters.AddWithValue("@symbol", txtSymbol.Text);
				cmd.Parameters.AddWithValue("@name", txtName.Text);
				cmd.Parameters.AddWithValue("@totalSupply", txtTotalSupply.Text);
				cmd.Parameters.AddWithValue("@contractAddress", txtContractAddres.Text);
				cmd.Parameters.AddWithValue("@totalHolders", txtTotalHolders.Text);
				cmd.ExecuteNonQuery();
			}
		}

		private void BindGridView()
		{
			var sql = "select *, round(total_supply / (select sum(total_supply) from token) * 100, 0) as total_supply_percentage from token";
			using (var con = new MySqlConnection(ConnectionString))
			using (var cmd = new MySqlCommand(sql, con))
			using (var da = new MySqlDataAdapter())
			{
				da.SelectCommand = cmd;

				using (var dt = new DataTable())
				{
					da.Fill(dt);
					grdTokens.DataSource = dt;
					grdTokens.DataBind();
				}
			}
			
		}

		protected void btnReset_Click(object sender, EventArgs e)
		{
			// Clear the text boxes
		}

		protected void btnEdit_Click(object sender, CommandEventArgs e)
		{
			var id = e.CommandArgument.ToString();
			using (var con = new MySqlConnection(ConnectionString))
			using (var cmd = new MySqlCommand("select * from token where id = @id", con))
			using (var da = new MySqlDataAdapter())
			{
				cmd.Parameters.AddWithValue("id", id);
				da.SelectCommand = cmd;

				using (var dt = new DataTable())
				{
					da.Fill(dt);

					if(dt.Rows.Count == 0)
					{
						Response.Write("Invalid id");
					}
					txtSymbol.Text = dt.Rows[0]["symbol"].ToString();
					txtContractAddres.Text = dt.Rows[0]["contract_address"].ToString();
					txtName.Text = dt.Rows[0]["name"].ToString();
					txtTotalHolders.Text = dt.Rows[0]["total_holders"].ToString();
					txtTotalSupply.Text = dt.Rows[0]["total_supply"].ToString();
				}
			}
		}
	}
}