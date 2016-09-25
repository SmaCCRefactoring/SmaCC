public
modelTypes: anIdentitySet
	"Yes, I know it is a hack"

	IsCaching
		ifTrue: [ ^ self basicModelTypes: anIdentitySet ].
	IsCaching := true.
	^ [ super modelTypes: anIdentitySet ]
		ensure: [ IsCaching := false ]