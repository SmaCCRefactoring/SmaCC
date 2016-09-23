SmaCCVariableDefinition represents a variable for a node class.

Instance Variables
	baseType	<RBAbstractClass>	the type of the variable
	getterMethodName	<Symbol>	the getter selector
	index	<Integer>	the index of the variable (if we are pulling up a collection of variables from a symbol)
	isAlwaysAssigned	<Boolean>	does the variable always have a value or can it be nil
	isCollection	<Boolean>	does the variable represent a collection of values
	setterMethodName	<Symbol>	the setter selector
	variableName	<String>	the name of the variable
