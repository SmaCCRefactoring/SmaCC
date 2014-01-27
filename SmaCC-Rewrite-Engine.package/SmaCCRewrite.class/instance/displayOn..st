printing
displayOn: aStream
	self comment notEmpty ifTrue: [aStream nextPutAll: self comment] ifFalse: [match displayOn: aStream]