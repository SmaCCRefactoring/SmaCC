saving
save
	| stream |
	stream := FileStream forceNewFileNamed: filename.
	[ parserClass notNil
		ifTrue:
			[ stream
				nextPutAll: 'Parser: ';
				nextPutAll: parserClass name;
				cr;
				cr ].
	rewrites
		do: [ :each | each saveOn: stream ]
		separatedBy: [ stream
				cr;
				cr ].
	isModified := false ]
		ensure: [ stream close ].
	timestamp := self currentFileTimestamp