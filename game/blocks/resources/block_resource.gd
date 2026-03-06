class_name BlockResource
extends Resource

@export var block_array : Array[BlockRow]
@export var block_types : Array[Block.BlockTypes]

func get_correctly_oriented_array() -> Array[Array]:
	var ret_arr : Array[Array] = []
	var unflipped_arr : Array[Array] = []
	
	for row : BlockRow in block_array:
		unflipped_arr.append(row.block_row)
	
	#flip_arr
	for x in range(len(unflipped_arr)):
		ret_arr.append([])
		for y in range(len(unflipped_arr[x])):
			ret_arr[x].append(unflipped_arr[y][x])
	return ret_arr
