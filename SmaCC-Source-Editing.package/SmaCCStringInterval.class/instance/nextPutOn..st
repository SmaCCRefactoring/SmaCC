private
nextPutOn: aWriteStream
	self isRemoved
		ifTrue: [ ^ self ].
	aWriteStream next: self size putAll: string startingAt: start