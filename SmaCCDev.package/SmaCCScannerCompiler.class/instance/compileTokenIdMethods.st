compiling
compileTokenIdMethods
	(self symbols select: [:each | each createIdMethod])
		do:
			[:each | codeGenerator compileTokenIdMethodNamed: each safeMethodName withId: (self symbols indexOf: each)]