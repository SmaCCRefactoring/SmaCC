action table
singleActionTableRow: row forAction: anInteger
	| stream |
	stream := self compressedRowStream.
	stream nextPut: 0.
	self writeInteger: anInteger on: stream.
	row
		keysAndValuesDo:
			[ :index :each | 
			each ~= 3
				ifTrue: [ self writeInteger: index on: stream ] ].
	^ stream contents