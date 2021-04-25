using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using edbuddy.api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace edbuddy.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardController : ControllerBase
    {
        // GET: /<controller>/
       
        [HttpGet]
         [Authorize(Policy = Policies.User)]
        public IActionResult Get()
        {
            DashboardModel dashboardModel = new DashboardModel();
            dashboardModel.carousel = new List<Carousel>
                {
                 new Carousel { ID = "1", Image = "https://www.topmovierankings.com/images/malayalam-news-images/aaha-malayalam-movie-release-date-confirmed.jpg", Title = "Clif mountain", Description = "A clif mountain near the sea" },
                new Carousel { ID = "2", Image = "https://www.topmovierankings.com/images/malayalam-news-images/anugraheethan-antony-release-date-review.jpg", Title = "Clif mountain 2", Description = "A clif mountain near the sea" },
                new Carousel { ID = "3", Image = "https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", Title = "Clif mountain 3", Description = "A clif mountain near the sea" },
                new Carousel { ID = "4", Image = "https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", Title = "Clif mountain 4", Description = "A clif mountain near the sea" },
                new Carousel { ID = "5", Image = "https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80", Title = "Clif mountain 5 ", Description = "A clif mountain near the sea" }
                };
            dashboardModel.explore = new List<Explore>
                {
                    new Explore { Image="", CategoryName="Solar System"},
                    new Explore { Image="", CategoryName="Continents"},
                    new Explore { Image="", CategoryName="Legends"},
                    new Explore { Image="", CategoryName="Sports"},
                };
            dashboardModel.courses = new List<Course>
                {
                    new Course{ CourseID=1, CourseName="Marvelous Maths", CourseDescription="Learn maths tricks", CourseImage=""},
                    new Course{ CourseID=2, CourseName="History", CourseDescription="Learn historical events", CourseImage=""},
                    new Course{ CourseID=3, CourseName="Science", CourseDescription="Learn scientific facts", CourseImage=""},
                    new Course{ CourseID=4, CourseName="Computing", CourseDescription="Learn the history of computers", CourseImage=""}
                };
            dashboardModel.contest = new List<Contest>
                {
                    new Contest{ ContestID=1, ContestName="Daily Puzzle", ContestDescription="Solve daily puzzle", ContestImage=""},
                    new Contest{ ContestID=2, ContestName="Monthly Puzzle", ContestDescription="Solve puzzle puzzle", ContestImage=""}
                };
            return Ok(dashboardModel);
        }
        [HttpGet("carousel")]
        [Authorize(Policy = Policies.User)]
        public IActionResult GetCarousel()
        {
            var carouselData = new List<Carousel>
            {
                new Carousel { ID = "1", Image = "https://www.topmovierankings.com/images/malayalam-news-images/aaha-malayalam-movie-release-date-confirmed.jpg", Title = "Clif mountain", Description = "A clif mountain near the sea" },
                new Carousel { ID = "2", Image = "https://www.topmovierankings.com/images/malayalam-news-images/anugraheethan-antony-release-date-review.jpg", Title = "Clif mountain 2", Description = "A clif mountain near the sea" },
                new Carousel { ID = "3", Image = "https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", Title = "Clif mountain 3", Description = "A clif mountain near the sea" },
                new Carousel { ID = "4", Image = "https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", Title = "Clif mountain 4", Description = "A clif mountain near the sea" },
                new Carousel { ID = "5", Image = "https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80", Title = "Clif mountain 5 ", Description = "A clif mountain near the sea" }

            };
            return Ok(carouselData);
        }
    }
}
