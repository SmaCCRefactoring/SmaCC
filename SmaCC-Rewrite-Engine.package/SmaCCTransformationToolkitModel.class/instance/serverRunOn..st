public
serverRunOn: aCollection
	"TODO: Probably not working yet, will have to look into network uses."

	| baseString stream socket request |
	baseString := 'INPUTPARSER=' , self inputParserClass name , ';REWRITEFILE=' , self rewrites filename.
	self outputDirectory notEmpty
		ifTrue: [ baseString := baseString , ';OUTPUTDIRECTORY=' , self outputDirectory ].
	baseString := baseString , ';BASEDIRECTORY=' , self commonParentDirectory.
	self validationParserClass notNil
		ifTrue: [ baseString := baseString , ';OUTPUTPARSER=' , self validationParserClass name ].
	stream := WriteStream on: String new.
	aCollection
		do: [ :each | 
			stream
				nextPutAll: baseString;
				nextPutAll: ';FILE=';
				nextPutAll: each;
				nextPut: (Character value: 0) ].
	request := stream contents.
	socket := Socket port: self serverPort host: self serverName.
	socket connect.
	[ 
	socket writeStream
		nextPut: $1 asInteger;
		nextDWORDPut: request size;
		nextPutAll: request asByteArray;
		flush.
	aCollection size
		timesRepeat: [ 
			self
				trigger: #resultAdded
				with: (SmaCCRewriteResult fromSocketString: (socket readStream next: socket readStream nextDWORD) asString) ] ]
		ensure: [ socket close ]