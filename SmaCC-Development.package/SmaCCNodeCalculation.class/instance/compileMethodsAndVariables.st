private
compileMethodsAndVariables
	self sortedClasses do: [ :each | each compileMethodsAndVariables ]