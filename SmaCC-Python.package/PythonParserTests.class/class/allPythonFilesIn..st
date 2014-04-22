as yet unclassified
allPythonFilesIn: aDirectory
	"Return a list of all files (recursively) in aDirectory that have the .py extension."
	^ (aDirectory glob: [ :entry | entry isFile and: [entry extension = 'py' ]]) 