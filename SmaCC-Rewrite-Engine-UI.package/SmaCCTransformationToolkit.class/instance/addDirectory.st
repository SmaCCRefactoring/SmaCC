actions
addDirectory
	| dir names match stream todo |
	dir := UITheme builder chooseDirectory: 'Add all files in directory' path: nil.
	dir isNil
		ifTrue: [ ^ self ].
	names := Set new.
	stream := WriteStream on: String new.
	(self model inputParserClass ifNil: [ SmaCCParser ]) fileExtensions
		do: [ :each | 
			stream
				nextPut: $*;
				nextPutAll: each ]
		separatedBy: [ stream nextPut: $; ].
	match := stream contents.
	todo := OrderedCollection with: dir.
	[ todo notEmpty ]
		whileTrue: [ ((dir := todo removeFirst) filesMatching: match) do: [ :each | names add: each fullName ].
			todo addAll: dir directories ].
	self addFiles: names