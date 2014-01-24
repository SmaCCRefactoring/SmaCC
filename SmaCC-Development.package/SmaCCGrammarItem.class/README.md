SmaCCGrammarItem is an abstract class that represents something defined by the grammar.

Subclasses must implement the following messages:
	accessing
		modelTypes:
	private
		annotateTokenVariables:
		basicModelTypesForVariable:into:seen:
		firstTerminals

Instance Variables
	grammar	<SmaCCGrammar>	the grammar that we are defined in
	variableDefinitions	<OrderedCollection of: SmaCCVariableDefinition>	the variables defined by this item