compiling
removeOldMethodsFrom: aRBClass
	(self generatedMethodsIn: aRBClass)
		do: [ :each | aRBClass removeMethod: each ]