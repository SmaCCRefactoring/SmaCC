accessing-methods
doesNotUnderstand: aMessage
	| method |
	method := rewriteEngine methodNamed: aMessage selector.
	method isNil
		ifTrue:
			[ SilentProperties
				ifTrue:
					[ aMessage arguments size = 1
						ifTrue:
							[ ^ rewriteEngine
								propertyAt:
									(aMessage selector copyFrom: 1 to: aMessage selector size - 1)
										asSymbol
								put: aMessage arguments first ].
					aMessage arguments isEmpty
						ifTrue: [ ^ rewriteEngine
								propertyAt: aMessage selector
								ifAbsent: [ nil ] ] ].
			^ super doesNotUnderstand: aMessage ].
	method numArgs - 1 = aMessage arguments size
		ifTrue: [ ^ method
				valueWithArguments: (Array with: self) , aMessage arguments ].
	^ method valueWithArguments: aMessage arguments