compiling
compileItemSetsComment
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'itemSetsComment';
		cr;
		cr;
		tab;
		nextPut: $";
		cr.
	itemSets keysAndValuesDo: 
			[:index :each | 
			stream
				nextPutAll: index printString;
				nextPutAll: (each printString copyReplaceAll: '"' with: '""');
				cr].
	stream nextPut: $".
	self parserClass theMetaClass compile: stream contents
		classified: #'generated-comments'