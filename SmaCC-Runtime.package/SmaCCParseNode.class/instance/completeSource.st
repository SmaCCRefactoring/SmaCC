private
completeSource
	^ parent isNil
		ifTrue: [ self attributeNamed: #source ]
		ifFalse: [ parent completeSource ]