resources
source_test_28
	^ '
def propagate(la):                       # la: [list(int)]
    print la, la                         # [str], [str]

propagate([1])                           # []
propagate([2])                           # []

'