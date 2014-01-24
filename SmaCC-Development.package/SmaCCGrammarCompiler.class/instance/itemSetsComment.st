accessing
itemSetsComment
	| stream |
	stream := WriteStream on: String new.
	itemSets
		keysAndValuesDo:
			[:index :each | 
			stream
				nextPutAll: index printString;
				nextPutAll: each printString;
				cr].
	^stream contents