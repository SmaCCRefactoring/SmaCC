"
I hold the type inferencing logic that establish how instance variables for AST nodes are computed.

A variable can be the following five types:
- single token (a token)
- multiple tokens (a possibly empty collection of tokens)
- single variable (an ast node)
- collection variable (a possibly empty collection of ast nodes)
- unknown

An additional information is the fact a variable may hold nil.

Type information on a variable may change its name; for example, collection variables are 'pluralised' (an s is added to the name: 'argument'may become 'arguments');

My entry point is SmaCCVariableCalculation>>#calculateVariablesForGrammar:

All my methods are private, they are only used internally. My results are returned by side effects inside the grammar, by decorating the grammar rules with variable information.

Type inference is very sensitive... writing the wrong semantic item just makes the system guess totally wrong and create unneeded dependents, and there is no unit tests.
"
Class {
	#name : #SmaCCVariableCalculation,
	#superclass : #Object,
	#instVars : [
		'grammar',
		'todo',
		'dependentsMap',
		'newVariables',
		'ourType',
		'currentRHS',
		'previousVariables'
	],
	#category : 'SmaCC-Development'
}

{ #category : #accessing }
SmaCCVariableCalculation class >> calculateVariablesForGrammar: aSmaCCGrammar [
	self new calculateVariablesForGrammar: aSmaCCGrammar
]

{ #category : #private }
SmaCCVariableCalculation >> addDependent: dependentSmaCCRHS to: aSmaCCRHS [
	(dependentsMap at: aSmaCCRHS ifAbsentPut: [ IdentitySet new ])
		add: dependentSmaCCRHS
]

{ #category : #private }
SmaCCVariableCalculation >> addExternallyDefinedVariablesFrom: aSmaCCRHS [
	aSmaCCRHS variableDefinitions
		do:
			[ :each | 
			| variable |
			variable := self variableNamed: each variableName.
			(each isCollection
				or:
					[ (currentRHS locallyDefinesVariable: each variableName)
						or: [ previousVariables includes: each variableName ] ])
				ifTrue: [ variable isCollection: true ] ]
]

{ #category : #private }
SmaCCVariableCalculation >> addLocallyDefinedVariable: aString [
	(self hasVariableNamed: aString)
		ifTrue: [ (self variableNamed: aString) isCollection: true ]
		ifFalse: [ self addVariableNamed: aString ]
]

{ #category : #private }
SmaCCVariableCalculation >> addRHS: aSmaCCRHS [
	(todo identityIncludes: aSmaCCRHS)
		ifTrue: [ ^ self ].
	todo add: aSmaCCRHS
]

{ #category : #private }
SmaCCVariableCalculation >> addRenamedVariableName: aString from: symbol [
	"when we add a variable and testing for existence, isCollection is allways false"

	(self hasVariableNamed: aString)
		ifTrue: [ (self variableNamed: aString) isCollection: true ]
		ifFalse: [ | variable |
			variable := self addVariableNamed: aString.
			symbol returnsSingleVariable
				ifTrue: [ symbol
						productionsDo: [ :rhs | 
							rhs variableDefinitions notEmpty
								ifTrue: [ variable
										isCollection:
											(variable isCollection
												or: [ rhs variableDefinitions first isCollection ]) ] ] ] ]
]

{ #category : #private }
SmaCCVariableCalculation >> addVariableNamed: aString [
	^ newVariables add: (SmaCCVariableDefinition variableName: aString)
]

{ #category : #private }
SmaCCVariableCalculation >> assignVariables [
	currentRHS variableDefinitions: newVariables
]

{ #category : #private }
SmaCCVariableCalculation >> calculateNewVariables [
	ourType := currentRHS nodeType.
	newVariables := OrderedCollection new.
	previousVariables := #().
	currentRHS
		variablesAndSymbolsDo:
			[ :variable :symbol | 
			variable isNil
				ifTrue: [ self processUnnamedSymbol: symbol ]
				ifFalse:
					[ symbol returnsSingleVariable
						ifTrue: [ self addRenamedVariableName: variable from: symbol ]
						ifFalse: [ self addLocallyDefinedVariable: variable ] ].
			previousVariables := newVariables
				collect: [ :each | each variableName ] ]
]

{ #category : #private }
SmaCCVariableCalculation >> calculateVariables [
	self rhsDo: [ :each | self addRHS: each ].
	[ todo notEmpty ]
		whileTrue: [ self calculateVariablesFor: todo removeFirst ]
]

{ #category : #private }
SmaCCVariableCalculation >> calculateVariablesFor: aSmaCCRHS [
	currentRHS := aSmaCCRHS.
	self calculateNewVariables.
	self hasVariableChanges
		ifTrue: [ self assignVariables.
			self recalculateDependents ]
]

{ #category : #private }
SmaCCVariableCalculation >> calculateVariablesForGrammar: aSmaCCGrammar [
	grammar := aSmaCCGrammar.
	dependentsMap := IdentityDictionary new.
	todo := OrderedCollection new.
	self setupVariableDependents.
	self calculateVariables
]

{ #category : #private }
SmaCCVariableCalculation >> hasVariableChanges [
	^ newVariables
		anySatisfy: [ :each | (currentRHS variableDefinitions includes: each) not ]
]

{ #category : #private }
SmaCCVariableCalculation >> hasVariableNamed: aString [
	^ newVariables anySatisfy: [ :each | each variableName = aString ]
]

{ #category : #private }
SmaCCVariableCalculation >> processUnnamedSymbol: aSmaCCSymbol [
	aSmaCCSymbol
		productionsDo:
			[ :rhs | 
			(self shouldAddVariablesFrom: rhs)
				ifTrue: [ self addExternallyDefinedVariablesFrom: rhs ] ]
]

{ #category : #private }
SmaCCVariableCalculation >> recalculateDependents [
	(dependentsMap at: currentRHS ifAbsent: [ #() ])
		do: [ :each | self addRHS: each ]
]

{ #category : #private }
SmaCCVariableCalculation >> rhsDo: aBlock [
	grammar symbols
		do: [ :each | 
			each isStartingSymbol
				ifFalse: [ each productionsDo: aBlock ] ]
]

{ #category : #private }
SmaCCVariableCalculation >> setupVariableDependents [
	self rhsDo: [ :rhs | self setupVariableDependentsFor: rhs ]
]

{ #category : #private }
SmaCCVariableCalculation >> setupVariableDependentsFor: aSmaCCRHS [
	aSmaCCRHS
		variablesAndSymbolsDo:
			[ :variable :symbol | 
			(variable isNil or: [ symbol returnsSingleVariable ])
				ifTrue: [ symbol
						productionsDo: [ :rhs | self addDependent: aSmaCCRHS to: rhs ] ] ]
]

{ #category : #private }
SmaCCVariableCalculation >> shouldAddVariablesFrom: aSmaCCRHS [
	| theirType |
	ourType isNil
		ifTrue: [ ^ true ].
	theirType := aSmaCCRHS nodeType.
	theirType isNil
		ifTrue: [ ^ true ].
	ourType = theirType
		ifTrue: [ ^ true ].
	^ (theirType hierarchyIncludes: ourType) not
]

{ #category : #private }
SmaCCVariableCalculation >> variableNamed: aString [
	^ newVariables
		detect: [ :each | each variableName = aString ]
		ifNone: [ self addVariableNamed: aString ]
]
