activation
run: aSmaCCTransformationToolkitModel
	failingFiles := 0.
	doneCount := 0.
	totalCount := aSmaCCTransformationToolkitModel files size.
	totalCount = 0
		ifTrue: [ self stderr
				nextPutAll: 'No files specified';
				cr.
			self exitSuccess ].
	doneSemaphore := Semaphore new.
	aSmaCCTransformationToolkitModel addDependent: self.
	aSmaCCTransformationToolkitModel localRunOn: aSmaCCTransformationToolkitModel files.
	doneSemaphore wait.
	^ (Exit status: failingFiles) signal