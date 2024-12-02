using StudentsData;

namespace grebeniuklab2.Strategy
{
    public interface IStrategy
    {
        StudentsCollection Parse(string filePath);
    }
}

