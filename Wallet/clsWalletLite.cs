using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.Sqlite;

namespace Wallet
{
    public class WalletDto
    {
        public int? WalletID { get; set; }
        public decimal? Amount { get; set; }
        public string? Currency { get; set; }
        public DateTime? Date { get; set; }
        public string? Note { get; set; }

        public string? Type { get; set; }

        public string DateShort { get; set; }

        public WalletDto(int? walletID, decimal? amount, string? currency, DateTime? date, string? note, string? type)
        {
            Amount = amount;
            Currency = currency;
            Date = date;
            Note = note;
            WalletID = walletID;
            Type = type;

            DateShort = date.Value.ToShortDateString();
        }
    }

    public class clsWalletLite
    {


        private static string _dbPath = Path.Combine(FileSystem.AppDataDirectory, "wallets.db");

        public static string connectionString = $"Data Source={_dbPath};";
        private static void InitializeDatabaseForWallets()
        {
            if (TableExists("Wallets"))
                return;

            try
            {
                using (SqliteConnection connection = new SqliteConnection(connectionString))
                {
                    connection.Open();

                    using (SqliteCommand command = connection.CreateCommand())
                    {
                        command.CommandText = @"
                        CREATE TABLE IF NOT EXISTS Wallets (
                            WalletID INTEGER PRIMARY KEY AUTOINCREMENT,
                            Amount DECIMAL,
                            Currency TEXT,
                            Date DATE,
                            Note TEXT,
                            Type TEXT
                        )";
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
               // Console.WriteLine(ex.Message); 
            }
        }

        private static bool TableExists(string tableName)
        {
            bool exists = false;
            using (SqliteConnection connection = new SqliteConnection(connectionString))
            {
                connection.Open();
                using (SqliteCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT name FROM sqlite_master WHERE type='table' AND name=$tableName";
                    command.Parameters.AddWithValue("$tableName", tableName);
                    using (SqliteDataReader reader = command.ExecuteReader())
                    {
                        exists = reader.Read();
                    }
                }
            }
            return exists;
        }

        public static bool AddWallet(WalletDto wallet)
        {
            InitializeDatabaseForWallets();

            try
            {
                using (var connection = new SqliteConnection(connectionString))
                {
                    connection.Open();

                    using (var command = connection.CreateCommand())
                    {
                        command.CommandText = @"
                INSERT OR REPLACE INTO Wallets (Amount, Currency, Date, Note,Type)
                VALUES ($Amount, $Currency, $Date, $Note,$Type)";

                        command.Parameters.AddWithValue("$Amount", wallet.Amount);
                        command.Parameters.AddWithValue("$Currency", wallet.Currency);
                        command.Parameters.AddWithValue("$Date", wallet.Date);
                        command.Parameters.AddWithValue("$Note", wallet.Note);
                        command.Parameters.AddWithValue("Type", wallet.Type);


                        int rowsAffected = command.ExecuteNonQuery();

                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message); 
                return false; 
            }

        }

        public static async Task<List<WalletDto>> GetAllWalletsAsync()
        {
            var wallets = new List<WalletDto>();

            try
            {
                using (var connection = new SqliteConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM Wallets";
                    using (var command = new SqliteCommand(query, connection))
                    {
                        using (var reader = await command.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                wallets.Add(new WalletDto(
                                    reader.IsDBNull(reader.GetOrdinal("WalletID")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("WalletID")),
                                    reader.IsDBNull(reader.GetOrdinal("Amount")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("Amount")),
                                    reader.IsDBNull(reader.GetOrdinal("Currency")) ? null : reader.GetString(reader.GetOrdinal("Currency")),
                            reader.IsDBNull(reader.GetOrdinal("Date")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("Date")),
                                    reader.IsDBNull(reader.GetOrdinal("Note")) ? null : reader.GetString(reader.GetOrdinal("Note")),
                                    reader.IsDBNull(reader.GetOrdinal("Type")) ? null : reader.GetString(reader.GetOrdinal("Type"))

                                ));
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return wallets;
        }

        public static async Task<List<WalletDto>> GetAllWalletsAsyncByType(string Type)
        {
            var wallets = new List<WalletDto>();

            try
            {
                using (var connection = new SqliteConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM Wallets where Type = $Type";

                    using (var command = new SqliteCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("$Type", Type);

                        using (var reader = await command.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                wallets.Add(new WalletDto(
                                    reader.IsDBNull(reader.GetOrdinal("WalletID")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("WalletID")),
                                    reader.IsDBNull(reader.GetOrdinal("Amount")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("Amount")),
                                    reader.IsDBNull(reader.GetOrdinal("Currency")) ? null : reader.GetString(reader.GetOrdinal("Currency")),
                            reader.IsDBNull(reader.GetOrdinal("Date")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("Date")),
                                    reader.IsDBNull(reader.GetOrdinal("Note")) ? null : reader.GetString(reader.GetOrdinal("Note")),
                                    reader.IsDBNull(reader.GetOrdinal("Type")) ? null : reader.GetString(reader.GetOrdinal("Type"))

                                ));
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return wallets;
        }

        public static async Task<List<WalletDto>> GetAllWalletsAsyncByDateAndType(DateTime Datetime , string Type)
        {
            var wallets = new List<WalletDto>();

            try
            {
                using (var connection = new SqliteConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM Wallets where Date = $Date and Type = $Type";

                    using (var command = new SqliteCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("$Date", Datetime);
                        command.Parameters.AddWithValue("$Type", Type);

                        using (var reader = await command.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                wallets.Add(new WalletDto(
                                    reader.IsDBNull(reader.GetOrdinal("WalletID")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("WalletID")),
                                    reader.IsDBNull(reader.GetOrdinal("Amount")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("Amount")),
                                    reader.IsDBNull(reader.GetOrdinal("Currency")) ? null : reader.GetString(reader.GetOrdinal("Currency")),
                            reader.IsDBNull(reader.GetOrdinal("Date")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("Date")),
                                    reader.IsDBNull(reader.GetOrdinal("Note")) ? null : reader.GetString(reader.GetOrdinal("Note")),
                                    reader.IsDBNull(reader.GetOrdinal("Type")) ? null : reader.GetString(reader.GetOrdinal("Type"))

                                ));
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return wallets;
        }

        public static async Task<List<WalletDto>> GetAllWalletsAsyncByDate(DateTime Datetime)
        {
            var wallets = new List<WalletDto>();

            try
            {
                using (var connection = new SqliteConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM Wallets where Date = $Date";

                    using (var command = new SqliteCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("$Date", Datetime);

                        using (var reader = await command.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                wallets.Add(new WalletDto(
                                    reader.IsDBNull(reader.GetOrdinal("WalletID")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("WalletID")),
                                    reader.IsDBNull(reader.GetOrdinal("Amount")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("Amount")),
                                    reader.IsDBNull(reader.GetOrdinal("Currency")) ? null : reader.GetString(reader.GetOrdinal("Currency")),
                            reader.IsDBNull(reader.GetOrdinal("Date")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("Date")),
                                    reader.IsDBNull(reader.GetOrdinal("Note")) ? null : reader.GetString(reader.GetOrdinal("Note")),
                                    reader.IsDBNull(reader.GetOrdinal("Type")) ? null : reader.GetString(reader.GetOrdinal("Type"))

                                ));
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return wallets;
        }

        public static List<WalletDto> GetAllWallets()
        {
            var wallets = new List<WalletDto>();

            try
            {
                using (var connection = new SqliteConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM Wallets ORDER BY Date DESC ";
                    using (var command = new SqliteCommand(query, connection))
                    {
                        using (var reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                wallets.Add(new WalletDto(
                                    reader.IsDBNull(reader.GetOrdinal("WalletID")) ? (int?)null : reader.GetInt32(reader.GetOrdinal("WalletID")),
                                    reader.IsDBNull(reader.GetOrdinal("Amount")) ? (decimal?)null : reader.GetDecimal(reader.GetOrdinal("Amount")),
                                    reader.IsDBNull(reader.GetOrdinal("Currency")) ? null : reader.GetString(reader.GetOrdinal("Currency")),
                            reader.IsDBNull(reader.GetOrdinal("Date")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("Date")),
                                    reader.IsDBNull(reader.GetOrdinal("Note")) ? null : reader.GetString(reader.GetOrdinal("Note")),
                                                                        reader.IsDBNull(reader.GetOrdinal("Type")) ? null : reader.GetString(reader.GetOrdinal("Type"))

                                ));
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return wallets;
        }

        public static bool DeleteWallet(int? walletId)
        {
            try
            {
                using (var connection = new SqliteConnection(connectionString))
                {
                    connection.Open();

                    string query = "DELETE FROM Wallets WHERE WalletID = $WalletID";

                    using (var command = new SqliteCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("$WalletID", walletId);

                        int rowsAffected = command.ExecuteNonQuery();

                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                return false; 
            }
        }

        public static decimal CalculateTotalPrice()
        {
            decimal totalPrice = 0;

            try
            {
                using (var connection = new SqliteConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT SUM(Amount) FROM Wallets";

                    using (var command = new SqliteCommand(query, connection))
                    {
                        var result = command.ExecuteScalar();

                        if (result != DBNull.Value)
                        {
                            totalPrice = Convert.ToDecimal(result);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }

            return totalPrice;
        }


        public static decimal CalculateTotalPriceUSD()
        {
            decimal totalUSD = 0;

            try
            {
                using (var connection = new SqliteConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT SUM(Amount) FROM Wallets WHERE Currency = 'USD' or Currency = 'دولار'";

                    using (var command = new SqliteCommand(query, connection))
                    {
                        var result = command.ExecuteScalar();

                        if (result != DBNull.Value)
                        {
                            totalUSD = Convert.ToDecimal(result);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message); // Log the exception if needed
            }

            return totalUSD;
        }

        public static decimal CalculateTotalPriceLS()
        {
            decimal totalLS = 0;

            try
            {
                using (var connection = new SqliteConnection(connectionString))
                {
                    connection.Open();

                    // Query to sum Amount where Currency is LS (Syrian Lira)
                    string query = "SELECT SUM(Amount) FROM Wallets WHERE Currency = 'RS' or Currency = 'ريال سعودي'";

                    using (var command = new SqliteCommand(query, connection))
                    {
                        var result = command.ExecuteScalar();

                        // If the result is not DBNull, convert it to decimal
                        if (result != DBNull.Value)
                        {
                            totalLS = Convert.ToDecimal(result);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message); // Log the exception if needed
            }

            return totalLS;
        }

    }

}

//private static void InitializeDatabaseForCategories()
//{
//    if (TableExists("Categories"))
//        return;

//    try
//    {
//        using (SqliteConnection connection = new SqliteConnection(clsSqliteString.connectionString))
//        {
//            connection.Open();

//            using (SqliteCommand command = connection.CreateCommand())
//            {
//                // Create Categories table
//                command.CommandText = @"
//                    CREATE TABLE IF NOT EXISTS Categories (
//                        CategoryID INTEGER PRIMARY KEY AUTOINCREMENT,
//                        CategoryNameAr TEXT NOT NULL,
//                        CategoryNameEn TEXT NOT NULL
//                    )";
//                command.ExecuteNonQuery();
//            }
//        }
//    }
//    catch (Exception ex)
//    {
//        Console.WriteLine(ex.Message); // Replace with appropriate logging
//    }
//}

//private static bool TableExists(string tableName)
//{
//    bool exists = false;
//    using (SqliteConnection connection = new SqliteConnection(clsSqliteString.connectionString))
//    {
//        connection.Open();
//        using (SqliteCommand command = connection.CreateCommand())
//        {
//            command.CommandText = "SELECT name FROM sqlite_master WHERE type='table' AND name=$tableName";
//            command.Parameters.AddWithValue("$tableName", tableName);
//            using (SqliteDataReader reader = command.ExecuteReader())
//            {
//                exists = reader.Read();
//            }
//        }
//    }
//    return exists;
//}

//public static async Task SaveCategoriesAsync(List<CategoryDTO> categories)
//{
//    InitializeDatabaseForCategories();

//    try
//    {
//        using (var connection = new SqliteConnection(clsSqliteString.connectionString))
//        {
//            await connection.OpenAsync();

//            foreach (var category in categories)
//            {
//                using (var command = connection.CreateCommand())
//                {
//                    command.CommandText = @"
//                        INSERT OR REPLACE INTO Categories (CategoryNameAr, CategoryNameEn)
//                        VALUES ($CategoryNameAr, $CategoryNameEn)";

//                    command.Parameters.AddWithValue("$CategoryNameAr", category.CategoryNameAr);
//                    command.Parameters.AddWithValue("$CategoryNameEn", category.CategoryNameEn);

//                    await command.ExecuteNonQueryAsync();
//                }
//            }
//        }
//    }
//    catch (Exception ex)
//    {
//        Console.WriteLine(ex.Message); // Replace with appropriate logging
//    }
//}

//public static void SaveCategories(List<CategoryDTO> categories)
//{
//    InitializeDatabaseForCategories();

//    try
//    {
//        using (var connection = new SqliteConnection(clsSqliteString.connectionString))
//        {
//            connection.Open();

//            foreach (var category in categories)
//            {
//                using (var command = connection.CreateCommand())
//                {
//                    command.CommandText = @"
//                        INSERT OR REPLACE INTO Categories (CategoryNameAr, CategoryNameEn)
//                        VALUES ($CategoryNameAr, $CategoryNameEn)";

//                    command.Parameters.AddWithValue("$CategoryNameAr", category.CategoryNameAr);
//                    command.Parameters.AddWithValue("$CategoryNameEn", category.CategoryNameEn);

//                    command.ExecuteNonQuery();
//                }
//            }
//        }
//    }
//    catch (Exception ex)
//    {
//        Console.WriteLine(ex.Message);
//    }
//}

//public static async Task<List<CategoryDTO>> GetAllCategories()
//{
//    var categories = new List<CategoryDTO>();

//    try
//    {
//        using (var connection = new SqliteConnection(clsSqliteString.connectionString))
//        {
//            connection.Open();
//            string query = "SELECT * FROM Categories";
//            using (var command = new SqliteCommand(query, connection))
//            {
//                using (var reader = await command.ExecuteReaderAsync())
//                {
//                    while (reader.Read())
//                    {
//                        categories.Add(new CategoryDTO(
//                            reader.GetInt32(reader.GetOrdinal("CategoryID")),
//                            reader.GetString(reader.GetOrdinal("CategoryNameAr")),
//                            reader.GetString(reader.GetOrdinal("CategoryNameEn"))
//                        ));
//                    }
//                }
//            }
//        }
//    }
//    catch (Exception ex)
//    {
//        Console.WriteLine(ex.Message); // Replace with appropriate logging
//    }
//    return categories;
//}

//public static bool IsCategoriesSaved()
//{
//    bool isFound = false;

//    try
//    {
//        using (var connection = new SqliteConnection(clsSqliteString.connectionString))
//        {
//            connection.Open();

//            using (var command = connection.CreateCommand())
//            {
//                command.CommandText = "SELECT CategoryID FROM Categories LIMIT 1";

//                using (var reader = command.ExecuteReader())
//                {
//                    if (reader.HasRows)
//                    {
//                        isFound = true;
//                    }
//                }
//            }
//        }
//    }
//    catch (Exception ex)
//    {
//        Console.WriteLine(ex.Message); // Log the exception
//    }

//    return isFound; // Returns true if any category is found, otherwise false
//}
//make like this for this class  class WalletDto
//{
//    public decimal? Amount { get; set; }
//    public string? Currency { get; set; }
//    public DateTime? Date { get; set; }
//    public string? Note { get; set; }
//    public decimal? Total { get; set; }
//}