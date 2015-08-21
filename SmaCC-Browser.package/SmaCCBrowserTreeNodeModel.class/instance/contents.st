accessing
contents
	"The contents are cached."

	contents isNil
		ifTrue: [ contents := super contents ].
	^ contents