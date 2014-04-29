tests - programs
test_test_11
	 self parse: '
class fred:                              # a: []
    def huh(self):                       # []
        self.a = 1                       # [int]

a = fred()                               # [fred]
a.huh()
b = a.a                                  # [int]

'