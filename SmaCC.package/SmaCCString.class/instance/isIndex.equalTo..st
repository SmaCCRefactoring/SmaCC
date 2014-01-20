private
isIndex: aIndex equalTo: bIndex
	aIndex = bIndex ifTrue: [^true].
	aIndex class = bIndex class ifTrue: [^false].
	^aIndex isInteger
		ifTrue: [bIndex intervalId = 1 and: [aIndex = bIndex index]]
		ifFalse: [bIndex isInteger and: [aIndex intervalId = 1 and: [aIndex index = bIndex]]]