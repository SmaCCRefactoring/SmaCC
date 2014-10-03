accessing
at: anIndex
	"Write an ad-hoc at ?"

	| i |
	i := 0.
	self
		do: [ :e | 
			i := i + 1.
			i = anIndex
				ifTrue: [ ^ e ] ].
	self errorSubscriptBounds: anIndex