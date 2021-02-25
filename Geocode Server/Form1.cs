using Newtonsoft.Json;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Windows.Forms;

namespace hackathon_tests
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var jobs = GetJobs(10);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var coords = GetCoords("360 Huntington Ave");
        }

        // scrapes a certain number of pages of jobs
        public static List<Jobs> GetJobs(int pageCount)
        {
            List<Jobs> results = new List<Jobs>();

            string baseUrl = "https://www.volunteermatch.org/search/?l=Boston,%20MA,%20USA&r=10&s=";

            var options = new ChromeOptions();
            options.AddArgument("--headless");

            using (var driver = new ChromeDriver(Environment.CurrentDirectory, options))
            {
                string itemPath = "/html/body/div[4]/div[3]/main/div[1]/div[2]/section[2]/div/div[1]/div[5]/div[6]/div/div[";
                string addPath = "/span/div[2]/span/span[2]/span";
                string titlePath = "/span/h3/a";
                string hostPath = "/span/span[1]/a";
                string descPath = "/span/p";
                string linkPath = "/span/div[2]/a";

                for (int page = 0; page < pageCount; page++)
                {
                    driver.Url = baseUrl + (page * 10 + 1);
                    driver.Navigate();

                    for (int i = 0; i < 10; i++)
                    {
                        string curPath = itemPath + (2 * i + 1) + "]";

                        bool isGood = true;
                        bool shouldAdd = true;

                        IEnumerable<IWebElement> addressElements = null;

                        try
                        {
                            IWebElement curItem = driver.FindElementByXPath(curPath);
                            IWebElement curAddress = driver.FindElementByXPath(curPath + addPath);

                            addressElements = curAddress.FindElements(By.XPath(".//*"));
                            isGood = addressElements.First().Text.Any(char.IsDigit);
                        }
                        catch
                        {
                            isGood = false;
                        }


                        if (isGood)
                        {
                            Jobs curJob = null;
                            try
                            {
                                string address = string.Join(" ", addressElements.Select(x => x.Text));

                                var coords = GetCoords(address);
                                string title = driver.FindElementByXPath(curPath + titlePath).Text;
                                string host = driver.FindElementByXPath(curPath + hostPath).Text;
                                string desc = driver.FindElementByXPath(curPath + descPath).Text;
                                string link = driver.FindElementByXPath(curPath + linkPath).GetAttribute("href");
                                curJob = new Jobs(coords.X, coords.Y, title, host, desc, link);
                            }
                            catch
                            {
                                shouldAdd = false;
                            }

                            if (shouldAdd)
                            {
                                results.Add(curJob);
                            }
                        }
                    }
                }
            }
            return results;
        }

        // default is 5 pages
        public static List<Jobs> GetJobs() => GetJobs(5);

        // convert address -> coordinates
        private static Coords GetCoords(string query)
        {
            string appId = "";
            string apiKey = "";
            string search = HttpUtility.HtmlEncode(query);

            string endpoint = $"https://geocoder.ls.hereapi.com/6.2/geocode.json?apiKey={apiKey}&app_id={appId}&searchtext={search}";

            string result = "";

            using (var client = new HttpClient())
            {
                result = client.GetStringAsync(endpoint).GetAwaiter().GetResult();
            }

            var json = JsonConvert.DeserializeObject<dynamic>(result);

            double x = json.Response.View[0].Result[0].Location.DisplayPosition.Latitude;
            double y = json.Response.View[0].Result[0].Location.DisplayPosition.Longitude;

            return new Coords(x, y);
        }
    }

    public class Coords
    {
        public double X { get; set; }
        public double Y { get; set; }

        public Coords(double x, double y)
        {
            X = x;
            Y = y;
        }
    }

    public class Jobs
    {
        public double X { get; set; }
        public double Y { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Host { get; set; }
        public string Url { get; set; }

        public Jobs(double x, double y, string title, string description, string host, string url)
        {
            X = x;
            Y = y;
            Title = title;
            Description = description;
            Host = host;
            Url = url;
        }
    }
}