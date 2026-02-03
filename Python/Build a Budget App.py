class Category:
    def __init__(self, name):
        self.name = name
        self.ledger = []
        self.balance = 0
        self.spent = 0
    
    def deposit(self, amount, description=''):
        self.ledger.append({'amount': amount, 'description': description})
        self.balance += amount

    def withdraw(self, amount, description=''):
        self.ledger.append({'amount': -amount, 'description': description})
        if self.check_funds(amount):
            self.balance -= amount
            self.spent += amount
            return True
        else:
            return False

    def get_balance(self):
        return self.balance

    def transfer(self, amount, destination):
        if self.check_funds(amount):
            self.withdraw(amount, f'Transfer to {destination.name}')
            destination.deposit(amount, f'Transfer from {self.name}')
            return True
        else:
            return False
    
    def check_funds(self, amount):
        if self.balance >= amount:
            return True
        else:
            return False

    def __str__(self):
        nameLen = len(self.name)
        lenL = int((30 - nameLen) / 2)
        starL = '*' * lenL
        starR = '*' * (30 - nameLen - lenL)
        title = f'{starL}{self.name}{starR}\n'
        total = f'Total: {self.balance:.2f}'
        entries = ''
        for entry in self.ledger:
            amt, desc = entry.values()
            lenDesc = len(desc)
            fDesc = ''
            lenAmt = len(f'{amt:.2f}')
            whiteAmt = ' ' * (7 - lenAmt)
            fAmt = f'{whiteAmt}{amt:.2f}'[0:7]
            if lenDesc >= 23:
                fDesc = desc[:23]
            else:
                whiteDesc = " " * (23 - lenDesc)
                fDesc = desc[:lenDesc] + whiteDesc
            entries += f'{fDesc}{fAmt}\n'
        return title + entries + total

food = Category('Food')
food.deposit(1000, 'deposit')
food.withdraw(10.15, 'groceries')
food.withdraw(15.89, 'restaurant and more food for dessert')
clothing = Category('Clothing')
food.transfer(50, clothing)
print(food)
print()

categories = [food, clothing]

def percentageIterator(cap, percentages):
    returnString = ''
    for i in percentages:
        if cap <= i:
            returnString += 'o  '
        else:
            returnString += '   '
    return returnString

def categoryIterator(categories):
    categoryNames = [i.name for i in categories]
    longest = 0
    returnString = ''
    for i in categoryNames:
        if len(i) > longest:
            longest = len(i)
    for i in range(longest):
        returnString += '     '
        for j in categoryNames:
            if len(j) > i:
                returnString += j[i] + '  '
            else:
                returnString += '   '
        if i != longest - 1:     
            returnString += '\n'
    return returnString

def create_spend_chart(categories):
    totalSpent = 0
    categorySpent = []
    percentages = []
    for i in categories:
        totalSpent += i.spent
        categorySpent.append(i.spent)
    for i in categorySpent:
        percentages.append(int(i/totalSpent*10) * 10)
    finalPrint = 'Percentage spent by category\n'
    for i in range(100, -1, -10):
        if i == 100:
            finalPrint += f'{i}| '
            finalPrint += percentageIterator(i, percentages) + '\n'
        elif i == 0:
            finalPrint += f'  {i}| '
            finalPrint += percentageIterator(i, percentages) + '\n'
        else:
             finalPrint += f' {i}| '
             finalPrint += percentageIterator(i, percentages) + '\n'
    finalPrint += '    ' + '-' + '-' * len(percentages) * 3 + '\n'
    finalPrint += categoryIterator(categories)
    return finalPrint

print(create_spend_chart(categories))