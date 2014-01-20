compiling
compileReductionTable
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'reduceTable';
		cr;
		tab;
		nextPutAll: '^#(';
		cr.
	self reduceTable do: 
			[:each | 
			stream nextPutAll: '#('.
			each do: [:e | stream nextPutAll: e storeString]
				separatedBy: [stream space].
			stream
				nextPut: $);
				cr].
	stream nextPut: $).
	parserClass compile: stream contents classified: #'generated-tables'