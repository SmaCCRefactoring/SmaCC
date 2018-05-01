printing
printOn: aStream
	| i |
	i := 0.
	^ collection
		do: [ :each | 
			i := i + 1.
			each printOn: aStream.
			variableNameMap
				keysAndValuesDo: [ :k :v | 
					(v includes: i)
						ifTrue: [ aStream
								space;
								nextPutAll: k printString ] ] ]
		separatedBy: [ aStream space ]