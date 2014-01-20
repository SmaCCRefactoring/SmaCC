private
addVariablesFrom: anObject
	| myCompositeVariables mySingularVariables |
	(anObject isKindOf: SmaCCParseNode)
		ifFalse: [ ^ self ].
	myCompositeVariables := self compositeVariables.
	mySingularVariables := self singularVariables.
	anObject compositeVariables
		do: [ :each | 
			(myCompositeVariables includes: each)
				ifTrue: [ (self perform: each) addAll: (anObject perform: each) ] ].
	anObject singularVariables
		do: [ :each | 
			| newName |
			newName := self pluralVariablesMap at: each ifAbsent: [ each ].
			(myCompositeVariables includes: newName)
				ifTrue: [ (self perform: newName asSymbol) add: (anObject perform: each) ]
				ifFalse: [ 
					(mySingularVariables includes: each)
						ifTrue: [ self perform: (each , ':') asSymbol with: (anObject perform: each) ] ] ]