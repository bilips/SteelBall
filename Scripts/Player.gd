extends RigidBody

export(int) var speed := 50
var can_move = false
onready var time_add_timer = $TimeAddTimer

func start():
	$TimeAddTimer.start()
	can_move = true
	$AnimationPlayer.play("ShowUI")

func _physics_process(delta):
	$CanvasLayer/FPS.visible = Game.show_fps
	$CanvasLayer/FPS.text = str(Engine.get_frames_per_second())
	if can_move:
		var player = Vector3()
		refresh_ui()
		var is_up = Input.is_action_pressed("ui_up")
		var is_down = Input.is_action_pressed("ui_down")
		var is_left = Input.is_action_pressed("ui_left")
		var is_right = Input.is_action_pressed("ui_right")
		
		if is_up:
			player.x = -1
		elif is_down:
			player.x = 1
		else:
			player.x = 0
		if is_left:
			player.z = 1
		elif is_right:
			player.z = -1
		else:
			player.z = 0
		
		player = player.normalized()
		add_torque(player * speed * delta)

func refresh_ui():
	$CanvasLayer/Control/Level.text = Game.level_name
	$CanvasLayer/Control/Time.text = "Time:%ss" % str(Game.time)
	$CanvasLayer/Control/Crystal.text = str(Game.crystal) + "/" + str(Game.crystal_max)

func _on_TimeAddTimer_timeout():
	Game.time += 1

func player_die():
	$TimeAddTimer.stop()
	var anim_player = $CanvasLayer/AnimationPlayer
	sleeping = true
	anim_player.play("ShowDie")
	yield(anim_player, "animation_finished")
	sleeping = false
	translation = Game.level.player_start_position
	anim_player.play_backwards("ShowDie")
	$TimeAddTimer.start()

func show_win():
	$CanvasLayer/AnimationPlayer.play("ShowWin")
