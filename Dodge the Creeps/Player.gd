extends Area2D

signal hit

export var speed := 400.0
var screen_size := Vector2.ZERO

func _ready():
    screen_size = get_viewport().size
    hide()

# Function is called every frame (50 FPS)
func _process(delta):
    var direction := Vector2.ZERO
    if Input.is_action_pressed("move_right"):
        direction.x += 1
    if Input.is_action_pressed("move_left"):
        direction.x -= 1

    if Input.is_action_pressed("move_down"):
        direction.y += 1
    if Input.is_action_pressed("move_up"):
        direction.y -= 1

    # If two keys are pressed at the same time, speed is still constant
    if direction.length() > 0:
        direction = direction.normalized()
        $AnimatedSprite.play() # Shorthand for get_node("AnimatedSprite")
    else:
        $AnimatedSprite.stop()

    position += direction * speed * delta
    position.x = clamp(position.x, 0, screen_size.x)
    position.y = clamp(position.y, 0, screen_size.y)

    if direction.x != 0:
        $AnimatedSprite.animation = "right"
        $AnimatedSprite.flip_v = false
        $AnimatedSprite.flip_h = direction.x < 0
    elif direction.y != 0:
        $AnimatedSprite.animation = "up"
        $AnimatedSprite.flip_v = direction.y > 0
        $AnimatedSprite.flip_h = false

func start(new_pos: Vector2):
    position = new_pos
    show()
    $CollisionShape2D.disabled = false

func _on_Player_body_entered(_body):
    hide()
    $CollisionShape2D.set_deferred("disabled", true) # set_deffered is safer physics
    emit_signal("hit")
