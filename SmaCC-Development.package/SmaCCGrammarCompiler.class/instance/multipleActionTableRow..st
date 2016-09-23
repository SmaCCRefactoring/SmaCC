action table
multipleActionTableRow: row
	| stream |
	stream := self compressedRowStream.
	stream nextPut: 1.
	row
		keysAndValuesDo:
			[ :index :each | 
			each ~= 3
				ifTrue:
					[ self writeInteger: each on: stream.
					self writeInteger: index on: stream ] ].
	^ stream contents