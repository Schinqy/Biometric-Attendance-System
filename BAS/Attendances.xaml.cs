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
using System.Configuration;
using Newtonsoft.Json;
using System.Data.SQLite;
using System.IO.Ports;
using System.Data;
using System.Media;



namespace Patient_Observations_System
{
    /// <summary>
    /// Interaction logic for Attendances.xaml
    /// </summary>
    public partial class Attendances : Window
    {
        int clever_variable;
        int p;
        string innorout;

        string connectionString = ConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString;
   

        private SerialPort ComPort = new SerialPort(); //Initialise ComPort Variable as SerialPort

        // Weights //
        int Fing_ID;

        public Attendances()
        {
            InitializeComponent();
        }
        private void Attendances_Loaded(object sender, RoutedEventArgs e)
        {

            UpdatePorts();
        }


        private void fillUI()
        {

        
            using (var connection = new SQLiteConnection(connectionString))
            {
                // Open the connection
                connection.Open();

                // Create a command
                using (var command = new SQLiteCommand(connection))
                {
                    // Set the command text to a SQL query
                    command.CommandText = "SELECT * FROM Employees WHERE finger_id = @fingerid";

                    // Add a parameter for the fingerid value
                    command.Parameters.AddWithValue("@fingerid", fingerTB.Text);

                    // Execute the command and get a reader
                    using (var reader = command.ExecuteReader())
                    {
                        // Read the data from the reader
                        if (reader.Read())
                        {
                            // Assign the data to the textboxes
                            nameTB.Text = reader["name"].ToString();
                            surnameTB.Text = reader["surname"].ToString();
                            idTB.Text = reader["id"].ToString();
                            sexCB.Text = reader["sex"].ToString();
                            dptTB.Text = reader["department"].ToString();
                            dobTB.Text = reader["dob"].ToString();
                        }
                    }
                }

                connection.Close();
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

                    btnCollect.IsEnabled = true;
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

            btnCollect.IsEnabled = false;

        }
        //whenever the connect button is clicked, it will check if the port is already open, call the disconnect function.
        // if the port is closed, call the connect function.
        private void btnBack_Click(object sender, EventArgs e)
        {
            disconnect();
            Hide();
            Home f2 = new Home();
            f2.ShowDialog();
        }

        private void btnHome_Click(object sender, EventArgs e)
        {
            disconnect();
            Hide();
            Home f2 = new Home();
            f2.ShowDialog();
        }

        private void UpdatePorts()
        {
            string[] ports = SerialPort.GetPortNames();
            foreach (string port in ports)
            {
                comboBox.Items.Add(port);
            }
        }
        private void btnConnect_Click(object sender, RoutedEventArgs e)
        {
            if (ComPort.IsOpen)
            {
                disconnect();
                btnCollect.IsEnabled = true;
                statusLabel.Foreground = Brushes.Red;
                statusLabel.Content = "System Offline";
            }
            else
            {
                connect();
                statusLabel.Foreground = Brushes.Green;
                statusLabel.Content = "System Online";
                getAttendance();
            }



   



        
    }

        private void searchFinger()
        {

            ComPort.Write(new byte[] { 0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x0, 0x8, 0x1B, 0x1, 0x0, 0x0, 0x0, 0xA3, 0x0, 0xC8 }, 0, 17);
            //See if finger isnot already available
            System.Threading.Thread.Sleep(700);
            byte[] bufferAYR = new byte[16];
            ComPort.Read(bufferAYR, 0, 16);


            int x = Convert.ToUInt16(bufferAYR[9] + 1);
            string y = Convert.ToString(bufferAYR[10]);
            string z = Convert.ToString(bufferAYR[11]);
            string p = Convert.ToString(bufferAYR[12]);
            string q = Convert.ToString(bufferAYR[13]);


            // richTextBox2.AppendText(x + "");


            switch (x)
            {
                case 1:
                    label2.Foreground = Brushes.Red;
                    label1.Foreground = Brushes.DarkOrange;
                    string display = "Registered. FingerID: " + y + "" + z;
                    label2.Content = display;
                    string display2 = "Match Score: " + p + "" + q;
                    label1.Content = display2;
                    fingerTB.Text = z;
                    clever_variable = 1;
                    fillUI();

                    //label31.Text = z;

                   
                    break;


                case 2:
                    label2.Foreground = Brushes.Red;
                    label2.Content = "Error when receiving package";
                    label1.Content = "Try again";
                    clever_variable = 0;
                    break;

                default:

                    label2.Content = "Didnt find match";
                    label1.Content = "Kindly get registered";
                    clever_variable = 0;

                    break;

            }


        }

        private async void getAttendance()
        {

            TryFirstTake:
            ComPort.Write(new byte[] { 0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x0, 0x3, 0x1, 0x0, 0x5 }, 0, 12);
            //First finger stored in buffer
           // System.Threading.Thread.Sleep(500);
            await Task.Delay(500);
            byte[] buffer = new byte[12];
            ComPort.Read(buffer, 0, 12);
            label2.Content = "Collecting and Storing First Fingerprint";
            label1.Content = "";
            int x = Convert.ToUInt16(buffer[9] + 1);
            // richTextBox2.AppendText(x + "");


            switch (x)
            {
                case 1:
                    ComPort.Write(new byte[] { 0xEF, 0x1, 0xFF, 0xFF, 0xFF, 0xFF, 0x1, 0x0, 0x4, 0x2, 0x1, 0x0, 0x8 }, 0, 13);
                    //generate first character from first finger take stored in buffer 
                    //System.Threading.Thread.Sleep(700);
                    await Task.Delay(700);
                    label2.Content = "Generating First Character";
                    label1.Content = "";

                    goto SecondTake;

                default:
                    label2.Foreground = Brushes.Orange;
                    label2.Content = "... Waiting for Finger";
                    label1.Content = "";
                    goto TryFirstTake;

            }



            SecondTake:
            byte[] buffer1 = new byte[12];
            ComPort.Read(buffer1, 0, 12);
            int y = Convert.ToUInt16(buffer1[9] + 1);
            switch (y)
            {
                case 1:
                    label2.Content = "First Character successfully created";
                    label1.Foreground = Brushes.Green;
                    label1.Content = "";
                    //System.Threading.Thread.Sleep(2000);
                    await Task.Delay(200);
                    goto checkFinger;
                case 2:
                    label2.Foreground = Brushes.Red;
                    label2.Content = "Error when receiving package, Try Again GenChar1";
                    label1.Content = "";
                    goto PlaceOfError;
                case 7:
                    label1.Content = "";
                    label2.Foreground = Brushes.OrangeRed;
                    label2.Content = "fail to generate character file due to the over-disorderly fingerprint image";
                    goto PlaceOfError;
                case 8:
                    label1.Content = "";
                    label2.Foreground = Brushes.OrangeRed;
                    label2.Content = "fail to generate character file due to lackness of character point or over-smallness of fingerprint image";
                    goto PlaceOfError;
                default:
                    label1.Content = "";
                    label2.Foreground = Brushes.Orange;
                    label2.Content = "fail to generate the image for the lackness of valid primary image";
                    goto PlaceOfError;

            }
            checkFinger:


            // statusStrip1.Text = "Successful";
            searchFinger();
            if (clever_variable == 0)
            {
                goto PlaceOfError;
            }
            else if (clever_variable == 1)
            {
                try
                {
                    insertToRecords();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            
                
                p = 1;
                goto PlaceOfJoy;
                    

                   

            
            PlaceOfError:
            btnCollect.Content = "Try Again";
            p = 0;
            PlaceOfJoy:

            if (p == 1)
            {
              MessageBox.Show("Recorded Attendance");
                //btnCollect.Content = "Done"; ;
            }

        }

       private void insertToRecords()
        {
            // Create a connection to the SQLite database
    
            using (var connection = new SQLiteConnection(connectionString))
            {
                // Open the connection
             

                string sq = "SELECT in_or_out, datetime(datetym, 'localtime') FROM Records WHERE finger_id=" + fingerTB.Text;
                string dheti = "SELECT date('now','localtime') AS dheti";
                

                connection.Open();
                using (var command2 = new SQLiteCommand(connection))
                {
                    // Set the command text to a SQL query
                    command2.CommandText = "SELECT count(*) FROM Records WHERE date(datetym) = date('now') AND finger_id=" + fingerTB.Text;

                    // Execute the command and get the single value
                    int count = Convert.ToInt32(command2.ExecuteScalar());


                    label2.Foreground = Brushes.Green;
                    label2.Content = count.ToString();

                    if (count == 0)
                    {
                        //insert INN
                        innorout = "Inn";

                        label1.Foreground = Brushes.Green;
                        label1.Content = "Getting In";
                    }
                    else if(count ==1 )
                    {
                        //insert OUT
                        innorout = "Out";
                        label1.Foreground = Brushes.Green;
                        label1.Content = "Getting Out";
                    }
                    else
                    {
                        //dont insert, return error
                        label1.Foreground = Brushes.Green;
                        label1.Content = "Come back tomorrow";
                        goto END;
                    }
                }
                connection.Close();

                connection.Open();
                // Create a command
                using (var command = new SQLiteCommand(connection))
                {
                    // Set the command text to a SQL query that inserts data with conditions
                    command.CommandText = @"INSERT INTO Records (name, surname, finger_id, in_or_out) VALUES( @name, @surname, @finger_id, @in_or_out) ;";

                    command.Parameters.AddWithValue("@name", nameTB.Text);
                    command.Parameters.AddWithValue("@surname", surnameTB.Text);
                    command.Parameters.AddWithValue("@finger_id", fingerTB.Text);


                    command.Parameters.AddWithValue("@in_or_out", innorout);
                    label2.Content = "Inserting Records";
                   
                    command.ExecuteNonQuery();

                }
                END:
                connection.Close();

            }


        }

        private void btnCollect_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
