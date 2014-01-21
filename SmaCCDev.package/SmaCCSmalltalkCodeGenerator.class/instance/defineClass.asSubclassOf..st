compiling
defineClass: aString asSubclassOf: aBehavior
	| current variables |
	current := Smalltalk at: aString asSymbol ifAbsent: [Object].
	variables := ''.
	(current includesBehavior: SmaCCParser) | (current includesBehavior: SmaCCScanner)
		ifTrue:
			[| stream |
			stream := WriteStream on: String new.
			current instVarNames
				do:
					[:each | 
					stream
						nextPutAll: each;
						space].
			variables := stream contents].
	model
		defineClass:
			aBehavior name , ' subclass: #' , aString , ' instanceVariableNames: ''' , variables
				, ''' classVariableNames: '''' poolDictionaries: '''' '.
	^model classNamed: aString asSymbol