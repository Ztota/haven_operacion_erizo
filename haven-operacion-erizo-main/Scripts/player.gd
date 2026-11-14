extends CharacterBody2D

@export var speed := 200.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()

	if direction.x != 0:
		sprite.play("turn")
		sprite.flip_h = direction.x > 0  
	elif direction.y != 0:
		sprite.play("front")
	else:
		sprite.play("idle")
