Class {
	#name : #TODOListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'todoListPresenter'
	],
	#category : #TODO
}

{ #category : #initialization }
TODOListPresenter >> initializePresenters [

	todoListPresenter := self newTable
		addColumn: ((SpCheckBoxTableColumn evaluated: #isDone) width: 20);
		addColumn: (SpStringTableColumn title: 'Title' evaluated: #title);
		yourself.

	self layout: (SpBoxLayout newVertical 
		add: todoListPresenter;
		yourself)
]

{ #category : #initialization }
TODOListPresenter >> updatePresenter [

	todoListPresenter items: TODOTask selectAll asOrderedCollection
]
