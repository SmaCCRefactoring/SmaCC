Class {
	#name : #PyElifsOptNode,
	#superclass : #PyRootNode,
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyElifsOptNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitElifsOpt: self
]
