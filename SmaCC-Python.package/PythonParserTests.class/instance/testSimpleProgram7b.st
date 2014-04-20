tests
testSimpleProgram7b
	"from https://wiki.python.org/moin/SimplePrograms"
	self parse: 
'prices = {''apple'': 40, ''banana'': 50}
my_purchase = {
    ''apple'': 1,
    ''banana'': 6}
grocery_bill = sum(prices[fruit] * my_purchase[fruit]
                   for fruit in my_purchase)
print ''I owe the grocer $%.2f'' % grocery_bill
'