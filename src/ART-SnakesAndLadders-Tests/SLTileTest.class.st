Class {
	#name : 'SLTileTest',
	#superclass : 'TestCase',
	#category : 'ART-SnakesAndLadders-Tests',
	#package : 'ART-SnakesAndLadders-Tests'
}

{ #category : 'tests' }
SLTileTest >> testPrinting [

	| tile |
	tile := SLTile new position: 6.
	self assert: tile printString equals: '[6]'
]
