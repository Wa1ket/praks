using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.Services.Client;

namespace praks
{
    /// <summary>
    /// Логика взаимодействия для PageEmployee.xaml
    /// </summary>
    public partial class PageEmployee : Page
    {
        private void GetEmployees()
        {
            var employees = DataEntitiesEmployee.Employees;
            var queryEmployee = from employee in employees
                                orderby employee.Surname
                                select employee;
            foreach(Employee emp in queryEmployee)
            {
                ListEmployee.Add(emp);
            }
            DataGridEmployee.ItemsSource = ListEmployee;

        }
        public PageEmployee()
        {
            DataEntitiesEmployee = new TitleEmployeeEntities();
            InitializeComponent();
            ListEmployee = new ObservableCollection<Employee>();
        }
        public static TitleEmployeeEntities DataEntitiesEmployee { get; set; }
        ObservableCollection<Employee> ListEmployee;
        private bool isDirty = true;

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            GetEmployees();
            DataGridEmployee.SelectedIndex = 0;
 
        }

        private void RewriteEmployee()
        {
            DataEntitiesEmployee = new TitleEmployeeEntities();
            ListEmployee.Clear();
            GetEmployees();
        }
        private void UndoCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            RewriteEmployee();
            DataGridEmployee.IsReadOnly = true;
            isDirty = true;
        }
        private void UndoCommandBinding_CanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = !isDirty;
        }
        private void SaveCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("Сохранить");
            DataEntitiesEmployee.SaveChanges();
            isDirty = true;
            DataGridEmployee.IsReadOnly = true;
        }
        private void SaveCommandBinding_CanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = !isDirty;
        }
        private void EditCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("Редактировать");
            DataGridEmployee.IsReadOnly = false;
            DataGridEmployee.BeginEdit();
            isDirty = false;
        }
        private void EditCommandBinding_CanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = isDirty;
        }
        private void NewCommandBinding_CanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = isDirty;
        }
        private void NewCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            Employee employee =  Employee.CrtEmployee(-1,"не задано","не задано","не задано",0);
            try
            {
                DataEntitiesEmployee.Employees.Add(employee);
                ListEmployee.Add(employee);
                DataGridEmployee.ScrollIntoView(employee);
                DataGridEmployee.SelectedIndex = DataGridEmployee.Items.Count - 1;
                DataGridEmployee.Focus();
                DataGridEmployee.IsReadOnly = false;
                MessageBox.Show("Создать");
                isDirty = false;
            }
            catch (DataServiceRequestException ex)
            {
                throw new ApplicationException("Ошибка добавление нового сотрудника" + ex.ToString());
            }
        }
        private void FindCommandBinding_CanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = isDirty;
        }
        private void FindCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("Создать");
            isDirty = false;
        }
        private void DeleteCommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("Удалено");
            Employee emp = DataGridEmployee.SelectedItems as Employee;
            if(emp != null)
            {
                MessageBoxResult result = MessageBox.Show("Удалить сотрудника" + emp.Surname.Trim() + " "
                                                            + emp.Name.Trim() + " " + emp.Patronymic.Trim(),
                                                            "Предупреждение", MessageBoxButton.OKCancel); 
                if(result == MessageBoxResult.OK)
                {
                    DataEntitiesEmployee.Employees.Remove(emp);
                    DataGridEmployee.SelectedIndex = DataGridEmployee.SelectedIndex == 0 ? 1 : DataGridEmployee.SelectedIndex - 1;
                    ListEmployee.Remove(emp);
                    DataEntitiesEmployee.SaveChanges();
                }
            }
            else
            {
                MessageBox.Show("Выберите строку для удаления");
            }
            isDirty = false;
        }
        private void DeleteCommandBinding_CanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = isDirty;
        }

       

    }
}
