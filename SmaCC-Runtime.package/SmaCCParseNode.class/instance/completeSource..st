private
completeSource: aString
	^ parent isNil
		ifTrue: [ 
			(Smalltalk at: #SmaCCString ifAbsent: [ nil ])
				ifNotNil: [ :stringClass | self attributeNamed: #source put: (stringClass on: aString) ] ]
		ifFalse: [ parent completeSource: aString ]