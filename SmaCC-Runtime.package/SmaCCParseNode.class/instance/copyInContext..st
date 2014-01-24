matching
copyInContext: aDictionary
	| copy |
	copy := self copy.
	self tokenVariables
		do: [ :selector | copy perform: (self convertToSetter: selector) with: ((self perform: selector) copyInContext: aDictionary) ].
	self nodeVariables
		do: [ :selector | copy perform: (self convertToSetter: selector) with: ((self perform: selector) copyInContext: aDictionary) ].
	self compositeTokenVariables
		do: [ :selector | 
			copy
				perform: (self convertToSetter: selector)
				with: ((self perform: selector) collect: [ :each | each copyInContext: aDictionary ]) ].
	self compositeNodeVariables
		do: [ :selector | 
			copy
				perform: (self convertToSetter: selector)
				with: ((self perform: selector) collect: [ :each | each copyInContext: aDictionary ]) ].
	^ copy