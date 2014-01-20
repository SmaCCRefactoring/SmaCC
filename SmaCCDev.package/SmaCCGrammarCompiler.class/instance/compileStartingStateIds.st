compiling
compileStartingStateIds
	startingStateMap keysAndValuesDo: 
			[:symbol :position | 
			| stream |
			stream := WriteStream with: String new.
			stream
				nextPutAll: 'startingStateFor';
				nextPutAll: symbol compileName;
				cr;
				tab;
				nextPutAll: '^';
				nextPutAll: position printString.
			parserClass theMetaClass compile: stream contents
				classified: #'generated-starting states']