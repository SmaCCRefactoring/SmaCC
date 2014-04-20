tests
testSimpleProgram3
	"from https://wiki.python.org/moin/SimplePrograms"
	self parse: 
'friends = [''john'', ''pat'', ''gary'', ''michael'']
for i, name in enumerate(friends):
    print "iteration {iteration} is {name}".format(iteration=i, name=name)
'