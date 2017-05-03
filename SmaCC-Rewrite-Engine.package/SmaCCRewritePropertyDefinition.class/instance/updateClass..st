rewriting
updateClass: aClass
	propertyNames
		do: [ :each | 
			aClass classPool at: each asSymbol put: nil.
			self createPropertyMethodsFor: each asSymbol in: aClass ].
	globalValues
		associationsDo: [ :assoc | 
			aClass classPool add: assoc.
			self createPropertyMethodsFor: assoc name in: aClass ]