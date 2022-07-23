extends KinematicBody2D

const SPEED := 100

func _ready():
    $VisibilityNotifier2D.connect(
        "screen_exited",
        self,
        "_on_VisibilityNotifier2D_screen_exited"
    )

func _process(delta):
    position.x -= SPEED * delta

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()
