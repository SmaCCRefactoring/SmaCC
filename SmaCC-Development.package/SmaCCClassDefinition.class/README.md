SmaCCClassDefinition is an abstract class that represents a class to be created when compiling the parser's parse trees.

Instance Variables:
	class	<RBClass>	the model's class object that is created
	grammar	<SmaCCGrammar>	the grammar that owns this class
	isRoot	<Boolean>	is this the root class that we are generating
	name	<String>	the name of the class
	subclasses	<Collection of: SmaCCNodeClassDefinition>	our subclasses
	superclass	<SmaCCNodeClassDefinition>	our superclass

