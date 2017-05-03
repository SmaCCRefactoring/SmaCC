printing
displayOn: aStream
	self comment notEmpty
		ifTrue: [ aStream nextPutAll: self comment ]
		ifFalse: [ aStream
				nextPutAll: 'Properties: ';
				print: propertyNames size;
				nextPutAll: ' local, ';
				print: globalValues size;
				nextPutAll: ' global' ]