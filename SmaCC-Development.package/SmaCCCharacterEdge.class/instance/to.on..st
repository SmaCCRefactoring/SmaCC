initialize-release
to: aSmaCCNode on: aStringOrNil
	toNode := aSmaCCNode.
	transitionObjects := aStringOrNil notNil
		ifTrue: [ SmaCCCharacterSet withAll: aStringOrNil ]
		ifFalse: [ nil ]