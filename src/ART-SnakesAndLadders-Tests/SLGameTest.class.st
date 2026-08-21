Class {
	#name : 'SLGameTest',
	#superclass : 'TestCase',
	#category : 'ART-SnakesAndLadders-Tests',
	#package : 'ART-SnakesAndLadders-Tests'
}

{ #category : 'tests' }
SLGameTest >> testCanMoveToPosition [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: (game canMoveToPosition: 8).
	self assert: (game canMoveToPosition: 12).
	self deny: (game canMoveToPosition: 13)
]

{ #category : 'tests' }
SLGameTest >> testCheckingSimpleGame [

	| game |
	game := SLGame new.
	game tileNumber: 12.
	self assert: game tileNumber equals: 12
]

{ #category : 'tests' }
SLGameTest >> testCurrentPlayer [

	| jack game jill |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game
		addPlayer: jack;
		addPlayer: jill.
	game turn: 1.
	self assert: game currentPlayer equals: jack.
	game turn: 2.
	self assert: game currentPlayer equals: jill.
	game turn: 3.
	self assert: game currentPlayer equals: jack
]

{ #category : 'tests' }
SLGameTest >> testFullGamePrintString [

	| game |
	game := SLGame new tileNumber: 12.
	game
		setLadderFrom: 2 to: 6;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
	self
		assert: game printString
		equals: '[1][2->6][3][4][5][6][7->9][8][9][10][5<-11][12]'
]

{ #category : 'tests' }
SLGameTest >> testIsOver [
	"protocol: 'tests'"

	| jack game |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	game addPlayer: jack.
	self assert: jack position equals: 1.
	game movePlayer: jack distance: 11.
	self assert: jack position equals: 12.
	self assert: game isOver
]

{ #category : 'tests' }
SLGameTest >> testMovePlayerADistance [

	| jill game |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	game movePlayer: jill distance: 4.
	self assert: jill position equals: 5.
	self deny: ((game tileAt: 1) includesPlayer: jill).
	self assert: ((game tileAt: 5) includesPlayer: jill)
]

{ #category : 'tests' }
SLGameTest >> testPlayOneStep [
	"protocol: 'tests'"

	| jill jack game |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	game addPlayer: jack.
	self assert: jill position equals: 1.
	game playOneStepWith: 3.
	self assert: jill position equals: 4.
	self assert: (game tileAt: 1) players size equals: 1.
	self assert: ((game tileAt: 4) includesPlayer: jill)
]

{ #category : 'tests' }
SLGameTest >> testPlayOneStepOnALadder [
	"protocol: 'tests'"

	| jill jack game |
	game := SLGame new
		        tileNumber: 12;
		        setLadderFrom: 2 to: 6;
		        setLadderFrom: 7 to: 9;
		        setSnakeFrom: 11 to: 5.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	game addPlayer: jack.
	"Jillが1を出してマス2（ハシゴの入り口）に着地"
	game playOneStepWith: 1. "※リファクタリング後のセレクタ"
	"ハシゴによってマス6へ昇っていることを検証"
	self assert: jill position equals: 6.
	self assert: (game tileAt: 1) players size equals: 1.
	self assert: ((game tileAt: 6) includesPlayer: jill)
]

{ #category : 'tests' }
SLGameTest >> testPlayOneStepOnExactFinish [
	"protocol: 'tests'"

	| jill jack game |
	game := SLGame new
		        tileNumber: 12;
		        setLadderFrom: 2 to: 6;
		        setLadderFrom: 7 to: 9;
		        setSnakeFrom: 11 to: 5.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	game addPlayer: jack.
	game playOneStepWith: 11.
	"jill lands on the finish tile!"
	self assert: jill position equals: 12.
	self assert: (game tileAt: 1) players size equals: 1.
	self assert: ((game tileAt: 12) includesPlayer: jill).
	self assert: game isOver
]

{ #category : 'tests' }
SLGameTest >> testPlayOneStepOnInexactFinish [
	"protocol: 'tests'"

	| jill jack game |
	game := SLGame new
		        tileNumber: 12;
		        setLadderFrom: 2 to: 6;
		        setLadderFrom: 7 to: 9;
		        setSnakeFrom: 11 to: 5.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	game addPlayer: jack.
	"jill moves"
	game playOneStepWith: 9.
	self assert: jill position equals: 10.
	self assert: ((game tileAt: 10) includesPlayer: jill).
	"jack moves"
	game playOneStepWith: 2.
	"jill tries to move but in fact stays at her place"
	game playOneStepWith: 5.
	self assert: jill position equals: 10.
	self assert: ((game tileAt: 10) includesPlayer: jill).
	self deny: game isOver
]

{ #category : 'tests' }
SLGameTest >> testPlayTwoSteps [
	"protocol: 'tests'"

	| jill jack game |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	game addPlayer: jack.
	"1ステップ目: Jillが3進む"
	game playOneStepWith: 3.
	"2ステップ目: 交代したJackが2進む"
	game playOneStepWith: 2.
	"Jillの状態が変わっていない（位置4に留まっている）ことを検証"
	self assert: jill position equals: 4.
	self assert: ((game tileAt: 4) includesPlayer: jill).
	"Jackが正しくタイル3へ移動したかを検証"
	self assert: (game tileAt: 1) players size equals: 0.
	self assert: jack position equals: 3.
	self assert: ((game tileAt: 3) includesPlayer: jack)
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
SLGameTest >> testPlayerStepOnASnake [
	"protocol: 'tests'"

	| jill game |
	game := SLGame new
		        tileNumber: 12;
		        setLadderFrom: 2 to: 6;
		        setLadderFrom: 7 to: 9;
		        setSnakeFrom: 11 to: 5.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	game movePlayer: jill distance: 10.
	self assert: jill position equals: 5.
	self assert: (game tileAt: 1) players isEmpty.
	self assert: ((game tileAt: 5) includesPlayer: jill)
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

{ #category : 'tests' }
SLGameTest >> testTileOfPlayer [

	| jill game |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	self assert: (game tileOfPlayer: jill) position equals: 1
]
