accessing
commonSupertypeOf: aCollection
	aCollection isEmpty ifTrue: [^model classFor: Object].
	^aCollection inject: aCollection anyOne into: [:sum :each | self commonSupertypeBetween: sum and: each]