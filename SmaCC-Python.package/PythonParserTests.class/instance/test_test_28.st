tests - programs
test_test_28
	 self parse: '
def propagate(la):                       # la: [list(int)]
    print la, la                         # [str], [str]

propagate([1])                           # []
propagate([2])                           # []

'