accessing
action: aSmaCCSymbol prefer: aClass
	| action |
	action := nil.
	self
		do:
			[:each | 
			| eachAction |
			eachAction := each action: aSmaCCSymbol.
			action := action isNil ifTrue: [eachAction] ifFalse: [action mergeWith: eachAction prefer: aClass]].
	action signalAllWarnings.
	^action