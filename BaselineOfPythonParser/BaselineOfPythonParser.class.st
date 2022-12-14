"
This baseline of python parser is exactly equivalent to the following:

Metacello new
	baseline: 'SmaCC';
	repository: 'github:///ThierryGoubier/SmaCC';
	load: 'SmaCC-Python'
"
Class {
	#name : #BaselineOfPythonParser,
	#superclass : #BaselineOf,
	#category : 'BaselineOfPythonParser'
}

{ #category : #loading }
BaselineOfPythonParser class >> load [ 
	^ self project latestVersion load
]

{ #category : #accessing }
BaselineOfPythonParser >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'SmaCC-Source-Editing';
				package: 'SmaCC-Runtime' with: [ spec requires: 'SmaCC-Source-Editing' ];
				package: 'SmaCC-Python' with: [ spec requires: 'SmaCC-Runtime' ];
				group: 'default' with: #('SmaCC-Python') ]
]
