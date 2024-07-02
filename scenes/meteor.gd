extends Area2D

var meteorSpeed := 150.0
var meteorRotationSpeed := 0.2
var meteorRotationDirection : float

func _ready():
	var rng := RandomNumberGenerator.new()
	
	#texture
	var texture: String = "res://kenney_space-shooter-redux/PNG/Meteors/meteor" + getColor(rng) + "_big" + getNumber(rng) +  ".png"
	print(texture)
	$MeteorSprite.texture = load(texture)
	
	#positions and speeds
	setPosition(rng)
	setSpeed(rng)
	

func _process(delta):
	#rotation += meteorRotationSpeed * delta
	position += Vector2(meteorRotationDirection, 1) * meteorSpeed * delta
	rotation_degrees += meteorRotationSpeed * delta


func _on_body_entered(_body):
	pass # Replace with function body.


func getSize(rng: RandomNumberGenerator):
	var sizeString: String
	var size = rng.randf()
	if size < 0.1: sizeString = "small"
	elif  size > 0.7: sizeString = "med"
	else: sizeString = "big"
	return sizeString


func getNumber(rng: RandomNumberGenerator):
	var numberString: String
	var size = rng.randf()
	if size < 0.25: numberString = "1"
	elif  size > 0.75: numberString = "2"
	elif size > 0.5: numberString  = "4"
	else: numberString = "3"
	return numberString

func getColor(rng: RandomNumberGenerator):
	var colorString: String
	var size = rng.randf()
	if size < 0.2: colorString = "Brown"
	else: colorString = "Grey"
	return colorString

func setPosition(rng: RandomNumberGenerator):
	var width = get_viewport().get_visible_rect().size[0]
	var positionX = rng.randf_range(0, width)
	var positionY = rng.randf_range(-150, -50)
	position = Vector2(positionX, positionY)

func setSpeed(rng: RandomNumberGenerator):
	meteorSpeed = rng.randf_range(200, 500)
	meteorRotationDirection = rng.randf_range(-1, 1)
	meteorRotationSpeed = rng.randf_range(40, 100)
