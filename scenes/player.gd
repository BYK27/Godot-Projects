extends CharacterBody2D

@export var speed := 700
signal laser(position)
var canShoot : bool = true


func _ready():
	position = Vector2(640, 670)

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	#position += direction * speed * delta
	velocity = direction * speed
	move_and_slide()
	if Input.is_action_just_pressed("pewpew") and canShoot == true:
		laser.emit($LaserStartPosition.global_position)
		canShoot = false
		$LaserTimer.start( )

func _on_laser_timer_timeout():
	canShoot = true
