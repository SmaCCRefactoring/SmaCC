compiling-parser
compileSymbolNames
	| names |
	names := grammar symbols collect: [ :each | each name ].
	self compileSymbolNames: names asArray