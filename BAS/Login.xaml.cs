using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using MySql.Data.MySqlClient;
using System.Data.SQLite;
using System.Configuration;
using System.IO;

namespace Patient_Observations_System
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();
            EnsureDatabaseExists();
        }


private void EnsureDatabaseExists()
        {
            try { 
            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString;
                using (var connection = new SQLiteConnection(connectionString))
                {
                    connection.Open();

                    /* string createEmployeesTableSql = @"
                 CREATE TABLE IF NOT EXISTS Employees (
                     name TEXT NOT NULL,
                     surname TEXT NOT NULL,
                     id TEXT UNIQUE ,
                     sex TEXT NOT NULL,
                     dob TEXT NOT NULL,
                     department TEXT NOT NULL,
                     finger_id INTEGER NOT NULL UNIQUE,
                     time_in TEXT NOT NULL,
                     time_out TEXT NOT NULL

                 )";*/
                    string createEmployeesTableSql = @"
                CREATE TABLE IF NOT EXISTS Employees ( 
                   name TEXT NOT NULL,
                   surname TEXT NOT NULL, 
                   id TEXT UNIQUE, 
                   sex TEXT NOT NULL,  
                   dob TEXT NOT NULL,  
                   department TEXT NOT NULL,
                   finger_id INTEGER NOT NULL,
                   time_in TEXT NOT NULL,
                   time_out TEXT NOT NULL, 
                   PRIMARY KEY('finger_id' AUTOINCREMENT))";



                    using (var command = new SQLiteCommand(createEmployeesTableSql, connection))
                    {
                        command.ExecuteNonQuery();
                    }

                    string createRecordsTableSql = @"
            CREATE TABLE IF NOT EXISTS Records (
                name TEXT NOT NULL,
                surname TEXT NOT NULL,
                in_or_out TEXT NOT NULL,
                datetym TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                finger_id INTEGER NOT NULL
            )";




                    using (var command = new SQLiteCommand(createRecordsTableSql, connection))
                    {
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
                
            }
            catch (Exception ex) { MessageBox.Show(ex.ToString()); }
        }


        private async void loginBtn_Click(object sender, RoutedEventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString;
           
                try
               {
                using (var connection = new SQLiteConnection(connectionString))
                {
                    connection.Open();
                   
                       using (SQLiteCommand cmd = connection.CreateCommand())
                       {
                           cmd.CommandText = @"select count(*) from Login where username=@username and pwd=@pwd";
                           cmd.Parameters.Add(new SQLiteParameter("username", usernameTB.Text));
                           cmd.Parameters.Add(new SQLiteParameter("pwd", passwordBox.Password));
                           int i = Convert.ToInt32(cmd.ExecuteScalar());
                           if (i > 0)
                           {
                               Hide();

                               Home f2 = new Home();
                               f2.ShowDialog();




                           }
                           else
                           {

                               msgLabel.Content = "        ";
                            await Task.Delay(1000);
                               msgLabel.Foreground = Brushes.Red;
                               msgLabel.Content = "UserName or Password Incorrect. Try Again";
                           }
                       }
                   }
               }
               catch (Exception ex)
               {
                   MessageBox.Show(ex.Message);
               }

           }
       }
         
        
    
}





