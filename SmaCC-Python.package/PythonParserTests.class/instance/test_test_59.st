tests - programs
test_test_59
	 self parse: '
print ''hoi %d %s'' % (2, ''3'')             # [str]

print ''foo\0bar'' != ''foo\0baz''

'