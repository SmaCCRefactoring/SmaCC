accessing
indexFor: anIndex
	^anIndex isInteger ifTrue: [anIndex] ifFalse: [anIndex index]