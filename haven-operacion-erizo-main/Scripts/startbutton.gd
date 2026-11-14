extends TextureButton

@export var hover_scale := 1.15
var normal_scale := Vector2.ONE

func _ready() -> void:
	normal_scale = scale
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	animate_scale(normal_scale * hover_scale)

func _on_mouse_exited() -> void:
	animate_scale(normal_scale)

func animate_scale(target: Vector2) -> void:
	var tween := create_tween()
	tween.tween_property(self, "scale", target, 0.12)
	
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Boss.tscn")
