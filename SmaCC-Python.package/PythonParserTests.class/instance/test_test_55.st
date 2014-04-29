tests - programs
test_test_55
	 self parse: '
a={}                                     # [dict(int->list(float))]
a.setdefault(1,[]).append(1.0)           # []

b= a[1]                                  # [list(float)]

'