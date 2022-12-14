Class {
	#name : #PyStatementNode,
	#superclass : #PyRootNode,
	#instVars : [
		'tests',
		'commaTokens',
		'equalTokens',
		'yieldTokens',
		'argumentses',
		'plusEqualToken',
		'minusEqualToken',
		'timesEqualToken',
		'divideEqualToken',
		'percentEqualToken',
		'andEqualToken',
		'orEqualToken',
		'upArrowEqualToken',
		'lessThanLessThanEqualToken',
		'greaterThanGreaterThanEqualToken',
		'timesTimesEqualToken',
		'divideDivideEqualToken',
		'printToken',
		'greaterThanGreaterThanToken',
		'delToken',
		'trailers',
		'ones',
		'orTokens',
		'twos',
		'passToken',
		'breakToken',
		'continueToken',
		'returnToken',
		'args',
		'raiseToken',
		'arg1',
		'arg2',
		'arg3',
		'importToken',
		'names',
		'asTokens',
		'renames',
		'fromToken',
		'from',
		'timesToken',
		'lparenToken',
		'rparenToken',
		'globalToken',
		'nameTokens',
		'execToken',
		'inToken',
		'ifTokens',
		'ifs',
		'elseTokens',
		'elses',
		'lambdaTokens',
		'colonTokens',
		'bodies',
		'assertToken',
		'condition',
		'semicolonToken',
		'simple',
		'nEWLINEToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyStatementNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitStatement: self
]

{ #category : #generated }
PyStatementNode >> andEqualToken [
	^ andEqualToken
]

{ #category : #generated }
PyStatementNode >> andEqualToken: aSmaCCToken [
	andEqualToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> arg1 [
	^ arg1
]

{ #category : #generated }
PyStatementNode >> arg1: anOrderedCollection [
	arg1 := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> arg2 [
	^ arg2
]

{ #category : #generated }
PyStatementNode >> arg2: anOrderedCollection [
	arg2 := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> arg3 [
	^ arg3
]

{ #category : #generated }
PyStatementNode >> arg3: anOrderedCollection [
	arg3 := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> args [
	^ args
]

{ #category : #generated }
PyStatementNode >> args: anOrderedCollection [
	args := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> argumentses [
	^ argumentses
]

{ #category : #generated }
PyStatementNode >> argumentses: anOrderedCollection [
	argumentses := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> asTokens [
	^ asTokens
]

{ #category : #generated }
PyStatementNode >> asTokens: anOrderedCollection [
	asTokens := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> assertToken [
	^ assertToken
]

{ #category : #generated }
PyStatementNode >> assertToken: aSmaCCToken [
	assertToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> bodies [
	^ bodies
]

{ #category : #generated }
PyStatementNode >> bodies: anOrderedCollection [
	bodies := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> breakToken [
	^ breakToken
]

{ #category : #generated }
PyStatementNode >> breakToken: aSmaCCToken [
	breakToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
PyStatementNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyStatementNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> compositeNodeVariables [
	^ #(#ones #twos #ifs)
]

{ #category : #generated }
PyStatementNode >> compositeTokenVariables [
	^ #(#commaTokens #equalTokens #yieldTokens #orTokens #asTokens #renames #nameTokens #ifTokens #elseTokens #lambdaTokens #colonTokens)
]

{ #category : #generated }
PyStatementNode >> condition [
	^ condition
]

{ #category : #generated }
PyStatementNode >> condition: anOrderedCollection [
	condition := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> continueToken [
	^ continueToken
]

{ #category : #generated }
PyStatementNode >> continueToken: aSmaCCToken [
	continueToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> delToken [
	^ delToken
]

{ #category : #generated }
PyStatementNode >> delToken: aSmaCCToken [
	delToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> divideDivideEqualToken [
	^ divideDivideEqualToken
]

{ #category : #generated }
PyStatementNode >> divideDivideEqualToken: aSmaCCToken [
	divideDivideEqualToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> divideEqualToken [
	^ divideEqualToken
]

{ #category : #generated }
PyStatementNode >> divideEqualToken: aSmaCCToken [
	divideEqualToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> elseTokens [
	^ elseTokens
]

{ #category : #generated }
PyStatementNode >> elseTokens: anOrderedCollection [
	elseTokens := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> elses [
	^ elses
]

{ #category : #generated }
PyStatementNode >> elses: anOrderedCollection [
	elses := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
PyStatementNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> execToken [
	^ execToken
]

{ #category : #generated }
PyStatementNode >> execToken: aSmaCCToken [
	execToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> from [
	^ from
]

{ #category : #generated }
PyStatementNode >> from: anObject [
	from := anObject
]

{ #category : #generated }
PyStatementNode >> fromToken [
	^ fromToken
]

{ #category : #generated }
PyStatementNode >> fromToken: aSmaCCToken [
	fromToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> globalToken [
	^ globalToken
]

{ #category : #generated }
PyStatementNode >> globalToken: aSmaCCToken [
	globalToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> greaterThanGreaterThanEqualToken [
	^ greaterThanGreaterThanEqualToken
]

{ #category : #generated }
PyStatementNode >> greaterThanGreaterThanEqualToken: aSmaCCToken [
	greaterThanGreaterThanEqualToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> greaterThanGreaterThanToken [
	^ greaterThanGreaterThanToken
]

{ #category : #generated }
PyStatementNode >> greaterThanGreaterThanToken: aSmaCCToken [
	greaterThanGreaterThanToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> ifTokens [
	^ ifTokens
]

{ #category : #generated }
PyStatementNode >> ifTokens: anOrderedCollection [
	ifTokens := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> ifs [
	^ ifs
]

{ #category : #generated }
PyStatementNode >> ifs: anOrderedCollection [
	self setParents: self ifs to: nil.
	ifs := anOrderedCollection.
	self setParents: self ifs to: self
]

{ #category : #generated }
PyStatementNode >> importToken [
	^ importToken
]

{ #category : #generated }
PyStatementNode >> importToken: aSmaCCToken [
	importToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> inToken [
	^ inToken
]

{ #category : #generated }
PyStatementNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyStatementNode >> initialize [
	super initialize.
	tests := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	yieldTokens := OrderedCollection new: 2.
	argumentses := OrderedCollection new: 2.
	trailers := OrderedCollection new: 2.
	ones := OrderedCollection new: 2.
	orTokens := OrderedCollection new: 2.
	twos := OrderedCollection new: 2.
	names := OrderedCollection new: 2.
	asTokens := OrderedCollection new: 2.
	renames := OrderedCollection new: 2.
	nameTokens := OrderedCollection new: 2.
	ifTokens := OrderedCollection new: 2.
	ifs := OrderedCollection new: 2.
	elseTokens := OrderedCollection new: 2.
	elses := OrderedCollection new: 2.
	lambdaTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	bodies := OrderedCollection new: 2.
]

{ #category : #generated }
PyStatementNode >> lambdaTokens [
	^ lambdaTokens
]

{ #category : #generated }
PyStatementNode >> lambdaTokens: anOrderedCollection [
	lambdaTokens := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> lessThanLessThanEqualToken [
	^ lessThanLessThanEqualToken
]

{ #category : #generated }
PyStatementNode >> lessThanLessThanEqualToken: aSmaCCToken [
	lessThanLessThanEqualToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> lparenToken [
	^ lparenToken
]

{ #category : #generated }
PyStatementNode >> lparenToken: aSmaCCToken [
	lparenToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> minusEqualToken [
	^ minusEqualToken
]

{ #category : #generated }
PyStatementNode >> minusEqualToken: aSmaCCToken [
	minusEqualToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> nEWLINEToken [
	^ nEWLINEToken
]

{ #category : #generated }
PyStatementNode >> nEWLINEToken: aSmaCCToken [
	nEWLINEToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> nameTokens [
	^ nameTokens
]

{ #category : #generated }
PyStatementNode >> nameTokens: anOrderedCollection [
	nameTokens := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> names [
	^ names
]

{ #category : #generated }
PyStatementNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> ones [
	^ ones
]

{ #category : #generated }
PyStatementNode >> ones: anOrderedCollection [
	self setParents: self ones to: nil.
	ones := anOrderedCollection.
	self setParents: self ones to: self
]

{ #category : #generated }
PyStatementNode >> orEqualToken [
	^ orEqualToken
]

{ #category : #generated }
PyStatementNode >> orEqualToken: aSmaCCToken [
	orEqualToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> orTokens [
	^ orTokens
]

{ #category : #generated }
PyStatementNode >> orTokens: anOrderedCollection [
	orTokens := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> otherVariables [
	^ #(#tests #argumentses #trailers #args #arg1 #arg2 #arg3 #names #from #elses #bodies #condition #simple)
]

{ #category : #generated }
PyStatementNode >> passToken [
	^ passToken
]

{ #category : #generated }
PyStatementNode >> passToken: aSmaCCToken [
	passToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> percentEqualToken [
	^ percentEqualToken
]

{ #category : #generated }
PyStatementNode >> percentEqualToken: aSmaCCToken [
	percentEqualToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> pluralVariablesMap [
	^ Dictionary new
		at: 'test' put: 'tests';
		at: 'commaToken' put: 'commaTokens';
		at: 'equalToken' put: 'equalTokens';
		at: 'yieldToken' put: 'yieldTokens';
		at: 'arguments' put: 'argumentses';
		at: 'trailer' put: 'trailers';
		at: 'one' put: 'ones';
		at: 'orToken' put: 'orTokens';
		at: 'two' put: 'twos';
		at: 'name' put: 'names';
		at: 'asToken' put: 'asTokens';
		at: 'rename' put: 'renames';
		at: 'nameToken' put: 'nameTokens';
		at: 'ifToken' put: 'ifTokens';
		at: 'if' put: 'ifs';
		at: 'elseToken' put: 'elseTokens';
		at: 'else' put: 'elses';
		at: 'lambdaToken' put: 'lambdaTokens';
		at: 'colonToken' put: 'colonTokens';
		at: 'body' put: 'bodies';
		yourself
]

{ #category : #generated }
PyStatementNode >> plusEqualToken [
	^ plusEqualToken
]

{ #category : #generated }
PyStatementNode >> plusEqualToken: aSmaCCToken [
	plusEqualToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> printToken [
	^ printToken
]

{ #category : #generated }
PyStatementNode >> printToken: aSmaCCToken [
	printToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> raiseToken [
	^ raiseToken
]

{ #category : #generated }
PyStatementNode >> raiseToken: aSmaCCToken [
	raiseToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> renames [
	^ renames
]

{ #category : #generated }
PyStatementNode >> renames: anOrderedCollection [
	renames := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> returnToken [
	^ returnToken
]

{ #category : #generated }
PyStatementNode >> returnToken: aSmaCCToken [
	returnToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> rparenToken [
	^ rparenToken
]

{ #category : #generated }
PyStatementNode >> rparenToken: aSmaCCToken [
	rparenToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
PyStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> simple [
	^ simple
]

{ #category : #generated }
PyStatementNode >> simple: anOrderedCollection [
	simple := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> tests [
	^ tests
]

{ #category : #generated }
PyStatementNode >> tests: anOrderedCollection [
	tests := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> timesEqualToken [
	^ timesEqualToken
]

{ #category : #generated }
PyStatementNode >> timesEqualToken: aSmaCCToken [
	timesEqualToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> timesTimesEqualToken [
	^ timesTimesEqualToken
]

{ #category : #generated }
PyStatementNode >> timesTimesEqualToken: aSmaCCToken [
	timesTimesEqualToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> timesToken [
	^ timesToken
]

{ #category : #generated }
PyStatementNode >> timesToken: aSmaCCToken [
	timesToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> tokenVariables [
	^ #(#plusEqualToken #minusEqualToken #timesEqualToken #divideEqualToken #percentEqualToken #andEqualToken #orEqualToken #upArrowEqualToken #lessThanLessThanEqualToken #greaterThanGreaterThanEqualToken #timesTimesEqualToken #divideDivideEqualToken #printToken #greaterThanGreaterThanToken #delToken #passToken #breakToken #continueToken #returnToken #raiseToken #importToken #fromToken #timesToken #lparenToken #rparenToken #globalToken #execToken #inToken #assertToken #semicolonToken #nEWLINEToken)
]

{ #category : #generated }
PyStatementNode >> trailers [
	^ trailers
]

{ #category : #generated }
PyStatementNode >> trailers: anOrderedCollection [
	trailers := anOrderedCollection
]

{ #category : #generated }
PyStatementNode >> twos [
	^ twos
]

{ #category : #generated }
PyStatementNode >> twos: anOrderedCollection [
	self setParents: self twos to: nil.
	twos := anOrderedCollection.
	self setParents: self twos to: self
]

{ #category : #generated }
PyStatementNode >> upArrowEqualToken [
	^ upArrowEqualToken
]

{ #category : #generated }
PyStatementNode >> upArrowEqualToken: aSmaCCToken [
	upArrowEqualToken := aSmaCCToken
]

{ #category : #generated }
PyStatementNode >> yieldTokens [
	^ yieldTokens
]

{ #category : #generated }
PyStatementNode >> yieldTokens: anOrderedCollection [
	yieldTokens := anOrderedCollection
]
