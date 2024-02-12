compiling-parser
compileCacheId

	parserClass classSide
		compile: (String streamContents: [ :stream | 
				 stream
					 nextPutAll: 'cacheId';
					 cr;
					 tab;
					 nextPutAll: '^''';
					 nextPutAll: DateAndTime now printString;
					 nextPut: $' ])
		classified: #'generated-accessing'