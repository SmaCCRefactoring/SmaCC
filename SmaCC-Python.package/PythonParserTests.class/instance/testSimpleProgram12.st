tests
testSimpleProgram12
	"from https://wiki.python.org/moin/SimplePrograms"
	self parse: 
'class BankAccount(object):
    def __init__(self, initial_balance=0):
        self.balance = initial_balance
    def deposit(self, amount):
        self.balance += amount
    def withdraw(self, amount):
        self.balance -= amount
    def overdrawn(self):
        return self.balance < 0
my_account = BankAccount(1)
my_account.withdraw(''t'')
print my_account.balance
'