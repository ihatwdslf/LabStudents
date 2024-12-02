using grebeniuklab2.Strategy;
using StudentsData;

namespace grebeniuklab2;

public partial class ResultPage : ContentPage
{
    public StudentsCollection Students { get; set; }

    public ResultPage(string filePath, StudentsCollection result)
    {
        InitializeComponent();
        Students = result;
        BindingContext = Students;
    }
}