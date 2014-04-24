tests - programs
test_test_1
	 self parse: '
def ident(x):
    return x
def boing(c, d):
    return ident(c)
aap = boing(1,1.0)

'