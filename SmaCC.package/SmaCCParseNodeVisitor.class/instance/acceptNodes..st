private
acceptNodes: aCollection
	aCollection do: [:each | self acceptNode: each].
	^aCollection