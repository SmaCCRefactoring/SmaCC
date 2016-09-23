accessing
position: anInteger
	anInteger > lastPosition
		ifTrue:
			[ sourceStream position: lastPosition.
			[ sourceStream position < anInteger and: [ sourceStream atEnd not ] ]
				whileTrue: [ self next ] ]
		ifFalse: [ sourceStream position: anInteger ]