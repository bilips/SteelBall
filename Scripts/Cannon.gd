extends Spatial

onready var shell = preload("res://Scenes/Object/Shell.tscn")

func _on_ShootTimer_timeout():
	$AnimationPlayer.play("Shoot")
	var _shell = shell.instance()
	_shell.translation = $Cannon/Position3D.translation
	add_child(_shell)
	_shell.shoot()
	$Shoot.play()
