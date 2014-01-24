SmaCCCodeGenerator is an abstract class that is used to generate code. Subclasses are used to generate code for a particular language (e.g., Smalltalk, Java, etc.).

Subclasses must implement the following messages:
	code generation templates
		comment:
		method:type:
		method:type:argumentName:argumentType:
		method:type:argumentName:argumentType:argumentName:argumentType:
		reduceAction:
		send:to:with:
		send:to:with:with:
		send:to:with:with:with:
		superMessage:
		superMessage:argument:
		superMessage:argument:argument:
		variableReference:in:
	compiling
		compileChanges
		compileMethodWithoutFormattingIn:
		compileScannerClassIntoParser
		outputStreamClass
		removeOldMethods
	compiling-nodes
		compileInitializeMethod:
	compiling-scanner
		acceptStateEdge:
		closestIsExpressionsFor:seen:
		compileKeywordInitializerUsing:
		defineClass:asSubclassOf:
		outputInvertedMatchFor:on:
		outputIsSelector:on:
		outputMatchFor:on:without:
		scannerActionFor:
		scannerClass:
		selectorMap:
		writeMatchingCodeFor:
	private
		addVariable:forDefinition:
		defaultNodeReductionSource:
		removeOldMethodsFrom:
		send:to:
		writeTransitionTableEntry:on:firstIsType:
	reduction table
		basicCompileSourceFor:
		defaultReductionSource

Instance Variables
	ambiguousActions	<SequenceableCollection of: SequenceableCollection>	the ambiguous actions for the grammar
	codeStream	<Stream>	a stream for writing the code
	grammar	<SmaCCGrammar>	the grammar we are compiling
	model	<RBRootNamespace>	the model for the system that we are compiling
	parserClass	<RBClass>	the model's class for the parser
	reduceActionCache	<Dictionary key: SmaCCReduceAction value: String>	mapping from reduce actions to their code
	scannerClass	<RBClass>	the model's class for the scanner