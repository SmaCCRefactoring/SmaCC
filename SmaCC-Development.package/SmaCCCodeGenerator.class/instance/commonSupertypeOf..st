accessing
commonSupertypeOf: aCollection
	aCollection isEmpty
		ifTrue: [ ^ self objectClass ].
	^ aCollection
		inject: aCollection anyOne
		into: [ :sum :each | self commonSupertypeBetween: sum and: each ]