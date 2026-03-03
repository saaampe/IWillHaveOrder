extends Node2D


@export var block_resources : Array[BlockResource]
@onready var block_scene : PackedScene = preload("res://game/blocks/block.tscn")

func _ready() -> void:
	for block_resource : BlockResource in block_resources:
		var new_block : Block = block_scene.instantiate()
		new_block.setup(block_resource)
		add_child(new_block)
		print(new_block._block_array)
