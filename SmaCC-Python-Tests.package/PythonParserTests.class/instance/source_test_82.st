resources
source_test_82
	^ '
vars = [1]                               # [list(int)]

def bla():
    return [var for var in vars]                # []

a = bla()                                    # []

'