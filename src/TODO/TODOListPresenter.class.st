Class {
	#name : #TODOListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'todoListPresenter'
	],
	#category : #TODO
}

{ #category : #initialization }
TODOListPresenter >> addTask [

	(TODOTaskPresenter newApplication: self application)
		task: TODOTask new;
		openModal.
	self updatePresenter
]

{ #category : #initialization }
TODOListPresenter >> editSelectedTask [

	(TODOTaskPresenter newApplication: self application)
		task: todoListPresenter selection selectedItem;
		openModal.
	self updatePresenter
]

{ #category : #initialization }
TODOListPresenter >> initializePresenters [
	| addButton |

	todoListPresenter := self newTable
		addColumn: ((SpCheckBoxTableColumn evaluated: [:task | task isDone]) 
			width: 20;
			onActivation: [ :task | task done: true ];
			onDeactivation: [ :task | task done: false ];
			yourself);
		addColumn: (SpStringTableColumn 
						title: 'Title' 
						evaluated: [:task | task title]);
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

{ #category : #initialization }
TODOListPresenter >> removeSelectedTask [

	todoListPresenter selection selectedItem remove.
	self updatePresenter
]

{ #category : #initialization }
TODOListPresenter >> todoListContextMenu [

	^ self newMenu 
		addItem: [ :item | item 
						name: 'Edit...'; 
						action: [ self editSelectedTask ] ];
		addItem: [ :item | item 
						name: 'Remove'; 
						action: [ self removeSelectedTask ] ]
]

{ #category : #initialization }
TODOListPresenter >> updatePresenter [

	todoListPresenter items: TODOTask tasks asOrderedCollection
]
