private
hexStringFrom: aStream
	^ SmaCCCharacterSet with: (Character value: (self hexValueFrom: aStream))