class_name Block
extends Node2D

enum BlockColors {
	NULL,
	BLUE,
	RED,
	GREEN,
	PINK,
	SAND,
	YELLOW
}

enum BlockTypes {
	Rotate,
	HMirror,
	VMirror,
	HFlip,
	VFlip,
}
var _block_resource : BlockResource
var _block_array : Array[Array] = []
var block_size : int = 32
@export var block_sprite : BlockSprite 

func setup(block_resource : BlockResource) -> void:
	_block_resource = block_resource
	create_block()

func create_block() -> void:
	_block_array = _block_resource.get_correctly_oriented_array()
	block_sprite.setup(_block_array, block_size)
