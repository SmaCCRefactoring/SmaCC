private
deleteAll: aCollection
	aCollection isNil ifTrue: [^self].
	aCollection do: [:each | self delete: each]