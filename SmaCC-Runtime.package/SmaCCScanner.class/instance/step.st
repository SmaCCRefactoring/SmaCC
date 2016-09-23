private
step
	stream atEnd
		ifTrue: [ ^ returnMatchBlock value: self reportLastMatch ].
	currentCharacter := stream next.
	outputStream nextPut: currentCharacter