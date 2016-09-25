private
remove: aCollection
	transitionObjects := transitionObjects copy.
	aCollection
		do: [ :each | transitionObjects remove: each ifAbsent: [  ] ]