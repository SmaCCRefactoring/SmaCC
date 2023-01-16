accessing
parser

	^ self rootContext ifNotNil: [ self rootContext receiver ]