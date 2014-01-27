accessing
files
	^ files ifNil: [ files := self inputFilenames ]