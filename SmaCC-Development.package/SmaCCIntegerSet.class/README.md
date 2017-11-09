I represent a (possibly large) set of Integers

Responsibilities

My represntation is a sparse bitmap.  I use a collection of n-element byte arrays called "runs", each of which thus contains n * 8 bits.  The value of n is normally self defaultRunSize = 8, so each run contains 256 bits.

That would be great is the maximum value that I am asked to hold is always < 256.  If I'm asked to hold a bigger value, I start to build a tree of 32 runs.  Each tree node holds up to 32 runs; runs with no bits set are not allocated, but are instead represented by 0, which means that every bit in the run can be treated as 0.

Additional levels are added to the tree on demand.  Negative values are accommodated by shifting the whole tree down th enumber line; this is the purpose of the variable start.

Collaborators

I'm used only as the superclass of SmaCCCCharacterSet.

Public API and Key Messages

- add: anInteger
- remove: anInteger
- includes: anInteger
- first       -- answers the minimum element
- do: aBlock

Instances are created with new and new: size.  The size is ignored.
 
Internal Representation

    Instance Variables
	data:	0 (if I'm empty), or the top-level array in my tree of data
	run:		My current run size.  This can change depending on the values that are added
	start:	The offset below 0 for the whole tree.

This comment was written by Andrew Black, not by the implementor.  They may be wrong; they are certainly incomplete. 