saving
save

	filename asFileReference writeStreamDo: [ :stream |
		parserClass ifNotNil: [
			stream
				nextPutAll: 'Parser: ';
				nextPutAll: parserClass name;
				cr;
				cr ].
		rewrites do: [ :each | each saveOn: stream ] separatedBy: [
			stream
				cr;
				cr ].
		isModified := false ].
	timestamp := self currentFileTimestamp