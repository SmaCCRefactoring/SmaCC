public
arguments
	| arguments |
	arguments := OrderedCollection new.
	Smalltalk arguments
		do: [ :arg | 
			('/-' includes: arg first)
				ifFalse: [ arguments add: arg ] ].
	^ arguments