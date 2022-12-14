"
SmaCC is a parser generator, doing LR, LALR and GLR generation, parse tree automatic building, parse tree based rewritting (refactoring).

Copyright (c) 2014 Thierry Goubier
Copyright (c) 2002-2010 John Brant, Don Roberts

Permission is hereby granted, free of charge, to any person obtaining a copy 
of this software and associated documentation files (the ""Software""), to deal 
in the Software without restriction, including without limitation the rights 
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
copies of the Software, and to permit persons to whom the Software is furnished 
to do so, subject to the following conditions:

The above copyright and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ""AS IS"", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS 
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS 
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


"
Class {
	#name : #ConfigurationOfSmaCC,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfSmaCC'
}

{ #category : #private }
ConfigurationOfSmaCC class >> bootstrapPackage: aString from: aPath [ 
	| repository version |
	repository := MCHttpRepository
				location: aPath
				user: ''
				password: ''.
	repository
		versionReaderForFileNamed: aString , '.mcz'
		do: [:reader | 
			version := reader version.
			version load.
			version workingCopy repositoryGroup addRepository: repository]
]

{ #category : #catalog }
ConfigurationOfSmaCC class >> catalogChangeLog [
	^ '
18 March 2014: Version 2.0.3 stable and development for Pharo3.x
'
]

{ #category : #catalog }
ConfigurationOfSmaCC class >> catalogContactInfo [
	^ 'https://github.com/ThierryGoubier'
]

{ #category : #catalog }
ConfigurationOfSmaCC class >> catalogDescription [
	^ 'SmaCC

Smalltalk Compiler Compiler : a parser generator.

http://www.refactoryworkers.com/SmaCC.html

Integrates:

    LR, LALR and GLR parsers
    Lexical analysis
    Unified lexical and syntaxic description
    Automated AST classes generation
    Automated code rewritting engine generation
    Master / slave distributed workload for the rewriting engine
    Sample parsers: C, Smalltalk, Java, C#

This is the port for Smalltalk/Pharo3.'
]

{ #category : #catalog }
ConfigurationOfSmaCC class >> catalogKeyClassesAndExample [
	^ '
	Core classes for the runtime are the abstract classes for the parser (SmaCCParser), the scanner (SmaCCScanner) and the token (SmaCCToken). GLR support is in SmaCCGLRParser.
	
	In development, of interest are the SmaCCGrammar, the SmaCCGrammarCompiler, and the  SmaCCSmalltalkCodeGenerator. The GUI is in SmaCCDevelopmentUI and the tutorial is in the Help (SmaCCHelp of course). For people more interested in the refactoring/rewritting side, have a look at the SmaCC-Rewrite-Engine package, the tests and the tutorial.
	
	For studying, the sample scanners and parsers: CScanner/CParser, JavaScanner/JavaParser, CSharpScanner/CSharpParser, StScanner/StParser.
'
]

{ #category : #catalog }
ConfigurationOfSmaCC class >> catalogKeywords [
	^ #(#Refactoring #CodeRewritting #Parser #Scanner #Lexer #LexicalAnalysis #SyntaxAnalysis #LR #LALR #GLR)
]

{ #category : #'gitfiletree support' }
ConfigurationOfSmaCC class >> ensureGitFileTree [
	"And all related dependencies."

	Smalltalk
		at: #MCFileTreeGitRepository
		ifAbsent: [ 
			Gofer new
				url: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main';
				configurationOf: 'GitFileTree';
				loadDevelopment ]
]

{ #category : #private }
ConfigurationOfSmaCC class >> ensureMetacello [
	"Bootstrap Gofer (if necessary), bootstrap ConfigurationOfMetacello (using old Gofer API), then load the latest 
	version of Metacello itself."

	Smalltalk at: #MetacelloProject ifAbsent: [
		Smalltalk at: #Gofer ifAbsent: [
			"Current version of Gofer from which to bootstrap - as of 1.0-beta.21"
			self bootstrapPackage: 'Gofer-Core-lr.115' from: 'http://seaside.gemstone.com/ss/metacello' ].
		Smalltalk at: #Gofer ifPresent: [:goferClass | | gofer |
			gofer := goferClass new
				url: 'http://seaside.gemstone.com/ss/metacello';
				yourself.
			[ gofer addPackage: 'ConfigurationOfMetacello' ] on: Warning do: [:ex | ex resume ].
			gofer load ].
		"load 'default' group of Metacello"
		(Smalltalk at: #ConfigurationOfMetacello) perform: #load ]
]

{ #category : #'metacello tool support' }
ConfigurationOfSmaCC class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #'metacello tool support' }
ConfigurationOfSmaCC class >> lastMetacelloVersionLoad [
	"Answer the last version loaded and the list of packages loaded for that version."

	LastVersionLoad == nil ifTrue: [ LastVersionLoad := nil -> 'default' ].
	^LastVersionLoad
]

{ #category : #loading }
ConfigurationOfSmaCC class >> load [
	"self load"

	^self project latestVersion load
]

{ #category : #loading }
ConfigurationOfSmaCC class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #'metacello tool support' }
ConfigurationOfSmaCC class >> metacelloVersion: versionString loads: anArrayOrString [
	"Stash the last version loaded and the list of packages loaded for that version. The list
	 of packages will be used by the tools when doing 'Load Package Version'"

	LastVersionLoad := versionString -> anArrayOrString
]

{ #category : #accessing }
ConfigurationOfSmaCC class >> project [

	^self new project
]

{ #category : #'unloading Metacello' }
ConfigurationOfSmaCC class >> unloadMetacello [

	Smalltalk at: #ConfigurationOfMetacello ifPresent: [:cls | cls unloadMetacello ]
]

{ #category : #baselines }
ConfigurationOfSmaCC >> baseline01: spec [
	<version: '0.1-baseline'>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec repository: 'http://www.squeaksource.com/SmaccDevelopment'.

		spec
			package: 'SmaCC';
			package: 'SmaCCDev' with: [ spec requires: 'SmaCC' ].
		
		spec
			group: 'default' with: #('Runtime');
			group: 'Runtime' with: #('SmaCC');
			group: 'Tools' with: #('SmaCCDev')
	]
]

{ #category : #baselines }
ConfigurationOfSmaCC >> baseline20: spec [
	<version: '2.0-baseline'>
	
	spec
		for: #'pharo3.x'
		do: [ 
			spec blessing: #baseline.
			spec
				package: 'SmaCC-Source-Editing';
				package: 'SmaCC-Runtime' with: [ spec requires: 'SmaCC-Source-Editing' ];
				package: 'SmaCC-GLR-Runtime' with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-Development' with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Development-UI' with: [ spec requires: 'SmaCC-Development' ];
				package: 'SmaCC-Tests' with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Rewrite-Engine' with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-Rewrite-Engine-Tests' with: [ spec requires: 'SmaCC-Rewrite-Engine' ];
				package: 'SmaCC-Server-Session';
				package: 'SmaCC-Rewrite-Server' with: [ spec requires: 'SmaCC-Server-Session' ];
				package: 'SmaCC-Rewrite-Server-Worker'
					with: [ 
							spec
								requires: 'SmaCC-Rewrite-Engine';
								requires: 'SmaCC-Server-Session' ];
				package: 'SmaCC-Smalltalk-Parser' with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-C-Parser' with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-CSharp' with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Java' with: [ spec requires: 'SmaCC-GLR-Runtime' ].
			spec
				group: 'default' with: #('Tools');
				group: 'Runtime' with: #('SmaCC-GLR-Runtime');
				group: 'Rewrite' with: #('SmaCC-Rewrite-Engine');
				group: 'Rewrite-Server' with: #('SmaCC-Rewrite-Server-Worker' 'SmaCC-Rewrite-Server' 'Rewrite');
				group: 'Tools' with: #('SmaCC-Development-UI' 'Examples' 'Rewrite');
				group: 'Examples' with: #('SmaCC-Smalltalk-Parser' 'SmaCC-C-Parser' 'SmaCC-CSharp' 'SmaCC-Java') ]
]

{ #category : #'symbolic versions' }
ConfigurationOfSmaCC >> development: spec [
	<symbolicVersion: #development>
	
	spec for: #'pharo3.x' version: '2.0.3'
]

{ #category : #accessing }
ConfigurationOfSmaCC >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfSmaCC >> stable: spec [
	<symbolicVersion: #stable>
	
	spec for: #common version: '0.1'.
	spec for: #'pharo1.4.x' version: '0.2'.
	spec for: #'pharo2.x' version: '0.3'.
	spec for: #'pharo3.x' version: '2.0.3-pre'
]

{ #category : #versions }
ConfigurationOfSmaCC >> version01: spec [
	<version: '0.1' imports: #('0.1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #stable;
			author: 'topa';
			description: 'Make SmaCC available via Metacello'.
		spec
			package: 'SmaCC' with: 'SmaCC-lr.14';
			package: 'SmaCCDev' with: 'SmaCCDev-AlainPlantec.25'.
		
	]
]

{ #category : #versions }
ConfigurationOfSmaCC >> version02: spec [
	<version: '0.2' imports: #('0.1-baseline')>
	
	spec for: #'pharo1.4.x' do: [
		spec
			blessing: #stable;
			author: 'ThierryGoubier';
			description: 'SmaCC Smalltalk Compiler Compiler for Pharo 1.4'.
		spec
			package: 'SmaCC' with: 'SmaCC-lr.14';
			package: 'SmaCCDev' with: 'SmaCCDev-ThierryGoubier.31'.
		
	]
]

{ #category : #versions }
ConfigurationOfSmaCC >> version03: spec [
	<version: '0.3' imports: #('0.1-baseline')>
	
	spec for: #'pharo2.x' do: [
		spec
			blessing: #stable;
			author: 'ThierryGoubier';
			description: 'SmaCC Smalltalk Compiler Compiler for Pharo 2.0'.
		spec
			package: 'SmaCC' with: 'SmaCC-lr.14';
			package: 'SmaCCDev' with: 'SmaCCDev-ThierryGoubier.34'.
		
	]
]

{ #category : #versions }
ConfigurationOfSmaCC >> version04: spec [
	<version: '0.4' imports: #('0.1-baseline')>
	
	spec for: #'pharo3.x' do: [
		spec
			blessing: #stable;
			author: 'ThierryGoubier';
			description: 'SmaCC Smalltalk Compiler Compiler for Pharo 3.0'.
		spec
			package: 'SmaCC' with: 'SmaCC-lr.14';
			package: 'SmaCCDev' with: 'SmaCCDev-ThierryGoubier.36'.
		
	]
]

{ #category : #versions }
ConfigurationOfSmaCC >> version05: spec [
	<version: '2.0.3-pre' imports: #('2.0-baseline')>
	spec
		for: #'pharo3.x'
		do: [ 
			spec
				blessing: #stable;
				author: 'ThierryGoubier';
				description: 'SmaCC Smalltalk Compiler Compiler for Pharo 3.0'.
			spec repository: 'github://ThierryGoubier/SmaCC:master'.
			spec
				package: 'SmaCC-C-Parser' with: 'SmaCC-C-Parser-ThierryGoubier.2';
				package: 'SmaCC-CSharp' with: 'SmaCC-CSharp-ThierryGoubier.3';
				package: 'SmaCC-Development' with: 'SmaCC-Development-ThierryGoubier.14';
				package: 'SmaCC-Development-UI' with: 'SmaCC-Development-UI-ThierryGoubier.15';
				package: 'SmaCC-Examples-Tests' with: 'SmaCC-Examples-Tests-ThierryGoubier.13';
				package: 'SmaCC-GLR-Runtime' with: 'SmaCC-GLR-Runtime-ThierryGoubier.2';
				package: 'SmaCC-Java' with: 'SmaCC-Java-ThierryGoubier.4';
				package: 'SmaCC-Rewrite-Engine' with: 'SmaCC-Rewrite-Engine-ThierryGoubier.3';
				package: 'SmaCC-Rewrite-Engine-Tests' with: 'SmaCC-Rewrite-Engine-Tests-ThierryGoubier.1';
				package: 'SmaCC-Runtime' with: 'SmaCC-Runtime-ThierryGoubier.2';
				package: 'SmaCC-Smalltalk-Parser' with: 'SmaCC-Smalltalk-Parser-ThierryGoubier.2';
				package: 'SmaCC-Source-Editing' with: 'SmaCC-Source-Editing-ThierryGoubier.1';
				package: 'SmaCC-Tests' with: 'SmaCC-Tests-ThierryGoubier.9';
				package: 'SmaCC-Rewrite-Server' with: 'SmaCC-Rewrite-Server-ThierryGoubier.2';
				package: 'SmaCC-Rewrite-Server-Worker' with: 'SmaCC-Rewrite-Server-Worker-ThierryGoubier.1';
				package: 'SmaCC-Server-Session' with: 'SmaCC-Server-Session-ThierryGoubier.2' ]
]

{ #category : #versions }
ConfigurationOfSmaCC >> version203: spec [
	<version: '2.0.3-pre' imports: #('2.0-baseline')>
	spec
		for: #'pharo3.x'
		do: [ 
			spec
				blessing: #stable;
				author: 'ThierryGoubier';
				description: 'SmaCC Smalltalk Compiler Compiler for Pharo 3.0'.
			spec repository: 'github://ThierryGoubier/SmaCC:master'.
			spec
				package: 'SmaCC-C-Parser' with: 'SmaCC-C-Parser-ThierryGoubier.2';
				package: 'SmaCC-CSharp' with: 'SmaCC-CSharp-ThierryGoubier.3';
				package: 'SmaCC-Development' with: 'SmaCC-Development-ThierryGoubier.14';
				package: 'SmaCC-Development-UI' with: 'SmaCC-Development-UI-ThierryGoubier.15';
				package: 'SmaCC-Examples-Tests' with: 'SmaCC-Examples-Tests-ThierryGoubier.13';
				package: 'SmaCC-GLR-Runtime' with: 'SmaCC-GLR-Runtime-ThierryGoubier.2';
				package: 'SmaCC-Java' with: 'SmaCC-Java-ThierryGoubier.4';
				package: 'SmaCC-Rewrite-Engine' with: 'SmaCC-Rewrite-Engine-ThierryGoubier.3';
				package: 'SmaCC-Rewrite-Engine-Tests' with: 'SmaCC-Rewrite-Engine-Tests-ThierryGoubier.1';
				package: 'SmaCC-Runtime' with: 'SmaCC-Runtime-ThierryGoubier.2';
				package: 'SmaCC-Smalltalk-Parser' with: 'SmaCC-Smalltalk-Parser-ThierryGoubier.2';
				package: 'SmaCC-Source-Editing' with: 'SmaCC-Source-Editing-ThierryGoubier.1';
				package: 'SmaCC-Tests' with: 'SmaCC-Tests-ThierryGoubier.9';
				package: 'SmaCC-Rewrite-Server' with: 'SmaCC-Rewrite-Server-ThierryGoubier.2';
				package: 'SmaCC-Rewrite-Server-Worker' with: 'SmaCC-Rewrite-Server-Worker-ThierryGoubier.1';
				package: 'SmaCC-Server-Session' with: 'SmaCC-Server-Session-ThierryGoubier.2' ]

]
