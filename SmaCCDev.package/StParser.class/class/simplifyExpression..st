private
simplifyExpression: aSequenceNode 
	^aSequenceNode isNil
		ifFalse: [ 
	
	(aSequenceNode statements size == 1 
		and: [aSequenceNode temporaries isEmpty]) 
			ifTrue: [aSequenceNode statements first]
			ifFalse: [aSequenceNode] ]