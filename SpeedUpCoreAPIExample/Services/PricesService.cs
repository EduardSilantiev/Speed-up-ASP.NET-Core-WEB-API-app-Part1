using Microsoft.AspNetCore.Mvc;
using SpeedUpCoreAPIExample.Interfaces;
using SpeedUpCoreAPIExample.Models;
using SpeedUpCoreAPIExample.ViewModels;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SpeedUpCoreAPIExample.Services
{
    public class PricesService : IPricesService
    {
        private readonly IPricesRepository _pricesRepository;

        public PricesService(IPricesRepository pricesRepository)
        {
            _pricesRepository = pricesRepository;
        }

        public async Task<IActionResult> GetPricesAsync(int productId)
        {
            try
            {
                IEnumerable<Price> pricess = await _pricesRepository.GetPricesAsync(productId);

                if (pricess != null)
                {
                    return new OkObjectResult(pricess.Select(p => new PriceViewModel()
                    {
                        Price = p.Value,
                        Supplier = p.Supplier.Trim()
                    }
                    )
                    .OrderBy(p => p.Price)
                    .ThenBy(p => p.Supplier)
                    );
                }
                else
                {
                    return new NotFoundResult();
                }
            }
            catch
            {
                return new ConflictResult();
            }
        }
    }
}