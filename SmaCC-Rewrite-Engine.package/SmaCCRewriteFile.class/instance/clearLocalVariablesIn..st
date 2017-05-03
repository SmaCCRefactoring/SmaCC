rewriting
clearLocalVariablesIn: aClass
	self rewrites do: [ :each | each clearLocalVariablesIn: aClass ]