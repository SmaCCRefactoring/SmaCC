tests - programs
test_test_13
	 self parse: '
class fred:                              # thingy: [int]
    def hottum(self, x):                 # [fred], [str]
        b = 4                            # [int]
        return b                         # [int]

def hottum():
    pass

h = fred()                               # [fred]
c = h.hottum(''jo'')                       # [int]

'