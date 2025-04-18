using System.Globalization;

namespace Wallet;

public partial class pgWalletDetiles : ContentPage
{
    public List<string> Type = new List<string>();

    public pgWalletDetiles()
    {
        InitializeComponent();
    }

    private void ContentPage_Loaded(object sender, EventArgs e)
    {
        _load();
    }


  
    void _load()
    {
        if (CultureInfo.CurrentCulture.Name.StartsWith("ar"))
        {
            Type.Add("«·ﬂ·");
            Type.Add("‘—«¡");
            Type.Add("»Ì⁄");

        }
        else
        {
            Type.Add("All");
            Type.Add("Buy");
            Type.Add("Sell");
        }

        pkTypes.ItemsSource = Type;

        pkTypes.SelectedIndex = 0;
    }
    private void refresh_Refreshing(object sender, EventArgs e)
    {
        refresh.IsRefreshing = false;

        _load();
    }

    private async void pkTypes_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (pkTypes.SelectedIndex != -1)
        {
            var selectedType = pkTypes.SelectedItem;


            switch(selectedType)
            {
                case "Sell":
                    Wallet.ItemsSource = await clsWalletLite.GetAllWalletsAsyncByType("Sell");
                    break;
                case "»Ì⁄":
                    Wallet.ItemsSource = await clsWalletLite.GetAllWalletsAsyncByType("»Ì⁄");
                    break;
                case "Buy":
                    Wallet.ItemsSource = await clsWalletLite.GetAllWalletsAsyncByType("Buy");
                    break;
                case "‘—«¡":
                    Wallet.ItemsSource = await clsWalletLite.GetAllWalletsAsyncByType("‘—«¡");
                    break;

                case "All":
                    Wallet.ItemsSource = clsWalletLite.GetAllWallets();
                    break;
                case "«·ﬂ·":
                    Wallet.ItemsSource = clsWalletLite.GetAllWallets();
                    break;
            }

        }
      
    }

    private void pkDate_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    private async void DatePicker_DateSelected(object sender, DateChangedEventArgs e)
    {
        var selectedType = pkTypes.SelectedItem;


        switch (selectedType)
        {
            case "Sell":
                Wallet.ItemsSource = await clsWalletLite.GetAllWalletsAsyncByDateAndType(pkDate.Date, "Sell");
                break;
            case "»Ì⁄":
                Wallet.ItemsSource = await clsWalletLite.GetAllWalletsAsyncByDateAndType(pkDate.Date, "»Ì⁄");
                break;
            case "Buy":
                Wallet.ItemsSource = await clsWalletLite.GetAllWalletsAsyncByDateAndType(pkDate.Date, "Buy");
                break;
            case "‘—«¡":
                Wallet.ItemsSource = await clsWalletLite.GetAllWalletsAsyncByDateAndType(pkDate.Date, "‘—«¡");
                break;
            case "All":
                Wallet.ItemsSource = await clsWalletLite.GetAllWalletsAsyncByDate(pkDate.Date);
                break;
            case "«·ﬂ·":
                Wallet.ItemsSource = await clsWalletLite.GetAllWalletsAsyncByDate(pkDate.Date);
                break;

        }

    }
}
