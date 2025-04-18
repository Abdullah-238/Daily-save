
using Microsoft.Maui.Controls;
using static Microsoft.Maui.Controls.Device;
using System.Globalization;
using Wallet.String;

namespace Wallet
{
    public partial class MainPage : ContentPage
    {

        public List<string> Currency = new List<string>();

        public List<string> Type = new List<string>();
        public MainPage()
        {
            InitializeComponent();

            _Load();

        }


        void _Load()
        {
            if (CultureInfo.CurrentCulture.Name.StartsWith("ar"))
            {
                Currency.Add("دولار");
                Currency.Add("ريال سعودي");

                Type.Add("شراء");
                Type.Add("بيع");

            }
            else
            {
                Currency.Add("USD");
                Currency.Add("RS");

                Type.Add("Buy");
                Type.Add("Sell");
            }


            if (pkTypes.SelectedItem == "sell")
            {
                pkTypes.BackgroundColor = Colors.Red;
            }
            else
            {
                pkTypes.BackgroundColor = Colors.Green;

            }
            pkCurreency.ItemsSource = Currency;

            pkCurreency.SelectedIndex = 0;

            pkTypes.ItemsSource = Type;

            pkTypes.SelectedIndex = 0;
        }

      

        void _UpdateTotal()
        {
            decimal TotalLS = clsWalletLite.CalculateTotalPriceLS();

            decimal TotalUSD = clsWalletLite.CalculateTotalPriceUSD();

            lblTotalUSD.Text = TotalUSD.ToString();

            lblTotalLS.Text = TotalLS.ToString();

        }
        private async void Button_Clicked(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(enAmount.Text))
            {
                await DisplayAlert(AppString.Error, AppString.Please_enter_your_amount, AppString.Done);
                return;
            }

            decimal? Amount = decimal.Parse(enAmount.Text);

            string? Currency = pkCurreency.SelectedItem.ToString();

            string? Type = pkTypes.SelectedItem.ToString();

            if (Type == "Sell" || Type == "بيع")
            {
                Amount = Amount * -1;
            }

            string? Note = enNote.Text;

            if (Note == null)
            {
                Note = "No note";

                if (CultureInfo.CurrentCulture.Name.StartsWith("ar"))
                {
                    Note = "لا يوجد ملاحظة";

                }
                else
                {
                    Note = "No note";
                }
            }

            DateTime Time = dtpDate.Date;

            WalletDto wallet = new WalletDto(null , Amount, Currency, Time, Note, Type);

            if (clsWalletLite.AddWallet(wallet))
            {
              await  DisplayAlert(AppString.Done, AppString.your_amount_added_successfully, AppString.Done);

                _UpdateTotal();
            }
            else
            {
                await DisplayAlert(AppString.Done, AppString.your_amount_failed, AppString.Done);
            }
        }

        private void ContentPage_Loaded(object sender, EventArgs e)
        {
            _UpdateTotal();
        }

        private void RefreshView_Refreshing(object sender, EventArgs e)
        {
            rfshPage.IsRefreshing = false;

            _UpdateTotal();
        }

        private void pkTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
         
            if (pkTypes.SelectedIndex != -1)
            {
                var selectedType = pkTypes.SelectedItem;


                if (selectedType == "Sell" || selectedType == "بيع")
                {
                    pkTypes.BackgroundColor = Colors.Red;
                }
                else
                    pkTypes.BackgroundColor = Colors.Green;



            }
        }
    }

}
