compiling
defineClass: aString asSubclassOf: aBehavior
	model defineClass: aBehavior name , ' subclass: #' , aString , ' instanceVariableNames: '''' classVariableNames: '''' poolDictionaries: '''' category: '''' '.
	^model classNamed: aString asSymbol