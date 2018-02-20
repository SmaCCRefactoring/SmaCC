accessing
stepToIndex
	^ self session scanner stream
		in: [ :s | 
			s atEnd
				ifTrue: [ s position ]
				ifFalse: [ s position + 1 ] ]