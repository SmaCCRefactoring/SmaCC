"
I store tests for the javascript parser
"
Class {
	#name : #JSParserTests,
	#superclass : #TestCase,
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #tests }
JSParserTests >> testModuleExports [
	JSParser parse: 'module.exports = require(''./lib/axios'');'
]
