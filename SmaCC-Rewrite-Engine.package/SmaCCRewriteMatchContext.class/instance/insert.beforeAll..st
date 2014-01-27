private
insert: aString beforeAll: aCollection
	aCollection isNil ifTrue: [^self].
	aCollection do: [:each | self insert: aString before: each]