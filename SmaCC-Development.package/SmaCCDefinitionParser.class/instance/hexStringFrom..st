private
hexStringFrom: aStream
	^String with: (Character value: (self hexValueFrom: aStream))