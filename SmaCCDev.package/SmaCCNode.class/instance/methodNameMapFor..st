compiling
methodNameMapFor: methodNodes 
	| index methodMap |
	methodMap := Dictionary new.
	index := 0.
	methodNodes do: 
			[:value | 
			methodMap at: value
				put: (value = self 
						ifTrue: ['^self scanForToken']
						ifFalse: ['^self scan' , (index := index + 1) printString])].
	^methodMap