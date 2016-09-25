saving
localSaveOn: aStream
	self comment notEmpty
		ifTrue:
			[ aStream
				nextPut: $";
				nextPutAll: (self comment copyReplaceAll: '"' with: '""');
				nextPut: $";
				cr ].
	match saveOn: aStream.
	aStream
		cr;
		nextPutAll: '->';
		cr.
	transformation saveOn: aStream