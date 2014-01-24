accessing
errorBlock: aBlock
	^ [ :ex | 
	| returnValue |
	returnValue := aBlock argumentCount = 3
		ifTrue: [ aBlock value: ex tag value: ex description value: ex tag ]
		ifFalse: [ 
			aBlock argumentCount = 1
				ifTrue: [ aBlock value: ex tag ]
				ifFalse: [ aBlock value: ex description value: ex tag position ] ].
	ex return: returnValue ]