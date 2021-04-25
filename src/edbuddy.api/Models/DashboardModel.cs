using System;
using System.Collections.Generic;

namespace edbuddy.api.Models
{
    public class DashboardModel
    {
        public List<Carousel> carousel { get; set; }
        public List<Explore> explore { get; set; }
        public List<Course> courses { get; set; }
        public List<Contest> contest { get; set; }
    }

    public class Carousel
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string ID { get; set; }
        public string Image { get; set; }
    }
    public class Explore
    {
        public string CategoryName { get; set; }
        public string Image { get; set; }
    }
    public class Course
    {
        public string CourseName { get; set; }
        public string CourseDescription { get; set; }
        public int CourseID { get; set; }
        public string CourseImage { get; set; }
    }
    public class Contest
    {
        public int ContestID { get; set; }
        public string ContestName { get; set; }
        public string ContestDescription { get; set; }
        public string ContestImage { get; set; }    
    }
}
