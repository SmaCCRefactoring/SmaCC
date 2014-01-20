compiling-scanner
compileScannerDefinitionComment
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'scannerDefinitionComment';
		cr;
		cr;
		tab;
		nextPut: $";
		nextPutAll: (scannerDefinitionString copyReplaceAll: '"' with: '""');
		nextPut: $".
	self scannerClass theMetaClass compile: stream contents
		classified: #'generated-comments'