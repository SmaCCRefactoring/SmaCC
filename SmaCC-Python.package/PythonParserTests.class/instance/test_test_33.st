tests - programs
test_test_33
	 self parse: '
#a = 1                                    # [int]
#a = 1                                    # [int]
b = 1                                    # [int]
a = ''hoi''                                # [str]

print a                                  # [int, str]
print b                                  # [int]

'