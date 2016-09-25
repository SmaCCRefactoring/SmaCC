SmaCCSmalltalkCodeGenerator represents a code generator for Smalltalk.

Instance Variables
	isExpressions	<Dictionary key: String value: Symbol>	a map of strings to is??? methods on String that answer true for those strings (e.g., '0123456789' -> #isDigit)
	parseTreeCache	<Dictionary key: Symbol value: RBProgramNode>	mapping from selector names to code compiled in the method
