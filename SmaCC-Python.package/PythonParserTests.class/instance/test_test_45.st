tests - programs
test_test_45
	 self parse: '
class bert:
    def __repr__(self):                  # self: []
        return ''bert''                    # [str]

y = None                                 # [None]
y = bert()                               # [bert()]

if y:                                    # [int]
    print y                            # [str]

z = None                                 # [None]
z = [1]                                  # [int]

if z:                                    # [int]
    print z                            # [str]

'