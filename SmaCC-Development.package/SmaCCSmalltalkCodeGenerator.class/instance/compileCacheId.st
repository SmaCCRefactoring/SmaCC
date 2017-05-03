compiling-parser
compileCacheId
	parserClass theMetaClass
		compile:
			(String
				streamContents: [ :stream | 
					stream
						nextPutAll: 'cacheId';
						cr;
						tab;
						nextPutAll: '^''';
						nextPutAll: DateAndTime now printString;
						nextPut: $' ])
		classified: #'generated-accessing'