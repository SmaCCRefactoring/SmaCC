compiling
compileInto: aClass usingSelectorMap: aDictionary 
	| methodNodes methodMap index |
	methodNodes := self statesToMakeIntoMethods.
	methodMap := self methodNameMapFor: methodNodes.
	index := 0.
	methodNodes do: 
			[:each | 
			| stream |
			stream := WriteStream with: String new.
			stream
				nextPutAll: (each = self 
							ifTrue: ['scanForToken']
							ifFalse: ['scan' , (index := index + 1) printString]);
				cr.
			stream nextPutAll: (each 
						asStatement: methodMap
						usingSelectorMap: aDictionary
						forClass: aClass).
			aClass 
				compile: (self optimizedParseTreeFor: stream contents) formattedCode
				classified: #'generated-scanner']