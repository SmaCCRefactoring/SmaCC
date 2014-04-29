tests - programs
test_test_119
	 self parse: '
a = [1,2,3,4,5]                          # [list(int)]

print a[:-1]                             # [list(int)]
print a[1:3]                             # [list(int)]
print a[::]                              # [list(int)]
print a[:3:]                             # [list(int)]
print a[::-1]                            # [list(int)]

'