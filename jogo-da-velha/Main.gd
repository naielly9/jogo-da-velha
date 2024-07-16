extends Node

# External scenes
var circle_scene = preload("res://Circle.tscn")
var cross_scene = preload("res://Cross.tscn")
# Player (CROSS = 1, CIRCLE = -1)
var player : int
# Grid
var grid_data : Array
var board_size : int
var cell_size : int
var grid_pos: Vector2

func _ready():
	# Preloads symbol scenes
	# circle_scene = preload("res://Circle.tscn")
	# cross_scene = preload("res://Cross.tscn")
	
	board_size = $Board.texture.get_width()
	cell_size = board_size / 3
	
	new_game()

func _process(delta): 
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if event.position.x < board_size:
				grid_pos.x = floor(Vector2(event.position / cell_size).x)
				grid_pos.y = floor(Vector2(event.position / cell_size).y)
				
				if grid_data[grid_pos.y][grid_pos.x] == 0:
					grid_data[grid_pos.y][grid_pos.x] = player
					player *= (-1)
					create_marker(player, grid_pos * cell_size + Vector2(cell_size/2, cell_size/2))
				
					for line in grid_data:
						print(line)
					print('\n')
				
				
func new_game():
	player = 1
	grid_data =	[
		[0,0,0],
		[0,0,0],
		[0,0,0]
	]
	
func create_marker(player, position):
	if player == 1:
		var circle = circle_scene.instance()
		circle.position = position
		add_child(circle)
	else:
		var cross = cross_scene.instance()
		cross.position = position
		add_child(cross)
		
	
