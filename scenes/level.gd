extends Node2D

var meteorScene : PackedScene = load("res://scenes/meteor.tscn")
var laserScene : PackedScene = load("res://scenes/laser.tscn")

func _ready():
	var rng = RandomNumberGenerator.new()
	var size := get_viewport().get_visible_rect().size
	setStars(rng, size)

func _on_meteor_timer_timeout():
	add_meteor()

func add_meteor():
	var meteor = meteorScene.instantiate()
	$Meteors.add_child(meteor)

func _on_player_laser(pos):
	print(pos)
	var laser = laserScene.instantiate()
	laser.position = pos
	$Lasers.add_child(laser)

func setStars(rng: RandomNumberGenerator, size):

	
	for star in $Stars.get_children():
		setStarPosition(rng,size, star)
		setStarSpeed(rng, star)
		setStarScale(rng, star)
		

func setStarPosition(rng: RandomNumberGenerator, size, star):
	var positionX
	var positionY
	positionX = rng.randi_range(0, size.x)
	positionY = rng.randi_range(0, size.y)
	star.position = Vector2(positionX, positionY)


func setStarSpeed(rng: RandomNumberGenerator,  star):
	star.speed_scale = rng.randf_range(0.6, 1.4)
	
func setStarScale(rng: RandomNumberGenerator,  star):
	var randomScale = rng.randf_range(0.5, 1)
	star.scale = Vector2(randomScale, randomScale)
