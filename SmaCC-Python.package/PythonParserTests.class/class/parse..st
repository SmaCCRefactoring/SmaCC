as yet unclassified
parse: aFile
	aFile readStreamDo: [:stream | PythonParser2 parseStream: stream ]