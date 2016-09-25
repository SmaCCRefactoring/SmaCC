private
checkFor: problemSymbols errorMessage: errorMessage
	| stream |
	problemSymbols isEmpty
		ifTrue: [ ^ self ].
	stream := WriteStream with: String new.
	problemSymbols
		do: [ :each | stream nextPutAll: each printString ]
		separatedBy: [ stream space ].
	SmaCCCompilationNotification new
		messageText: errorMessage;
		tag: stream contents;
		signal