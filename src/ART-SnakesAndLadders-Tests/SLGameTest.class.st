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
	self assert: ((game tileAt: 1) includesPlayer: jill)
]

{ #category : 'tests' }
SLGameTest >> testPlayerAtStartIsAtPosition1 [

	| game jill |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	self assert: jill position equals: 1
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
SLGameTest >> testPrintingSimpleGameWithPlayers [

	| game jill jack |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. "first player"
	game addPlayer: jack.
	self
		assert: game printString
		equals: '[1<Jill><Jack>][2][3][4][5][6][7][8][9][10][11][12]'
]

{ #category : 'tests' }
SLGameTest >> testSeveralPlayersAtStart [

	| game jill jack |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	jack := SLPlayer new name: 'Jack'.
	game addPlayer: jill.
	game addPlayer: jack.
	self assert: ((game tileAt: 1) includesPlayer: jill).
	self assert: ((game tileAt: 1) includesPlayer: jack)
]

{ #category : 'tests' }
SLGameTest >> testTileAt [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: (game tileAt: 6) printString equals: '[6]'
]

{ #category : 'tests' }
SLGameTest >> testTileForAtDistance [

	| jill game |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	self assert: (game tileFor: jill atDistance: 4) position equals: 5
]
