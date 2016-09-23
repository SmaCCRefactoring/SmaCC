running
readBytesFrom: aStream
	^aStream next: (self nextInteger: aStream)