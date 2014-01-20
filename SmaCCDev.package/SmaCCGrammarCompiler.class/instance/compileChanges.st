compiling
compileChanges
	RBRefactoryChangeManager instance performChange: self changes.
	scannerCompiler scannerClass realClass 
		ifNotNilDo: [:each | each initializeKeywordMap]