using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace SpeedUpCoreAPIExample.Interfaces
{
    public interface IPricesService
    {
        Task<IActionResult> GetPricesAsync(int productId);
    }
}