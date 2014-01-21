accessing
symbolsComment
	| stream |
	stream := WriteStream on: String new.
	scannerCompiler symbols
		keysAndValuesDo:
			[:index :each | 
			stream
				nextPutAll: index printString;
				nextPutAll: '. ';
				nextPutAll: each printString;
				cr].
	^stream contents