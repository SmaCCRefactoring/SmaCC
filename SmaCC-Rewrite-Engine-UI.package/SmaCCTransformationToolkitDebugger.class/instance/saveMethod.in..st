private
saveMethod: aString in: selection
	RBParser parseMethod: aString onError: [ :msg :pos | ^ self inform: 'Code does not parse' ].
	self save: aString into: selection