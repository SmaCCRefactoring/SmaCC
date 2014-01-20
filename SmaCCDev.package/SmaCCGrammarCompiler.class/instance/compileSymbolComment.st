compiling
compileSymbolComment
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'symbolComment';
		cr;
		cr;
		tab;
		nextPut: $";
		cr.
	scannerCompiler symbols keysAndValuesDo: 
			[:index :each | 
			stream
				nextPutAll: index printString;
				nextPutAll: '. ';
				nextPutAll: (each printString copyReplaceAll: '"' with: '""');
				cr].
	stream nextPut: $".
	self parserClass theMetaClass compile: stream contents
		classified: #'generated-comments'