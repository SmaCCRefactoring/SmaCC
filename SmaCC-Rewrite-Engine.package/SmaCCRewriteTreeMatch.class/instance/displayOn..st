printing
displayOn: aStream
	aStream
		nextPutAll:
			((source isNil or: [ source isEmpty ])
				ifTrue: [ '"Empty"' ]
				ifFalse: [ source ])