printing
printOn: aStream
	super printOn: aStream.
	self topParent completeSource notNil ifTrue: [ 
		aStream 
			nextPut: $(;
			nextPutAll: (self topParent completeSource copyFrom: self startPosition to: self stopPosition) asString;
			nextPut: $) ]