printing
displayOn: aStream
	self comment notEmpty
		ifTrue: [ aStream nextPutAll: self comment ]
		ifFalse: [ | stream |
			stream := ReadStream on: self source.
			aStream
				nextPutAll: 'Method: ';
				nextPutAll: stream nextLine ]