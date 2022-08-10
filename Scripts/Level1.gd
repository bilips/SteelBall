extends Spatial

export var first_camera_position = Vector3(3.4, 1.4, 12.2)
export var first_camera_rd = Vector3(-17, 42, 0)
export var start_camera_rd = Vector3(-40, 0, 0)
export var delta_camera_position = Vector3(0, -5, -4.6)
export var player_start_position = Vector3(0.4, 0.6, 10)

var is_start = false

onready var camera = $Camera
onready var player = $Player

func start_game():
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(camera, "rotation_degrees", start_camera_rd, 1).set_ease(Tween.EASE_OUT)
	tween.tween_property(camera, "translation", player.translation - delta_camera_position, 1).set_ease(Tween.EASE_OUT)
	yield(tween, "finished")
	is_start = true
	player.start()

func _ready():
	Game.level = self
	Game.level_name = "Level 1"
	Game.crystal_max = 14
	
	camera.translation = first_camera_position
	camera.rotation_degrees = first_camera_rd
	player.translation = player_start_position

func _physics_process(delta):
	if is_start:
		camera.rotation_degrees = start_camera_rd
		camera.translation = lerp(camera.translation, player.translation - delta_camera_position, 0.05)

func _on_DropCheak_body_entered(body):
	if body.name == "Player":
		$Player.player_die()

func _on_EndPlatform_body_entered(body):
	if body.name == "Player" and Game.crystal == Game.crystal_max:
		SceneChanger.change_scene("res://Scenes/Level2.tscn")
