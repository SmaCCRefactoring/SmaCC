saving
localSaveOn: aStream
	self comment notEmpty
		ifTrue: [ aStream
				nextPut: $";
				nextPutAll: (self comment copyReplaceAll: '"' with: '""');
				nextPut: $";
				cr ].
	aStream
		nextPut: $#;
		nextPutAll: (self source copyReplaceAll: '!' with: '!!');
		nextPut: $!