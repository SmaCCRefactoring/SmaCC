private
createPropertyMethodsFor: aSymbol in: aClass
	| method variable setterName |
	method := self class readerPrototype copy.
	variable := aClass classPool associationAt: aSymbol.
	method literalAt: 1 put: variable.
	method literalAt: 2 put: aSymbol.
	aClass addSelectorSilently: aSymbol withMethod: method.
	setterName := (aSymbol , ':') asSymbol.
	method := self class writerPrototype copy.
	method literalAt: 1 put: variable.
	method literalAt: 2 put: setterName.
	aClass addSelectorSilently: setterName withMethod: method