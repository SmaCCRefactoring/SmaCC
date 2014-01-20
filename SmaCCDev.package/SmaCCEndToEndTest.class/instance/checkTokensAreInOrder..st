private
checkTokensAreInOrder: tokenCollection 
	tokenCollection inject: 0
		into: 
			[:sum :each | 
			self assert: sum < each startPosition.
			each startPosition]