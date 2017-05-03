rewriting
clearLocalVariablesIn: aClass
	propertyNames do: [ :each | aClass classPool at: each asSymbol put: nil ]