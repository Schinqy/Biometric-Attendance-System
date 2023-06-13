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
using System.Windows.Shapes;
using MySql.Data.MySqlClient;
using System.Data.SQLite;
using System.Configuration;

namespace Patient_Observations_System
{
    /// <summary>
    /// Interaction logic for Home.xaml
    /// </summary>
    public partial class Home : Window
    {
        public Home()
        {
            InitializeComponent();
            try
            {


                string connectionString = ConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString;
                //Display query  
                // string Query = "SELECT COUNT(*) from posm.patient_record;";




                using (SQLiteConnection GetConnected = new SQLiteConnection(connectionString))
                {
                    GetConnected.Open();
                    using (SQLiteCommand cmd = GetConnected.CreateCommand())
                    {
                        cmd.CommandText = @"select count(*) from Employees";


                        int rowCount = Convert.ToInt32(cmd.ExecuteScalar());

                        labelCount.Content = rowCount.ToString();
                       // cmd.CommandText = @"SELECT last_name, first_name FROM patient_record ORDER BY priorityNumber DESC LIMIT 1";
                       // object data = Convert.ToString(cmd.ExecuteScalar());
                       // latenessLabel.Content = data.ToString();


                    }



                    //  dataGrid.DataContext = ds; // here i have assigned dataset object to the dataGridView object to display data.               
                    GetConnected.Close();
                } 
            }
            catch (SQLiteException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void registerBtn_Click(object sender, RoutedEventArgs e)
        {

            Hide();
            Register f = new Register();
            f.ShowDialog();

        }

        private void recordsBtn_Click(object sender, RoutedEventArgs e)
        {

            Hide();

            Records f2 = new Records();
            f2.ShowDialog();

        }

        private void attendanceBtn_Click(object sender, RoutedEventArgs e)
        {
            Hide();

            Attendances f2 = new Attendances();
            f2.ShowDialog();
        }
    }
}
