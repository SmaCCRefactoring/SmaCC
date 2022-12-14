Class {
	#name : #SmaCCRewriteEngineCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'failingFiles',
		'doneCount',
		'totalCount',
		'doneSemaphore'
	],
	#category : 'SmaCC-Rewrite-Engine-Command-Line'
}

{ #category : #accessing }
SmaCCRewriteEngineCommandLineHandler class >> commandName [
	^ 'SmaCCTransformationRunner'
]

{ #category : #activation }
SmaCCRewriteEngineCommandLineHandler >> activate [
	self arguments size >= 1
		ifTrue: [ ^ self runFile: self arguments first ].
	self exitFailure: 'Please provide rewrite file to run.'
]

{ #category : #activation }
SmaCCRewriteEngineCommandLineHandler >> finished: aSmaCCRewriteResult [
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
]

{ #category : #activation }
SmaCCRewriteEngineCommandLineHandler >> run: aSmaCCTransformationToolkitModel [
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
]

{ #category : #activation }
SmaCCRewriteEngineCommandLineHandler >> runFile: aString [
	| model |
	model := SmaCCTransformationToolkitModel new.
	[ model loadFile: aString ]
		on: Error
		do: [ :ex | ^ self exitFailure: 'Unable to load file: ' , aString ].
	self run: model
]

{ #category : #activation }
SmaCCRewriteEngineCommandLineHandler >> update: aSymbol with: anObject [
	aSymbol = #resultAdded
		ifTrue: [ ^ self finished: anObject ].
	super update: aSymbol with: anObject
]
