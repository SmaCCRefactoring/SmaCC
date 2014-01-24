accessing
modelTypes: anIdentitySet
	| types |
	(anIdentitySet includes: self) ifTrue: [^#()].
	anIdentitySet add: self.
	types := Set new.
	productions do: [:each | types addAll: (each modelTypes: anIdentitySet)].
	anIdentitySet remove: self.
	^types