compiling-scanner
methodNameMap: aSmaCCNode forMethods: methodNodes
	| index methodMap |
	methodMap := Dictionary new.
	index := 0.
	methodNodes
		do:
			[ :value | 
			methodMap
				at: value
				put:
					(value = aSmaCCNode
						ifTrue: [ #scanForToken ]
						ifFalse: [ 'scan' , (index := index + 1) printString ]) ].
	^ methodMap