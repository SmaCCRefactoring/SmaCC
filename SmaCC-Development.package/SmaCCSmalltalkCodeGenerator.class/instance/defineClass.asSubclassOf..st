compiling
defineClass: aString asSubclassOf: aBehavior
	| current variables aCategory |
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
	aCategory := (Smalltalk at: aString asSymbol ifAbsent: [  ]) ifNil: [ #'SmaCC-Examples' ] ifNotNil: [ :c | c category ].
	model
		defineClass:
			aBehavior name , ' subclass: #' , aString , ' instanceVariableNames: ''' , variables
				, ''' classVariableNames: '''' poolDictionaries: '''' category: ''' , aCategory , ''''.
	^ model classNamed: aString asSymbol