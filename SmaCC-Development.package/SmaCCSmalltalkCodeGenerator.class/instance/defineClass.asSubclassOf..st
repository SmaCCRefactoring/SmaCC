compiling
defineClass: aString asSubclassOf: aBehavior
	"If the class already exists, use various optimisations to avoid: erasing user modifications in the scanner class or the parser class, and avoid erasing all instance variables in AST nodes classes."

	| current variables currentCategory |
	current := Smalltalk at: aString asSymbol ifAbsent: [ Object ].
	currentCategory := current == Object
		ifTrue: [ defaultCategory ifNil: [ RPackage defaultPackageName ] ]
		ifFalse: [ current category ].
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
			variables := stream contents.
			model
				defineClass:
					aBehavior name , ' subclass: #' , aString , ' instanceVariableNames: ''' , variables
						, ''' classVariableNames: '''' poolDictionaries: '''' category: ''' , currentCategory , '''' ]
		ifFalse: [ 
			current == Object
				ifTrue: [ 
					model
						defineClass:
							aBehavior name , ' subclass: #' , aString , ' instanceVariableNames: ''' , variables
								, ''' classVariableNames: '''' poolDictionaries: '''' category: ''' , currentCategory , '''' ]
				ifFalse: [ 
					| aRBClass |
					aRBClass := model classNamed: aString asSymbol.
					current instVarNames do: [ :each | model removeInstanceVariable: each from: aRBClass ] ] ].
	^ model classNamed: aString asSymbol