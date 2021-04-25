using System.Collections.Generic;
using edbuddy.api.Controllers;
using Microsoft.AspNetCore.Mvc;
using Xunit;

namespace edbuddy.api.test{
    public class weatherTest{
        [Fact]
        public void GetItem()
        {
            WeatherForecastController target = new WeatherForecastController();
            var okResult = target.Get() as OkObjectResult;  // Assert
           ICollection<WeatherForecast> items = Assert.IsAssignableFrom<ICollection<WeatherForecast>>(okResult.Value);
        Assert.Equal(5,items.Count);
        }
    }
}