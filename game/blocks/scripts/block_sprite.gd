class_name BlockSprite
extends Node2D

@export var color_list : Array[BlockColorResource]
var block_sprites : Dictionary

func _ready() -> void:
	pass

func setup(block_array : Array[Array], block_size : int) -> void:
	for bc_resource : BlockColorResource in color_list:
		block_sprites[bc_resource.color] = bc_resource.texture
	for col_n in range(len(block_array)):
		for row_n in range(len(block_array[col_n])):
			var color : Block.BlockColors = block_array[col_n][row_n]
			
			if color ==  Block.BlockColors.NULL:
				continue	
						
			var cur_neighbours : Array[Array] = [[0,0,0],[0,0,0],[0,0,0]]
			for x in range(max(0,col_n-1),min(col_n+2,len(block_array))):
				for y in range(max(0,row_n-1),min(row_n+2,len(block_array[col_n]))):
					if block_array[x][y] == Block.BlockColors.NULL or (x == col_n and y == row_n):
						continue
					cur_neighbours[1+x-col_n][1+y-row_n] = 1
			
			for pos_neigh : String in neighbour_map:
				var pos_neigh_arr : Array = str_to_var(pos_neigh)
				var correct_match : bool = true
				for x in range(3):
					for y in range(3):
						if pos_neigh_arr[y][x] == 0 and cur_neighbours[x][y] == 1:
							correct_match = false
						elif pos_neigh_arr[y][x] == 1 and cur_neighbours[x][y] == 0:
							correct_match = false
				if correct_match:
					var new_sprite : Sprite2D = Sprite2D.new()
					new_sprite.texture = block_sprites[color]
					new_sprite.hframes = 17
					new_sprite.vframes = 5
					var frame_index : Array =  neighbour_map[pos_neigh]
					print(frame_index)
					new_sprite.frame = frame_index[0] + frame_index[1] * new_sprite.hframes
					print(new_sprite.frame)
					new_sprite.position.x = col_n * block_size + block_size / 2
					new_sprite.position.y = row_n * block_size + block_size / 2
					add_child(new_sprite)
			

var neighbour_map : Dictionary = {
	str([[2,0,0],
		 [0,0,1],
		 [0,1,1]]) : [0,0],
	str([[2,0,2],
		 [1,0,1],
		 [1,1,1]]) : [1,0],
	str([[0,0,2],
		 [1,0,0],
		 [1,1,0]]) : [2,0],
	str([[2,0,2],
		 [0,0,0],
		 [2,1,2]]) : [4,0],
	str([[1,1,1],
		 [1,0,1],
		 [1,1,0]]) : [6,0],
	str([[1,1,1],
		 [1,0,1],
		 [0,1,1]]) : [7,0],
	str([[0,1,1],
		 [1,0,1],
		 [0,1,1]]) : [9,0],
	str([[0,1,0],
		 [1,0,1],
		 [1,1,1]]) : [10,0],
	str([[1,1,0],
		 [1,0,1],
		 [0,1,0]]) : [12,0],
	str([[0,1,1],
		 [1,0,1],
		 [0,1,0]]) : [13,0],
	str([[0,1,0],
		 [1,0,1],
		 [0,1,0]]) : [15,0],
	str([[2,1,1],
		 [0,0,1],
		 [2,1,1]]) : [0,1],
	str([[1,1,1],
		 [1,0,1],
		 [1,0,1]]) : [1,1],
	str([[1,1,2],
		 [1,0,0],
		 [1,1,2]]) : [2,1],
	str([[2,1,2],
		 [0,0,0],
		 [2,1,2]]) : [4,1],
	str([[1,1,0],
		 [1,0,1],
		 [1,1,1]]) : [6,1],
	str([[0,1,1],
		 [1,0,1],
		 [1,1,1]]) : [7,1],
	str([[1,1,1],
		 [1,0,1],
		 [0,1,0]]) : [9,1],
	str([[1,1,0],
		 [1,0,1],
		 [1,1,0]]) : [10,1],
	str([[0,1,0],
		 [1,0,1],
		 [1,1,0]]) : [12,1],
	str([[0,1,0],
		 [1,0,1],
		 [0,1,1]]) : [13,1],
	str([[1,1,0],
		 [1,0,1],
		 [0,1,1]]) : [15,1],
	str([[0,1,1],
		 [1,0,1],
		 [1,1,0]]) : [16,1],
	str([[2,1,1],
		 [0,0,1],
		 [2,0,2]]) : [0,2],
	str([[1,1,1],
		 [1,0,1],
		 [2,0,2]]) : [1,2],
	str([[1,1,2],
		 [1,0,0],
		 [2,0,2]]) : [2,2],
	str([[2,1,2],
		 [0,0,0],
		 [2,0,2]]) : [4,2],
	str([[2,0,2],
		 [1,0,1],
		 [1,1,0]]) : [6,3],
	str([[2,0,2],
		 [1,0,1],
		 [0,1,1]]) : [7,3],
	str([[2,1,1],
		 [0,0,1],
		 [2,1,0]]) : [9,3],
	str([[1,1,2],
		 [1,0,0],
		 [0,1,2]]) : [10,3],
	str([[2,0,2],
		 [1,0,1],
		 [0,1,0]]) : [12,3],
	str([[0,1,2],
		 [1,0,0],
		 [0,1,2]]) : [13,3],
	str([[2,0,2],
		 [0,0,1],
		 [2,1,0]]) : [15,3],
	str([[2,0,2],
		 [1,0,0],
		 [0,1,2]]) : [16,3],
	str([[2,0,2],
		 [0,0,1],
		 [2,0,2]]) : [0,4],
	str([[2,0,2],
		 [1,0,1],
		 [2,0,2]]) : [1,4],
	str([[2,0,2],
		 [1,0,0],
		 [2,0,2]]) : [2,4],
	str([[2,0,2],
		 [0,0,0],
		 [2,0,2]]) : [4,4],
	str([[1,0,0],
		 [1,0,1],
		 [2,0,2]]) : [6,4],
	str([[0,0,1],
		 [1,0,1],
		 [2,0,2]]) : [7,4],
	str([[2,1,0],
		 [0,0,1],
		 [2,1,1]]) : [9,4],
	str([[0,1,2],
		 [1,0,0],
		 [1,1,2]]) : [10,4],
	str([[2,1,0],
		 [0,0,1],
		 [2,1,0]]) : [12,4],
	str([[0,1,0],
		 [1,0,1],
		 [2,0,2]]) : [13,4],
	str([[2,1,0],
		 [0,0,1],
		 [2,0,2]]) : [15,4],
	str([[0,1,2],
		 [1,0,0],
		 [2,0,2]]) : [16,4],
}	
