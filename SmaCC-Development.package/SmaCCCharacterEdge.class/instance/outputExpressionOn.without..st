compiling
outputExpressionOn: aStream without: aSelector 
	| pairs |
	pairs := self minMaxPairsWithout: aSelector.
	pairs isEmpty ifTrue: [^self].
	aSelector notNil ifTrue: [aStream nextPutAll: ' or: ['].
	pairs do: [:each | self outputExpressionFor: each on: aStream]
		separatedBy: [aStream nextPutAll: ' or: ['].
	aStream next: pairs size - 1 put: $].
	aSelector notNil ifTrue: [aStream nextPut: $]]