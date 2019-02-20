private
doesNode: aNode contain: anObject
	aNode
		allNodesDo: [ :each | 
			each == anObject
				ifTrue: [ ^ true ] ]
		andTokensDo: [ :each | 
			each == anObject
				ifTrue: [ ^ true ] ].
	^ false