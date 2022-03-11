extends Sprite # Inherits Sprite class

var speed = 400
var angular_speed = PI

# In Godot, everything is a class
func _init(): # Class' constructor
	print("Hello, world!")

func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1
	rotation += angular_speed * direction * delta
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

# delta: Time since last frame
# _process(): Runs each frame
# func _process(delta):
	# rotation += angular_speed * delta
	# velocity = vector pointing up relative to sprite
	# var velocity = Vector2.UP.rotated(rotation) * speed
	# position += velocity * delta


func _on_Button_pressed():
	set_process(not is_processing())

# Connecting signal without Node tab on right
# func _ready():
# 	var timer = get_node("Timer")
#	timer.connect("timeout", self, "_on_Timer_timeout")

func _on_Timer_timeout():
	visible = not visible
	
# Custom Signals
signal health_depleted
signal health_changed(old_value, new_value)
var health = 10
func take_damage(amount):
	var old_health = health
	health -= amount
	if health <= 0:
		emit_signal("health_depleted")
	emit_signal("health_changed", old_health, health)
