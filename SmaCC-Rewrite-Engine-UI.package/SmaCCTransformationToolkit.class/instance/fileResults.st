accessing
fileResults
	^ resultsList ifNil: [ resultsList := CollectionValueHolder value: OrderedCollection new ]