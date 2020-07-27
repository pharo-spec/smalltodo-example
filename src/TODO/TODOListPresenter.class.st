Class {
	#name : #TODOListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'todoListPresenter'
	],
	#category : #TODO
}

{ #category : #actions }
TODOListPresenter >> addTask [

	(TODOTaskPresenter newApplication: self application)
		task: TODOTask new;
		openModalWithSpec.
	self updatePresenter
]

{ #category : #actions }
TODOListPresenter >> editSelectedTask [

	(TODOTaskPresenter newApplication: self application)
		task: todoListPresenter selection selectedItem;
		openModalWithSpec.
	self updatePresenter
	
]

{ #category : #initialization }
TODOListPresenter >> initializePresenters [
	| addButton |

	todoListPresenter := self newTable
		addColumn: ((SpCheckBoxTableColumn evaluated: #isDone) 
			width: 20;
			onActivation: [ :task | task done: true ];
			onDeactivation: [ :task | task done: false ];
			yourself);
		addColumn: (SpStringTableColumn title: 'Title' evaluated: #title);
		contextMenu: self todoListContextMenu;
		yourself.

	addButton := self newButton 
		label: 'Add task';
		action: [ self addTask ];
		yourself.

	self layout: (SpBoxLayout newVertical 
		spacing: 5;
		add: todoListPresenter;
		add: (SpBoxLayout newHorizontal
				addLast: addButton expand: false;
				yourself) 
			expand: false;
		yourself)
]

{ #category : #initialization }
TODOListPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'TODO List';
		initialExtent: 500@500
]

{ #category : #actions }
TODOListPresenter >> removeSelectedTask [

	todoListPresenter selection selectedItem remove.
	self updatePresenter
]

{ #category : #initialization }
TODOListPresenter >> todoListContextMenu [

	^ self newMenu 
		addItem: [ :item | item name: 'Edit...'; action: [ self editSelectedTask ] ];
		addItem: [ :item | item name: 'Remove'; action: [ self removeSelectedTask ] ]
		
]

{ #category : #initialization }
TODOListPresenter >> updatePresenter [

	todoListPresenter items: TODOTask selectAll asOrderedCollection
]
