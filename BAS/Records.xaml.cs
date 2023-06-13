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
using System.IO.Ports;
using System.Data;
using System.Configuration;
using Newtonsoft.Json;
using System.Data.SQLite;

namespace Patient_Observations_System
{
    /// <summary>
    /// Interaction logic for Records.xaml
    /// </summary>
    public partial class Records : Window
    {


        string connectionString = ConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString;
        // DataTable ds = new DataTable();
        DataSet ds = new DataSet();

        private SerialPort ComPort = new SerialPort(); //Initialise ComPort Variable as SerialPort
      
        // Weights //
        int Fing_ID;
       

       
        
        public Records()
        {
           
            InitializeComponent();
            try
            {

                using (var connection = new SQLiteConnection(connectionString))
                {


                    connection.Open();

                    //Display query  
                    string Query = "select * from Employees;";
                    using (var command = new SQLiteCommand(Query, connection))
                    {

                        //  MyConn2.Open();  
                        //For offline connection we weill use  MySqlDataAdapter class.  
                        SQLiteDataAdapter MyAdapter = new SQLiteDataAdapter();
                        MyAdapter.SelectCommand = command;


                        MyAdapter.Fill(ds);
                        DataTable dT = ds.Tables[0];
                        DataView DV = new DataView(dT);
                        // DV.RowFilter = string.Format("last_name LIKE '%{0}%'", textBox.Text);
                        dataGrid.ItemsSource = DV;
                        //  dataGrid.DataContext = ds; // here i have assigned dataset object to the dataGridView object to display data.               
                    }
                }//MyConn2.Close();  
            }
            catch (SQLiteException ex)
            {
                MessageBox.Show(ex.Message);
            }


}

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            disconnect();
            Hide();
            Home w1 = new Home();
            w1.ShowDialog();
        }

        private void textBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            DataTable dT = ds.Tables[0];      
            DataView DV = new DataView(dT);
            DV.RowFilter = string.Format("surname LIKE '%{0}%'", textBox.Text);
            dataGrid.ItemsSource = DV;
        }

        void selectedCellChanged(object sender, SelectedCellsChangedEventArgs e)
        {

           
                
                var cellInfos = dataGrid.SelectedCells;
            var list1 = new List<string>();
            
            foreach (DataGridCellInfo cellInfo in cellInfos)
            {
                if (cellInfo.IsValid)
                {
                    try
                    {
                        var content = cellInfo.Column.GetCellContent(cellInfo.Item);
                        var row = (DataRowView)content.DataContext;
                        object[] obj = row.Row.ItemArray;
                        for (int i = 0; i < 9; i++)
                        {
                            list1.Add(obj[i].ToString());
                        }
                    }
                    catch(Exception ex)
                    {
                        MessageBox.Show(this, "Nothing there", ex.Message, MessageBoxButton.OK, MessageBoxImage.Stop);
                        
                    }
                }
                try
                {
                    //indexLabel.Content = list1[1];
                    nameTB.Text = list1[0];
                    surnameTB.Text = list1[1];
                    idTB.Text = list1[2];
                    sexTB.Text = list1[3];
                    dobTB.Text = list1[4];
                    dptTB.Text = list1[5];
                    fingerLabel.Content = list1[6];
                    timeinTB.Text = list1[7];
                    timeoutTB.Text = list1[8];
                    Fing_ID = Convert.ToInt32(list1[6]);
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }


            }
        }

        private void Records_Loaded(object sender, RoutedEventArgs e)
        {

            UpdatePorts();
        }
        private void UpdatePorts()
        {
            string[] ports = SerialPort.GetPortNames();
            foreach (string port in ports)
            {
                comboBox.Items.Add(port);
            }
        }


        private void connect()
        {
            bool error = false;

            // Check if all settings have been selected

            if (comboBox.SelectedIndex != -1)
            {  //if yes then Set The Port's settings
                ComPort.PortName = comboBox.Text;
                ComPort.BaudRate = 57600;
                ComPort.Parity = Parity.None;

                ComPort.DataBits = 8;
                ComPort.StopBits = StopBits.One;

                try //always try to use this try and catch method to open your port.
                    //if there is an error your program will display a message instead of freezing.
                {
                    //Open Port
                    ComPort.Open();

                    //btnCollect.IsEnabled = true;
                }
                catch (UnauthorizedAccessException) { error = true; }
                catch (System.IO.IOException) { error = true; }
                catch (ArgumentException) { error = true; }

                if (error) MessageBox.Show(this, "Could not open the COM port. Most likely it is already in use, has been removed, or is unavailable.", "COM Port unavailable", MessageBoxButton.OK, MessageBoxImage.Stop);


            }
            else
            {
                MessageBox.Show("Please select the COM Port", "Serial Port Interface", MessageBoxButton.OK, MessageBoxImage.Stop);
            }
            //if the port is open, Change the Connect button to disconnect, enable the send button.
            //and disable the groupBox to prevent changing configuration of an open port.
            if (ComPort.IsOpen)
            {
                btnConnect.Content = "Disconnect";

            }


        }

        // Call this function to close the port.
        private void disconnect()
        {
            ComPort.Close();
            btnConnect.Content = "Connect";

            //btnCollect.IsEnabled = false;

        }

        private void btnConnect_Click(object sender, RoutedEventArgs e)
        {
            if (ComPort.IsOpen)
            {
                disconnect();
            }
            else
            {
                connect();
            }
        }

        private void btn_Click(object sender, RoutedEventArgs e)
        {
            dataGrid.ItemsSource = null;
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {


            try

            {



                using (var connection = new SQLiteConnection(connectionString))
                {


                    connection.Open();
                    //This is  MySqlConnection here i have created the object and pass my connection string. 
                    string Query = "update Employees set name='" + nameTB.Text + "',surname='" + surnameTB.Text + "',sex='" + sexTB.Text + "',id='" + idTB.Text + "',dob='" + dobTB.Text + "', department='" + dptTB.Text + "', time_in='" + timeinTB.Text + "', time_out='" + timeoutTB.Text + "' WHERE finger_id = " + Fing_ID;

                    using (var commandx = new SQLiteCommand(Query, connection))
                    {



                        SQLiteDataReader MyReader2;



                        MyReader2 = commandx.ExecuteReader();
                        ds.Clear();
                        dataGrid.ItemsSource = null;

                        MessageBox.Show("Data Updated");

                        while (MyReader2.Read())

                        {



                        }

                        connection.Close();//Connection closed here 

                    }
                }
            }

            catch (Exception ex)

            {



                MessageBox.Show(ex.Message);

            }
            try
            {

                using (var connection = new SQLiteConnection(connectionString))
                {

                    string Query = "select * from Employees;";


                    using (var command = new SQLiteCommand(Query, connection))
                    {


                        connection.Open();
                        //For offline connection we weill use  MySqlDataAdapter class.  
                        SQLiteDataAdapter MyAdapter = new SQLiteDataAdapter();
                        MyAdapter.SelectCommand = command;



                        MyAdapter.Fill(ds);
                        DataTable dT = ds.Tables[0];
                        DataView DV = new DataView(dT);
                        // DV.RowFilter = string.Format("last_name LIKE '%{0}%'", textBox.Text);
                        // dataGrid.Items.Refresh();
                        // dataGrid.ItemsSource = null;
                        dataGrid.ItemsSource = DV;
                        //  dataGrid.DataContext = ds; // here i have assigned dataset object to the dataGridView object to display data.               
                        connection.Close();
                    }
                }
            }
            catch (SQLiteException ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {


            try
            {
                using (var connection = new SQLiteConnection(connectionString))
                {



                    string Query = "delete from Employees where finger_id='" + fingerLabel.Content + "';";

                    using (var command = new SQLiteCommand(Query, connection))
                    {


                        connection.Open();
                        SQLiteDataReader MyReader2;

                        MyReader2 = command.ExecuteReader();
                        MessageBox.Show("Data Deleted");
                        while (MyReader2.Read())
                        {
                        }
                        connection.Close();
                    }
                    string Query2 = "select * from Employees;";
                    connection.Open();
                    using (var commandy = new SQLiteCommand(Query2, connection))
                    {


                        SQLiteDataAdapter MyAdapter = new SQLiteDataAdapter();
                        MyAdapter.SelectCommand = commandy;
                        ds.Clear();

                        MyAdapter.Fill(ds);
                        DataTable dT = ds.Tables[0];
                        DataView DV = new DataView(dT);
                        dataGrid.ItemsSource = null;
                        dataGrid.ItemsSource = DV;
                        connection.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

           
        }

        private void btnHome_Click(object sender, RoutedEventArgs e)
        {

            try
            {
                    disconnect();
                    Hide();
                    Home w1 = new Home();
                    w1.ShowDialog();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        } 

        private void btnReport_Click(object sender, RoutedEventArgs e)
        {

            disconnect();
            Hide();
            Report w1 = new Report();
            w1.FingerText = Convert.ToString(fingerLabel.Content);
            w1.ShowDialog();

        }
    }
}
