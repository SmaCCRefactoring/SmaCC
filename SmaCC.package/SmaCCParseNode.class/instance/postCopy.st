copying
postCopy
	super postCopy.
	self
		allGettersDo: [ :each | 
			self
				perform: (self convertToSetter: each)
				with:
					((self compositeVariableSelectors includes: each)
						ifTrue: [ (self perform: each) collect: [ :item | item copy ] ]
						ifFalse: [ (self perform: each) copy ]) ]