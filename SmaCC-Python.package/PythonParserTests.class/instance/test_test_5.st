tests - programs
test_test_5
	 self parse: '
class fred:
    def speak(self, x):
        return x
b = fred()
c = b.speak(''goedzo!'')

'