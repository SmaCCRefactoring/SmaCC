activation
finished: aSmaCCRewriteResult
	doneCount := doneCount + 1.
	(aSmaCCRewriteResult isError or: [ aSmaCCRewriteResult isWarning ])
		ifTrue: [ failingFiles := failingFiles + 1.
			FileStream stderr
				nextPutAll: aSmaCCRewriteResult filename;
				nextPutAll: ': ';
				nextPutAll: aSmaCCRewriteResult errorString;
				cr ].
	totalCount = doneCount
		ifTrue: [ doneSemaphore signal ]