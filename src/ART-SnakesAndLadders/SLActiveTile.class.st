Class {
	#name : 'SLActiveTile',
	#superclass : 'SLAbstractTile',
	#instVars : [
		'targetTile'
	],
	#category : 'ART-SnakesAndLadders',
	#package : 'ART-SnakesAndLadders'
}

{ #category : 'player management' }
SLActiveTile >> acceptPlayer: aPlayer [
	"protocol: 'player management'"

	super acceptPlayer: aPlayer.
	targetTile acceptPlayer: aPlayer
]

{ #category : 'accessing' }
SLActiveTile >> to: aTile [
	"protocol: 'accessing'
	インスタンス変数targetTileに、移動先のタイルを設定する"

	targetTile := aTile
]
