using Microsoft.EntityFrameworkCore;
using SpeedUpCoreAPIExample.Contexts;
using SpeedUpCoreAPIExample.Interfaces;
using SpeedUpCoreAPIExample.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SpeedUpCoreAPIExample.Repositories
{
    public class PricesRepository : IPricesRepository
    {
        private readonly DefaultContext _context;

        public PricesRepository(DefaultContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Price>> GetPricesAsync(int productId)
        {
            return await _context.Prices.Where(p => p.ProductId == productId).ToListAsync();
        }
    }
}