private
shouldAddVariablesFrom: aSmaCCRHS
	| theirType |
	ourType isNil
		ifTrue: [ ^ true ].
	theirType := aSmaCCRHS nodeType.
	theirType isNil
		ifTrue: [ ^ true ].
	ourType = theirType
		ifTrue: [ ^ true ].
	^ (theirType hierarchyIncludes: ourType) not