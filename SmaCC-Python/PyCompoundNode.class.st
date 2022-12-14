Class {
	#name : #PyCompoundNode,
	#superclass : #PyRootNode,
	#instVars : [
		'ifTokens',
		'ifs',
		'colonTokens',
		'then',
		'elsif',
		'elses',
		'whileToken',
		'ones',
		'orTokens',
		'twos',
		'elseTokens',
		'lambdaTokens',
		'argumentses',
		'bodies',
		'tests',
		'commaTokens',
		'equalTokens',
		'yieldTokens',
		'plusEqualTokens',
		'minusEqualTokens',
		'timesEqualTokens',
		'divideEqualTokens',
		'percentEqualTokens',
		'andEqualTokens',
		'orEqualTokens',
		'upArrowEqualTokens',
		'lessThanLessThanEqualTokens',
		'greaterThanGreaterThanEqualTokens',
		'timesTimesEqualTokens',
		'divideDivideEqualTokens',
		'printTokens',
		'greaterThanGreaterThanTokens',
		'delTokens',
		'passTokens',
		'breakTokens',
		'continueTokens',
		'returnTokens',
		'argses',
		'raiseTokens',
		'arg1s',
		'arg2s',
		'arg3s',
		'importTokens',
		'names',
		'asTokens',
		'renames',
		'fromTokens',
		'froms',
		'timesTokens',
		'lparenTokens',
		'rparenTokens',
		'globalTokens',
		'execTokens',
		'inTokens',
		'assertTokens',
		'conditions',
		'semicolonTokens',
		'simples',
		'nEWLINETokens',
		'iNDENTTokens',
		'statements',
		'dEDENTTokens',
		'forTokens',
		'trailers',
		'tryToken',
		'exceptTokens',
		'finallyToken',
		'withToken',
		'defToken',
		'fname',
		'parameters',
		'classToken',
		'cname',
		'_Tokens',
		'periodTokens',
		'timesTimesTokens',
		'nameTokens'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyCompoundNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
PyCompoundNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitCompound: self
]

{ #category : #generated }
PyCompoundNode >> andEqualTokens [
	^ andEqualTokens
]

{ #category : #generated }
PyCompoundNode >> andEqualTokens: anOrderedCollection [
	andEqualTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> arg1s [
	^ arg1s
]

{ #category : #generated }
PyCompoundNode >> arg1s: anOrderedCollection [
	arg1s := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> arg2s [
	^ arg2s
]

{ #category : #generated }
PyCompoundNode >> arg2s: anOrderedCollection [
	arg2s := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> arg3s [
	^ arg3s
]

{ #category : #generated }
PyCompoundNode >> arg3s: anOrderedCollection [
	arg3s := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> argses [
	^ argses
]

{ #category : #generated }
PyCompoundNode >> argses: anOrderedCollection [
	argses := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> argumentses [
	^ argumentses
]

{ #category : #generated }
PyCompoundNode >> argumentses: anOrderedCollection [
	argumentses := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> asTokens [
	^ asTokens
]

{ #category : #generated }
PyCompoundNode >> asTokens: anOrderedCollection [
	asTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> assertTokens [
	^ assertTokens
]

{ #category : #generated }
PyCompoundNode >> assertTokens: anOrderedCollection [
	assertTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> bodies [
	^ bodies
]

{ #category : #generated }
PyCompoundNode >> bodies: anOrderedCollection [
	bodies := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> breakTokens [
	^ breakTokens
]

{ #category : #generated }
PyCompoundNode >> breakTokens: anOrderedCollection [
	breakTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> classToken [
	^ classToken
]

{ #category : #generated }
PyCompoundNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
PyCompoundNode >> cname [
	^ cname
]

{ #category : #generated }
PyCompoundNode >> cname: aSmaCCToken [
	cname := aSmaCCToken
]

{ #category : #generated }
PyCompoundNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
PyCompoundNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyCompoundNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> compositeNodeVariables [
	^ #(#ones #twos #statements)
]

{ #category : #generated }
PyCompoundNode >> compositeTokenVariables [
	^ #(#ifTokens #colonTokens #orTokens #elseTokens #lambdaTokens #commaTokens #equalTokens #yieldTokens #plusEqualTokens #minusEqualTokens #timesEqualTokens #divideEqualTokens #percentEqualTokens #andEqualTokens #orEqualTokens #upArrowEqualTokens #lessThanLessThanEqualTokens #greaterThanGreaterThanEqualTokens #timesTimesEqualTokens #divideDivideEqualTokens #printTokens #greaterThanGreaterThanTokens #delTokens #passTokens #breakTokens #continueTokens #returnTokens #raiseTokens #importTokens #asTokens #renames #fromTokens #timesTokens #lparenTokens #rparenTokens #globalTokens #nameTokens #execTokens #inTokens #assertTokens #semicolonTokens #nEWLINETokens #iNDENTTokens #dEDENTTokens #forTokens #exceptTokens #_Tokens #periodTokens #timesTimesTokens)
]

{ #category : #generated }
PyCompoundNode >> conditions [
	^ conditions
]

{ #category : #generated }
PyCompoundNode >> conditions: anOrderedCollection [
	conditions := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> continueTokens [
	^ continueTokens
]

{ #category : #generated }
PyCompoundNode >> continueTokens: anOrderedCollection [
	continueTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> dEDENTTokens [
	^ dEDENTTokens
]

{ #category : #generated }
PyCompoundNode >> dEDENTTokens: anOrderedCollection [
	dEDENTTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> defToken [
	^ defToken
]

{ #category : #generated }
PyCompoundNode >> defToken: aSmaCCToken [
	defToken := aSmaCCToken
]

{ #category : #generated }
PyCompoundNode >> delTokens [
	^ delTokens
]

{ #category : #generated }
PyCompoundNode >> delTokens: anOrderedCollection [
	delTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> divideDivideEqualTokens [
	^ divideDivideEqualTokens
]

{ #category : #generated }
PyCompoundNode >> divideDivideEqualTokens: anOrderedCollection [
	divideDivideEqualTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> divideEqualTokens [
	^ divideEqualTokens
]

{ #category : #generated }
PyCompoundNode >> divideEqualTokens: anOrderedCollection [
	divideEqualTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> elseTokens [
	^ elseTokens
]

{ #category : #generated }
PyCompoundNode >> elseTokens: anOrderedCollection [
	elseTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> elses [
	^ elses
]

{ #category : #generated }
PyCompoundNode >> elses: anOrderedCollection [
	elses := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> elsif [
	^ elsif
]

{ #category : #generated }
PyCompoundNode >> elsif: aPyRootNode [
	self elsif notNil
		ifTrue: [ self elsif parent: nil ].
	elsif := aPyRootNode.
	self elsif notNil
		ifTrue: [ self elsif parent: self ]
]

{ #category : #generated }
PyCompoundNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
PyCompoundNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> exceptTokens [
	^ exceptTokens
]

{ #category : #generated }
PyCompoundNode >> exceptTokens: anOrderedCollection [
	exceptTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> execTokens [
	^ execTokens
]

{ #category : #generated }
PyCompoundNode >> execTokens: anOrderedCollection [
	execTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> finallyToken [
	^ finallyToken
]

{ #category : #generated }
PyCompoundNode >> finallyToken: aSmaCCToken [
	finallyToken := aSmaCCToken
]

{ #category : #generated }
PyCompoundNode >> fname [
	^ fname
]

{ #category : #generated }
PyCompoundNode >> fname: aSmaCCToken [
	fname := aSmaCCToken
]

{ #category : #generated }
PyCompoundNode >> forTokens [
	^ forTokens
]

{ #category : #generated }
PyCompoundNode >> forTokens: anOrderedCollection [
	forTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> fromTokens [
	^ fromTokens
]

{ #category : #generated }
PyCompoundNode >> fromTokens: anOrderedCollection [
	fromTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> froms [
	^ froms
]

{ #category : #generated }
PyCompoundNode >> froms: anOrderedCollection [
	froms := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> globalTokens [
	^ globalTokens
]

{ #category : #generated }
PyCompoundNode >> globalTokens: anOrderedCollection [
	globalTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> greaterThanGreaterThanEqualTokens [
	^ greaterThanGreaterThanEqualTokens
]

{ #category : #generated }
PyCompoundNode >> greaterThanGreaterThanEqualTokens: anOrderedCollection [
	greaterThanGreaterThanEqualTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> greaterThanGreaterThanTokens [
	^ greaterThanGreaterThanTokens
]

{ #category : #generated }
PyCompoundNode >> greaterThanGreaterThanTokens: anOrderedCollection [
	greaterThanGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> iNDENTTokens [
	^ iNDENTTokens
]

{ #category : #generated }
PyCompoundNode >> iNDENTTokens: anOrderedCollection [
	iNDENTTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> ifTokens [
	^ ifTokens
]

{ #category : #generated }
PyCompoundNode >> ifTokens: anOrderedCollection [
	ifTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> ifs [
	^ ifs
]

{ #category : #generated }
PyCompoundNode >> ifs: anOrderedCollection [
	ifs := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> importTokens [
	^ importTokens
]

{ #category : #generated }
PyCompoundNode >> importTokens: anOrderedCollection [
	importTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> inTokens [
	^ inTokens
]

{ #category : #generated }
PyCompoundNode >> inTokens: anOrderedCollection [
	inTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
PyCompoundNode >> initialize [
	super initialize.
	ifTokens := OrderedCollection new: 2.
	ifs := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	elses := OrderedCollection new: 2.
	ones := OrderedCollection new: 2.
	orTokens := OrderedCollection new: 2.
	twos := OrderedCollection new: 2.
	elseTokens := OrderedCollection new: 2.
	lambdaTokens := OrderedCollection new: 2.
	argumentses := OrderedCollection new: 2.
	bodies := OrderedCollection new: 2.
	tests := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	yieldTokens := OrderedCollection new: 2.
	plusEqualTokens := OrderedCollection new: 2.
	minusEqualTokens := OrderedCollection new: 2.
	timesEqualTokens := OrderedCollection new: 2.
	divideEqualTokens := OrderedCollection new: 2.
	percentEqualTokens := OrderedCollection new: 2.
	andEqualTokens := OrderedCollection new: 2.
	orEqualTokens := OrderedCollection new: 2.
	upArrowEqualTokens := OrderedCollection new: 2.
	lessThanLessThanEqualTokens := OrderedCollection new: 2.
	greaterThanGreaterThanEqualTokens := OrderedCollection new: 2.
	timesTimesEqualTokens := OrderedCollection new: 2.
	divideDivideEqualTokens := OrderedCollection new: 2.
	printTokens := OrderedCollection new: 2.
	greaterThanGreaterThanTokens := OrderedCollection new: 2.
	delTokens := OrderedCollection new: 2.
	passTokens := OrderedCollection new: 2.
	breakTokens := OrderedCollection new: 2.
	continueTokens := OrderedCollection new: 2.
	returnTokens := OrderedCollection new: 2.
	argses := OrderedCollection new: 2.
	raiseTokens := OrderedCollection new: 2.
	arg1s := OrderedCollection new: 2.
	arg2s := OrderedCollection new: 2.
	arg3s := OrderedCollection new: 2.
	importTokens := OrderedCollection new: 2.
	names := OrderedCollection new: 2.
	asTokens := OrderedCollection new: 2.
	renames := OrderedCollection new: 2.
	fromTokens := OrderedCollection new: 2.
	froms := OrderedCollection new: 2.
	timesTokens := OrderedCollection new: 2.
	lparenTokens := OrderedCollection new: 2.
	rparenTokens := OrderedCollection new: 2.
	globalTokens := OrderedCollection new: 2.
	nameTokens := OrderedCollection new: 2.
	execTokens := OrderedCollection new: 2.
	inTokens := OrderedCollection new: 2.
	assertTokens := OrderedCollection new: 2.
	conditions := OrderedCollection new: 2.
	semicolonTokens := OrderedCollection new: 2.
	simples := OrderedCollection new: 2.
	nEWLINETokens := OrderedCollection new: 2.
	iNDENTTokens := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
	dEDENTTokens := OrderedCollection new: 2.
	forTokens := OrderedCollection new: 2.
	trailers := OrderedCollection new: 2.
	exceptTokens := OrderedCollection new: 2.
	_Tokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	timesTimesTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyCompoundNode >> lambdaTokens [
	^ lambdaTokens
]

{ #category : #generated }
PyCompoundNode >> lambdaTokens: anOrderedCollection [
	lambdaTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> lessThanLessThanEqualTokens [
	^ lessThanLessThanEqualTokens
]

{ #category : #generated }
PyCompoundNode >> lessThanLessThanEqualTokens: anOrderedCollection [
	lessThanLessThanEqualTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> lparenTokens [
	^ lparenTokens
]

{ #category : #generated }
PyCompoundNode >> lparenTokens: anOrderedCollection [
	lparenTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> minusEqualTokens [
	^ minusEqualTokens
]

{ #category : #generated }
PyCompoundNode >> minusEqualTokens: anOrderedCollection [
	minusEqualTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> nEWLINETokens [
	^ nEWLINETokens
]

{ #category : #generated }
PyCompoundNode >> nEWLINETokens: anOrderedCollection [
	nEWLINETokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> nameTokens [
	^ nameTokens
]

{ #category : #generated }
PyCompoundNode >> nameTokens: anOrderedCollection [
	nameTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> names [
	^ names
]

{ #category : #generated }
PyCompoundNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> nodeVariables [
	^ #(#elsif #parameters)
]

{ #category : #generated }
PyCompoundNode >> ones [
	^ ones
]

{ #category : #generated }
PyCompoundNode >> ones: anOrderedCollection [
	self setParents: self ones to: nil.
	ones := anOrderedCollection.
	self setParents: self ones to: self
]

{ #category : #generated }
PyCompoundNode >> orEqualTokens [
	^ orEqualTokens
]

{ #category : #generated }
PyCompoundNode >> orEqualTokens: anOrderedCollection [
	orEqualTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> orTokens [
	^ orTokens
]

{ #category : #generated }
PyCompoundNode >> orTokens: anOrderedCollection [
	orTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> otherVariables [
	^ #(#ifs #then #elses #argumentses #bodies #tests #argses #arg1s #arg2s #arg3s #names #froms #conditions #simples #trailers)
]

{ #category : #generated }
PyCompoundNode >> parameters [
	^ parameters
]

{ #category : #generated }
PyCompoundNode >> parameters: aPyVarArgListNode [
	self parameters notNil
		ifTrue: [ self parameters parent: nil ].
	parameters := aPyVarArgListNode.
	self parameters notNil
		ifTrue: [ self parameters parent: self ]
]

{ #category : #generated }
PyCompoundNode >> passTokens [
	^ passTokens
]

{ #category : #generated }
PyCompoundNode >> passTokens: anOrderedCollection [
	passTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> percentEqualTokens [
	^ percentEqualTokens
]

{ #category : #generated }
PyCompoundNode >> percentEqualTokens: anOrderedCollection [
	percentEqualTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
PyCompoundNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> pluralVariablesMap [
	^ Dictionary new
		at: 'ifToken' put: 'ifTokens';
		at: 'if' put: 'ifs';
		at: 'colonToken' put: 'colonTokens';
		at: 'else' put: 'elses';
		at: 'one' put: 'ones';
		at: 'orToken' put: 'orTokens';
		at: 'two' put: 'twos';
		at: 'elseToken' put: 'elseTokens';
		at: 'lambdaToken' put: 'lambdaTokens';
		at: 'arguments' put: 'argumentses';
		at: 'body' put: 'bodies';
		at: 'test' put: 'tests';
		at: 'commaToken' put: 'commaTokens';
		at: 'equalToken' put: 'equalTokens';
		at: 'yieldToken' put: 'yieldTokens';
		at: 'plusEqualToken' put: 'plusEqualTokens';
		at: 'minusEqualToken' put: 'minusEqualTokens';
		at: 'timesEqualToken' put: 'timesEqualTokens';
		at: 'divideEqualToken' put: 'divideEqualTokens';
		at: 'percentEqualToken' put: 'percentEqualTokens';
		at: 'andEqualToken' put: 'andEqualTokens';
		at: 'orEqualToken' put: 'orEqualTokens';
		at: 'upArrowEqualToken' put: 'upArrowEqualTokens';
		at: 'lessThanLessThanEqualToken' put: 'lessThanLessThanEqualTokens';
		at: 'greaterThanGreaterThanEqualToken' put: 'greaterThanGreaterThanEqualTokens';
		at: 'timesTimesEqualToken' put: 'timesTimesEqualTokens';
		at: 'divideDivideEqualToken' put: 'divideDivideEqualTokens';
		at: 'printToken' put: 'printTokens';
		at: 'greaterThanGreaterThanToken' put: 'greaterThanGreaterThanTokens';
		at: 'delToken' put: 'delTokens';
		at: 'passToken' put: 'passTokens';
		at: 'breakToken' put: 'breakTokens';
		at: 'continueToken' put: 'continueTokens';
		at: 'returnToken' put: 'returnTokens';
		at: 'args' put: 'argses';
		at: 'raiseToken' put: 'raiseTokens';
		at: 'arg1' put: 'arg1s';
		at: 'arg2' put: 'arg2s';
		at: 'arg3' put: 'arg3s';
		at: 'importToken' put: 'importTokens';
		at: 'name' put: 'names';
		at: 'asToken' put: 'asTokens';
		at: 'rename' put: 'renames';
		at: 'fromToken' put: 'fromTokens';
		at: 'from' put: 'froms';
		at: 'timesToken' put: 'timesTokens';
		at: 'lparenToken' put: 'lparenTokens';
		at: 'rparenToken' put: 'rparenTokens';
		at: 'globalToken' put: 'globalTokens';
		at: 'nameToken' put: 'nameTokens';
		at: 'execToken' put: 'execTokens';
		at: 'inToken' put: 'inTokens';
		at: 'assertToken' put: 'assertTokens';
		at: 'condition' put: 'conditions';
		at: 'semicolonToken' put: 'semicolonTokens';
		at: 'simple' put: 'simples';
		at: 'nEWLINEToken' put: 'nEWLINETokens';
		at: 'iNDENTToken' put: 'iNDENTTokens';
		at: 'statement' put: 'statements';
		at: 'dEDENTToken' put: 'dEDENTTokens';
		at: 'forToken' put: 'forTokens';
		at: 'trailer' put: 'trailers';
		at: 'exceptToken' put: 'exceptTokens';
		at: '_Token' put: '_Tokens';
		at: 'periodToken' put: 'periodTokens';
		at: 'timesTimesToken' put: 'timesTimesTokens';
		yourself
]

{ #category : #generated }
PyCompoundNode >> plusEqualTokens [
	^ plusEqualTokens
]

{ #category : #generated }
PyCompoundNode >> plusEqualTokens: anOrderedCollection [
	plusEqualTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> printTokens [
	^ printTokens
]

{ #category : #generated }
PyCompoundNode >> printTokens: anOrderedCollection [
	printTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> raiseTokens [
	^ raiseTokens
]

{ #category : #generated }
PyCompoundNode >> raiseTokens: anOrderedCollection [
	raiseTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> renames [
	^ renames
]

{ #category : #generated }
PyCompoundNode >> renames: anOrderedCollection [
	renames := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> returnTokens [
	^ returnTokens
]

{ #category : #generated }
PyCompoundNode >> returnTokens: anOrderedCollection [
	returnTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> rparenTokens [
	^ rparenTokens
]

{ #category : #generated }
PyCompoundNode >> rparenTokens: anOrderedCollection [
	rparenTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
PyCompoundNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> simples [
	^ simples
]

{ #category : #generated }
PyCompoundNode >> simples: anOrderedCollection [
	simples := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> statements [
	^ statements
]

{ #category : #generated }
PyCompoundNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
PyCompoundNode >> tests [
	^ tests
]

{ #category : #generated }
PyCompoundNode >> tests: anOrderedCollection [
	tests := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> then [
	^ then
]

{ #category : #generated }
PyCompoundNode >> then: anOrderedCollection [
	then := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> timesEqualTokens [
	^ timesEqualTokens
]

{ #category : #generated }
PyCompoundNode >> timesEqualTokens: anOrderedCollection [
	timesEqualTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> timesTimesEqualTokens [
	^ timesTimesEqualTokens
]

{ #category : #generated }
PyCompoundNode >> timesTimesEqualTokens: anOrderedCollection [
	timesTimesEqualTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> timesTimesTokens [
	^ timesTimesTokens
]

{ #category : #generated }
PyCompoundNode >> timesTimesTokens: anOrderedCollection [
	timesTimesTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> timesTokens [
	^ timesTokens
]

{ #category : #generated }
PyCompoundNode >> timesTokens: anOrderedCollection [
	timesTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> tokenVariables [
	^ #(#whileToken #tryToken #finallyToken #withToken #defToken #fname #classToken #cname)
]

{ #category : #generated }
PyCompoundNode >> trailers [
	^ trailers
]

{ #category : #generated }
PyCompoundNode >> trailers: anOrderedCollection [
	trailers := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> tryToken [
	^ tryToken
]

{ #category : #generated }
PyCompoundNode >> tryToken: aSmaCCToken [
	tryToken := aSmaCCToken
]

{ #category : #generated }
PyCompoundNode >> twos [
	^ twos
]

{ #category : #generated }
PyCompoundNode >> twos: anOrderedCollection [
	self setParents: self twos to: nil.
	twos := anOrderedCollection.
	self setParents: self twos to: self
]

{ #category : #generated }
PyCompoundNode >> upArrowEqualTokens [
	^ upArrowEqualTokens
]

{ #category : #generated }
PyCompoundNode >> upArrowEqualTokens: anOrderedCollection [
	upArrowEqualTokens := anOrderedCollection
]

{ #category : #generated }
PyCompoundNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
PyCompoundNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]

{ #category : #generated }
PyCompoundNode >> withToken [
	^ withToken
]

{ #category : #generated }
PyCompoundNode >> withToken: aSmaCCToken [
	withToken := aSmaCCToken
]

{ #category : #generated }
PyCompoundNode >> yieldTokens [
	^ yieldTokens
]

{ #category : #generated }
PyCompoundNode >> yieldTokens: anOrderedCollection [
	yieldTokens := anOrderedCollection
]
