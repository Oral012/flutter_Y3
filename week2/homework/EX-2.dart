class BankAccount {
    // TODO
   final String accountId;
    final String userName;
    double _balance;
    BankAccount({required this.accountId, required this.userName, required double balance}) : _balance = balance;
    double get balance => _balance;
    void withdraw(double amount) {
        if (amount > _balance) {
            throw Exception('Insufficient funds!');
        }
        _balance -= amount;
    }
    void credit(double amount) {
        _balance += amount;
    }

}

class Bank {
    // TODO
    final String bankName;
    final List<BankAccount> _accounts = [];
    Bank({required this.bankName});
    BankAccount createAccount({required String Id, required String userName}){
        if (_accounts.any((acc)=> acc.accountId == Id)){
            throw Exception('$Id already exists!');
        }
      BankAccount newAccount = BankAccount(accountId: Id, userName: userName, balance: 0);
      _accounts.add(newAccount);
        return newAccount;
    }
}
 
void main() {

  Bank myBank = Bank(bankName: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(Id: "100", userName: "Ronan");

  print(ronanAccount.balance); 
  ronanAccount.credit(100);
  print(ronanAccount.balance); 
  ronanAccount.withdraw(50);
  print(ronanAccount.balance);

  // try {
  //   ronanAccount.withdraw(75); 
  // } catch (e) {
  //   print(e); 
  // }

  // try {
  //   myBank.createAccount(Id: "100", userName: "Honlgy"); 
  // } catch (e) {
  //   print(e); 
  // }
}
