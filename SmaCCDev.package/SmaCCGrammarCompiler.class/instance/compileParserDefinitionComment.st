compiling
compileParserDefinitionComment
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'parserDefinitionComment';
		cr;
		cr;
		tab;
		nextPut: $";
		nextPutAll: (parserDefinitionString copyReplaceAll: '"' with: '""');
		nextPut: $".
	parserClass theMetaClass compile: stream contents
		classified: #'generated-comments'