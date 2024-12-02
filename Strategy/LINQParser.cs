using StudentsData;
using System.Xml.Linq;

namespace grebeniuklab2.Strategy
{
    public class LINQParser : IStrategy
    {
        public StudentsCollection Parse(string filePath)
        {
            XDocument xml = XDocument.Load(filePath);
            var studentsList = new StudentsCollection { Students = new List<Student>() };

            foreach (var studentElement in xml.Descendants("Student"))
            {
                var student = new Student
                {
                    FullName = (string)studentElement.Attribute("FullName"),
                    Discipline = (string)studentElement.Attribute("Discipline"),
                    Teacher = (string)studentElement.Attribute("Teacher"),
                    Specialization = (string)studentElement.Attribute("Specialization"),
                    Group = (string)studentElement.Attribute("Group"),
                    Disciplines = studentElement.Descendants("Discipline").Select(s => new Discipline
                    {
                        Name = (string)s.Attribute("Name"),
                        Grade = (string)s.Attribute("Grade")
                    }).ToList()
                };
                studentsList.Students.Add(student);
            }

            return studentsList;
        }
    }
}
