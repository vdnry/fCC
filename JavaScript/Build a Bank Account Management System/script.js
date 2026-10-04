class BankAccount {
  constructor() {
    this.balance = 0;
    this.transactions = []
  }

  deposit(amt) {
    if (amt > 0) {
      this.transactions.push({type: "deposit", amount: amt})
      this.balance += amt;
      return `Successfully deposited $${amt}. New balance: $${this.balance}`;
    } else return "Deposit amount must be greater than zero."
  }

  withdraw(amt) {
    if (amt > 0 && amt <= this.balance) {
      this.transactions.push({type: "withdraw", amount: amt});
      this.balance -= amt;
      return `Successfully withdrew $${amt}. New balance: $${this.balance}`;
    } else return "Insufficient balance or invalid amount."
  }

  checkBalance() {
    return `Current balance: $${this.balance}`;
  }

  listAllDeposits() {
    const arr = this.transactions.filter(i => i.type == "deposit").reduce((a, c) => {a.push(c.amount); return a;}, []);
    return "Deposits: " + arr.join(",")
  }

  listAllWithdrawals() {
    const arr = this.transactions.filter(i => i.type == "withdraw").reduce((a, c) => {a.push(c.amount); return a;}, []);
    return "Withdrawals: " + arr.join(",")
  }
}

const myAccount = new BankAccount();

myAccount.deposit(100);
myAccount.withdraw(50);
myAccount.deposit(200);
myAccount.deposit(300);
myAccount.withdraw(400);

console.log(myAccount.listAllDeposits());
console.log(myAccount.listAllWithdrawals());

console.log(myAccount.checkBalance());