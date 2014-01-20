compiling
compileInto: sClass andParser: pClass 
	self scannerClass: sClass.
	self parserClass: pClass.
	self createChanges.
	self compileChanges