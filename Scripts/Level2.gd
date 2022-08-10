extends Spatial

onready var camera = $Camera
onready var player = $Player

export var start_camera_rd = Vector3(-40, 0, 0)
export var delta_camera_position = Vector3(0, -5, -4.6)
export var player_start_position = Vector3(0, 6, 1.25)

func _ready():
	Game.level = self
	Game.level_name = "Level 2"
	Game.crystal = 0
	Game.crystal_max = 2
	
	player.start()

func _physics_process(delta):
	camera.rotation_degrees = start_camera_rd
	camera.translation = lerp(camera.translation, player.translation - delta_camera_position, 0.05)

func _on_Win_body_entered(body):
	if body.name == "Player" and Game.crystal == Game.crystal_max:
		body.get_node("TimeAddTimer").stop()
		body.show_win()
