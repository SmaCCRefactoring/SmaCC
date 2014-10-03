enumerating
do: aBlock
	^ super do: [ :each | aBlock value: (Character value: each) ]