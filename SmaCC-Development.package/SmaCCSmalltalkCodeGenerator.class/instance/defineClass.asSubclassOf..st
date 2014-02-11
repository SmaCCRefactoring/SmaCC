compiling
defineClass: aString asSubclassOf: aBehavior
	| current variables currentCategory |
	current := Smalltalk at: aString asSymbol ifAbsent: [ Object ].
	variables := ''.
	(current includesBehavior: SmaCCParser) | (current includesBehavior: SmaCCScanner)
		ifTrue: [ 
			| stream |
			stream := WriteStream on: String new.
			current instVarNames
				do: [ :each | 
					stream
						nextPutAll: each;
						space ].
			variables := stream contents ].
	currentCategory := (Smalltalk at: aString asSymbol ifAbsent: [  ])
		ifNil: [ self category ]
		ifNotNil: [ :c | c category ].
	model
		defineClass:
			aBehavior name , ' subclass: #' , aString , ' instanceVariableNames: ''' , variables
				, ''' classVariableNames: '''' poolDictionaries: '''' category: ''' , currentCategory , ''''.
	^ model classNamed: aString asSymbol