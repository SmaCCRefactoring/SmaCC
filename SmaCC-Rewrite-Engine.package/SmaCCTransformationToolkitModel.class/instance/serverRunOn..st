running
serverRunOn: aCollection
	| baseString stream socket request serverStream |
	baseString := 'INPUTPARSER=' , self inputParserClass name
		, ';REWRITEFILE=' , self rewrites filename.
	self outputDirectory notEmpty
		ifTrue:
			[ baseString := baseString , ';OUTPUTDIRECTORY='
				, self outputDirectory ].
	baseString := baseString , ';BASEDIRECTORY='
		, self commonParentDirectory.
	self validationParserClass notNil
		ifTrue:
			[ baseString := baseString , ';OUTPUTPARSER='
				, self validationParserClass name ].
	stream := WriteStream on: String new.
	aCollection
		do:
			[ :each | 
			stream
				nextPutAll: baseString;
				nextPutAll: ';FILE=';
				nextPutAll: each;
				nextPut: (Character value: 0) ].
	request := stream contents.
	socket := Socket newTCP
		connectTo:
			(NetNameResolver addressForName: self serverName)
			port: self serverPort;
		yourself.
	(serverStream := SocketStream on: socket) binary.
	[ serverStream
		nextPut: $1 asInteger;
		nextPut: (request size bitAnd: 255);
		nextPut: (request size >> 8 bitAnd: 255);
		nextPut: (request size >> 16 bitAnd: 255);
		nextPut: (request size >> 24 bitAnd: 255);
		nextPutAll: request asByteArray;
		flush.
	aCollection size
		timesRepeat:
			[ self
				changed: #resultAdded
				with:
					(SmaCCRewriteResult
						fromSocketString:
							(serverStream
								next:
									serverStream next + (serverStream next << 8)
										+ (serverStream next << 16) + (serverStream next << 24))
								asString) ] ]
		ensure: [ socket close ]