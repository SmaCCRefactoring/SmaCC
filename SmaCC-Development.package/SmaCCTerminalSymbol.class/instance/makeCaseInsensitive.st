private
makeCaseInsensitive
	regularExpression notNil
		ifTrue: [ regularExpression makeCaseInsensitive ]