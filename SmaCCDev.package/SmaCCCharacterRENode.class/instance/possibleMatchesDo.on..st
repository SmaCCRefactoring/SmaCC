private
possibleMatchesDo: aBlock on: aStream
	self matchingCharacters
		do:
			[:each | 
			aStream nextPut: each.
			aBlock value.
			aStream skip: -1]