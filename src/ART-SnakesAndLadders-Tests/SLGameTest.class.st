Class {
	#name : 'SLGameTest',
	#superclass : 'TestCase',
	#category : 'ART-SnakesAndLadders-Tests',
	#package : 'ART-SnakesAndLadders-Tests'
}

{ #category : 'tests' }
SLGameTest >> testCheckingSimpleGame [

	| game |
	game := SLGame new.
	game tileNumber: 12.
	self assert: game tileNumber equals: 12
]

{ #category : 'tests' }
SLGameTest >> testPlayerAtStart [

	| game jill |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	self assert: ((game tileAt: 1) players includes: jill)
]

{ #category : 'tests' }
SLGameTest >> testPrintingSimpleGame [

	| game |
	game := SLGame new tileNumber: 12.
	self
		assert: game printString
		equals: '[1][2][3][4][5][6][7][8][9][10][11][12]'
]

{ #category : 'tests' }
SLGameTest >> testSeveralPlayersAtStart [

	| game jill jack |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	jack := SLPlayer new name: 'Jack'.
	game addPlayer: jill.
	game addPlayer: jack.
	self assert: ((game tileAt: 1) players includes: jill).
	self assert: ((game tileAt: 1) players includes: jack)
]

{ #category : 'tests' }
SLGameTest >> testTileAt [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: (game tileAt: 6) printString equals: '[6]'
]
