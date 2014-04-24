tests - programs
test_test_82
	 self parse: '
vars = [1]                               # [list(int)]

def bla():
    return [var for var in vars]                # []

a = bla()                                    # []

'