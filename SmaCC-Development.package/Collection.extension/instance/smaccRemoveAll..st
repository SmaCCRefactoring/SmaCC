*smacc-development
smaccRemoveAll: aCollection
	aCollection do: [ :each | self remove: aCollection ifAbsent: [  ] ].
	^ aCollection