namespace SpeedUpCoreAPIExample.Models
{
    public class Price
    {
        public int PriceId { get; set; }
        public int ProductId { get; set; }
        public decimal Value { get; set; }
        public string Supplier { get; set; }
    }
}