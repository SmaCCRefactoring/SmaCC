compiling
removeOldMethods
	self
		removeOldMethodsFrom: scannerClass;
		removeOldMethodsFrom: scannerClass metaclass;
		removeOldMethodsFrom: parserClass;
		removeOldMethodsFrom: parserClass metaclass