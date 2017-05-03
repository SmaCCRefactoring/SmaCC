actions
runOn: aCollection
	(self model runOnServer and: [ self model areRewritesModified ])
		ifTrue: [ (self confirm: 'Do you want to save your transformations before running on the server?')
				ifTrue: [ self saveRewrites ] ].
	self fileResults removeAllSuchThat: [ :each | aCollection includes: each filename ].
	self model runOn: aCollection