public
saveTo: filename
	| stream |
	stream := FileStream forceNewFileNamed: filename.
	[ stream
		nextPutAll: 'self';
		crtab;
		nextPutAll: 'inputParserClass: ';
		nextPutAll: self inputParserClass storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'validationParserClass: ';
		nextPutAll: self validationParserClass storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'loadRewriteFile: ';
		nextPutAll: self rewrites filename storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'files: ';
		nextPutAll: self files asArray storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'outputDirectory: ';
		nextPutAll: self outputDirectory storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'createSubdirectories: ';
		nextPutAll: self createSubdirectories storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'server: ';
		nextPutAll: self server storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'runOnServer: ';
		nextPutAll: self runOnServer storeString ]
		ensure: [ stream close ].
	modified := false.
	self areRewritesModified
		ifTrue: [ self saveRewrites ]