saving
localSaveOn: aStream
	self comment notEmpty
		ifTrue: [ aStream
				nextPut: $";
				nextPutAll: (self comment copyReplaceAll: '"' with: '""');
				nextPut: $";
				cr ].
	aStream
		nextPut: $(;
		cr.
	propertyNames asSortedCollection
		do: [ :each | 
			aStream
				nextPut: $-;
				nextPutAll: each;
				cr ].
	globalValues keys asSortedCollection
		do: [ :each | 
			aStream
				nextPut: $+;
				nextPutAll: each;
				cr ].
	aStream nextPut: $)