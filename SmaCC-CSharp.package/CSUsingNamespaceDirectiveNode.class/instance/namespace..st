generated
namespace: aCSTypeNode
	self namespace notNil ifTrue: [self namespace parent: nil].
	namespace := aCSTypeNode.
	self namespace notNil ifTrue: [self namespace parent: self]