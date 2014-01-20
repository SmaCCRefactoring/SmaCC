compiling-scanner
compileTokenIdMethods
	(self symbols select: [:each | each createIdMethod]) 
		do: [:each | self compileTokenIdMethodFor: each]