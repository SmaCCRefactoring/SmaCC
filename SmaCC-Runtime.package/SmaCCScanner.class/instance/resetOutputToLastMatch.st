private
resetOutputToLastMatch
	outputStream position: lastOutputStreamMatchPosition.
	lastOutputStreamMatchPosition == 0
		ifTrue:
			[ lastMatchWasEmpty
				ifTrue: [ self scannerError ].
			lastMatchWasEmpty := true ]
		ifFalse: [ lastMatchWasEmpty := false ]