"
I allow one to browse grammar versions, either from the image log or from a gitfiletree repository (if the current parser package is stored in one).

Code is a copy of the AltVersionBrowser, adapted to grammars stored in definition comments
"
Class {
	#name : #SmaCCVersionBrowser,
	#superclass : #VersionBrowser,
	#category : 'SmaCC-Development-UI'
}

{ #category : #update }
SmaCCVersionBrowser >> buildChangeList [
	"Do not ask the changeset, but the repository if this is a gitfiletree:// repository."

	"Write this code so that it is independent of the presence of MonticelloFileTree-Git; it will fail anyway and drop back on the old version browser."

	| rpackage aMCWorkingCopy repository mcMethodDefinition allFileNames gitRepoClass gitReaderClass |
	(Smalltalk globals includesKey: #MCFileTreeGitRepository)
		ifTrue: [ gitRepoClass := Smalltalk globals at: #MCFileTreeGitRepository.
			gitReaderClass := Smalltalk globals at: #MCFileTreeGitStReader ]
		ifFalse: [ ^ super buildChangeList ].
	rpackage := rgMethod method package.
	aMCWorkingCopy := MCWorkingCopy allManagers
		detect: [ :wc | wc package name = rpackage name ].
	repository := aMCWorkingCopy repositoryGroup repositories
		detect: [ :repo | repo isKindOf: gitRepoClass ]
		ifNone: [ ^ super buildChangeList ].
	allFileNames := repository allFileNames.
	mcMethodDefinition := rgMethod asMCMethodDefinition.
	^ (OrderedCollection
		streamContents: [ :stream | 
			stream
				nextPutAll:
					(SourceFiles
						changeRecordsFrom: rgMethod sourcePointer
						className: rgMethod theNonMetaClassName
						isMeta: rgMethod isMetaSide);
				nextPutAll:
					([ (((repository
						gitVersionsForDefinition: mcMethodDefinition
						in: aMCWorkingCopy packageName)
						collect: [ :commitID | 
							((gitReaderClass
								on: repository directory
								fileName: aMCWorkingCopy packageName , repository packageExtension)
								commitID: commitID;
								info: (allFileNames detect: [ :en | en commitID = commitID ]) info;
								yourself) loadDefinitionFor: mcMethodDefinition ])
						reject: [ :mcD | mcD isNil or: [ mcD isEmpty ] ])
						collect: [ :e | e first ] ]
						on: NotFound
						do: [ #() ]) ])
		collectWithIndex: [ :c :i | 
			| rg |
			rg := c asRingDefinition.
			rg annotationNamed: #versionIndex put: i ]
]
