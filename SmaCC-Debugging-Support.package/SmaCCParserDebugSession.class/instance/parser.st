accessing
parser
	^ self rootContext notNil
		ifTrue: [ self rootContext receiver ]