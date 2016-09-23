private
pluralNameFor: aString
	| size |
	(self pluralNameBlock value: aString)
		ifNotNil: [ :result | ^ result ].
	size := aString size.
	1 to: size do:
		[ :i | 
		(self pluralNames
			at: (aString copyFrom: size - i + 1 to: size)
			ifAbsent: [ nil ])
			ifNotNil: [ :ending | ^ (aString copyFrom: 1 to: size - i) , ending ] ].
	^ aString copyWith: $s