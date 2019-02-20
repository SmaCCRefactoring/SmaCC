accessing
parser
	^ self rootContext ifNotNil: [ :context | context receiver ]