enum Skill { FLUTTER, DART, OTHER }
class Address {
 final String _street;
  final String _city;
  final String _zipCode;
  Address({required String street, required String city, required String zipCode})
      : _street = street,
        _city = city,
        _zipCode = zipCode;
}
class Employee {
  final String _name;
  final double _baseSalary;
  List<Skill> _skills;
  final Address _address;
  int _yearsOfExperience;
  Employee({required String name, required double baseSalary, required Address address, required int yearsOfExperience, required List<Skill> skills})
      : _name = name,
        _baseSalary = baseSalary,
        _address = address,
        _yearsOfExperience = yearsOfExperience,
        _skills = skills;

  Employee.mobileDeveloper({required String name, required double baseSalay, required Address address, required int yearsOfExperience})
      : _name = name,
        _baseSalary = baseSalay,
        _address = address,
        _yearsOfExperience = yearsOfExperience,
        _skills = [Skill.FLUTTER, Skill.DART];
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double calculateSalary(){
    double totalSalary = _baseSalary;
    totalSalary += _yearsOfExperience * 2000;
    switch (_skills){
      case [Skill.FLUTTER]:
        totalSalary += 5000;
        break;
      case [Skill.DART]:
        totalSalary += 2000;
        break;
      default:
        totalSalary += 1000;
    }
    return totalSalary;
  }
  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary} : skills: ${skills} : totalSalary: \$${calculateSalary()}');
  }
}

void main() {
  Employee emp1 = Employee(name: "Bob", baseSalary: 50000, address: Address(street: "456 Elm St", city: "Othertown", zipCode: "67890"), yearsOfExperience: 3, skills: [Skill.OTHER]);
  final emp2 = Employee.mobileDeveloper(
    name: "Sokea",
    baseSalay: 40000,
    address: Address(street: "123 Main St", city: "Anytown", zipCode: "12345"),
    yearsOfExperience: 5,
  );
  emp1.printDetails();
  emp2.printDetails();

  
}