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
using System.Globalization;

namespace Patient_Observations_System
{
    /// <summary>
    /// Interaction logic for Schedule.xaml
    /// </summary>
    public partial class Report : Window
    {
        // Declare a public property
        TimeSpan otBonusTime;
        DataTable dT;
        DataSet ds = new DataSet();
        string name, surname, dpt;
        string month = DateTime.Now.ToString("MMM"); // returns "May";
        string year = DateTime.Now.Year.ToString();
        string monthInt = DateTime.Now.Month.ToString("D2");

        // int f = now.Year;
        string time_in;
        string time_out;

        string connectionString = ConfigurationManager.ConnectionStrings["MyDatabase"].ConnectionString;
        public string FingerText { get; set; }
        public Report()
        {


            InitializeComponent();
        }
        private void Report_Loaded(object sender, RoutedEventArgs e)
        {
            getDetails();
            fillGrid();
        }

        private void getDetails()
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
                    command.Parameters.AddWithValue("@fingerid", FingerText);

                    // Execute the command and get a reader
                    using (var reader = command.ExecuteReader())
                    {
                        // Read the data from the reader
                        if (reader.Read())
                        {
                            // Assign the data to the textboxes
                            name = reader["name"].ToString();
                            surname = reader["surname"].ToString();
                           // idTB.Text = reader["id"].ToString();
                            //sexCB.Text = reader["sex"].ToString();
                            dpt = reader["department"].ToString();
                           // dobTB.Text = reader["dob"].ToString();
                           time_in = reader["time_in"].ToString();
                            time_out = reader["time_out"].ToString();
                        }
                    }

                    extInLabel.Content = "Expected Time In: " + time_in;
                    extOutLabel.Content = "Expected Time Out: " + time_out;
                    headingLabel.Content = surname + " " + name + " " + month  + "," + year + " Attendance Report";
                  
                }

                connection.Close();
            }

        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
           
            Hide();
            Records w1 = new Records();
            w1.ShowDialog();
        }

        private void fillGrid()
        {
            try
            {

                using (var connection = new SQLiteConnection(connectionString))
                {

                    // string Query = "select date(datetym) as date,  min(time(datetym, 'localtime')) as time_in, case when count(time(datetym)) = 2 then max(time(datetym, 'localtime')) else 'N/A' end as time_out from Records where strftime('%m', datetym) = strftime('%m', 'now') and finger_id ='" + FingerText + "' group by date(datetym)";

                    string Query = "select date(datetym) as date, min(time(datetym, 'localtime')) as time_in, case when count(time(datetym)) = 2 then max(time(datetym, 'localtime')) else 'N/A' end as time_out from Records where strftime('%m', datetym) = '" + monthInt + "'  and strftime('%Y', datetym) = '" + year + "'  and finger_id = '" + FingerText + "' group by date(datetym)";


                    using (var command = new SQLiteCommand(Query, connection))
                    {


                        connection.Open();
                        ds.Clear();
                        dataGrid.ItemsSource = null;
                        //For offline connection we weill use  MySqlDataAdapter class.  
                        SQLiteDataAdapter MyAdapter = new SQLiteDataAdapter();
                        MyAdapter.SelectCommand = command;



                        MyAdapter.Fill(ds);
                        dT = ds.Tables[0];
                        
                        DataView DV = new DataView(dT);
                        // DV.RowFilter = string.Format("last_name LIKE '%{0}%'", textBox.Text);
                        // dataGrid.Items.Refresh();
                        // dataGrid.ItemsSource = null;
                        dataGrid.ItemsSource = DV;
                        calcOvertimes();
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

        private void btnHome_Click(object sender, RoutedEventArgs e)
        {
         
            Hide();
            Home w1 = new Home();
            w1.ShowDialog();
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                month = comboBox.Text;
               

                    DateTime monthDate = DateTime.ParseExact(month, "MMM", CultureInfo.InvariantCulture);

                // Get the month as an int
                if (month != "OCT" && month != "NOV" && month != "DEC")
                {
                    monthInt = "0" + monthDate.Month.ToString();
                }
                else
                {
                    monthInt = monthDate.Month.ToString();
                }

                // Print the month to the console
                Console.WriteLine(monthInt);
                year = yearTB.Text;

                getDetails();
                fillGrid();
            
            }

            catch(Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

        }

        private void rateTB_TextChanged_1(object sender, TextChangedEventArgs e)
        {

        }

        private void calcOvertimes()
        {
            // Execute your query and get the result set as a DataTable
           

            // Declare variables to store the total late hours and overtime hours
            TimeSpan totalLateHours = TimeSpan.Zero;
            TimeSpan totalOvertimeHours = TimeSpan.Zero;

            // Declare constants to represent the normal start and end time of the work day
            TimeSpan normalStartTime = TimeSpan.Parse(time_in); 
            TimeSpan normalEndTime = TimeSpan.Parse(time_out);

            int countt = 0;
            // Loop through each row of the result set
            foreach (DataRow row in dT.Rows)
            {
                TimeSpan timeOut = default(TimeSpan);
                // Parse the time_in and time_out values as TimeSpan objects
                TimeSpan timeIn = TimeSpan.Parse(row["time_in"].ToString());
                if(Convert.ToString(row["time_out"]) == "N/A")
                {
                    goto timeIn;
                }
                else
                {
                   timeOut = TimeSpan.Parse(row["time_out"].ToString());
                }

                // Compare the time_out value with the normal end time
                if (timeOut > normalEndTime)
                {
                    // Calculate the overtime hours for that day
                    TimeSpan overtimeHours = timeOut - normalEndTime;
                    // Add it to the total overtime hours
                    totalOvertimeHours += overtimeHours;
                }
                timeIn:
                // Compare the time_in value with the normal start time
                if (timeIn > normalStartTime)
                {
                    // Calculate the late hours for that day
                    TimeSpan lateHours = timeIn - normalStartTime;
                    // Add it to the total late hours
                    totalLateHours += lateHours;
                    countt++;
                }

               
               
            }

            // Display or store the total late hours and overtime hours as you need
            Console.WriteLine("Total late hours: {0}", totalLateHours);
            Console.WriteLine("Total overtime hours: {0}", totalOvertimeHours);
            otHrsLabel.Content = totalOvertimeHours;
            lateHrsLabel.Content = totalLateHours;
            lateLabel.Content = countt; 
           otBonusTime = totalOvertimeHours - totalLateHours;

            double hours = otBonusTime.TotalHours;

            if(hours <= 0)
            {
                otBonusLabel.Content = "0.00";
            }

            else
            {
                double rate = Convert.ToDouble(rateTB.Text);
                double bonusMula = hours * rate;
                bonusMula= Math.Round(bonusMula * 100.0) / 100.0;
                otBonusLabel.Content = bonusMula;
            }


        }
        private void rateTB_TextChanged(object sender, TextChangedEventArgs e)
        {
          
            Console.WriteLine(rateTB.Text);

            float parsedValue;

            // Try to parse the textbox value as a float
            bool isValid = float.TryParse(rateTB.Text, out parsedValue);
            double hours = otBonusTime.TotalHours;

            if (hours <= 0)
            {
                otBonusLabel.Content = "0.00";
            }

            else
            {
                if (isValid)
                {
                    Console.WriteLine("HI");
                    Console.WriteLine("hours:" + hours);
                    double rate = Convert.ToDouble(rateTB.Text);
                    double bonusMula = hours * rate;
                    bonusMula = Math.Round(bonusMula * 100.0) / 100.0;
                    Console.WriteLine("mula:" + bonusMula);
                    otBonusLabel.Content = bonusMula;

                   
                }
                else
                {
                    otBonusLabel.Content = "";
                }
            }
        }

    }
}
