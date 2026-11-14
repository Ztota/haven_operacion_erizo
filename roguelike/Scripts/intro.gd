extends Control

@export var imagenes: Array[Texture2D] = [
	preload("res://Assets/Intro/Logo.png"),preload("res://Assets/Intro/pixil-frame-0.png")
]

@export var segundos_visible := 2.0

@export var ruta_menu := "res://Scenes/menu.tscn"

@onready var imagen: TextureRect = $TextureRect

func _ready() -> void:
	reproducir_intro()

func reproducir_intro() -> void:
	for textura in imagenes:
		imagen.texture = textura
		imagen.modulate.a = 0.0

		var entrada = create_tween()
		entrada.tween_property(imagen, "modulate:a", 1.0, 0.5)
		await entrada.finished

		await get_tree().create_timer(segundos_visible).timeout

		var salida = create_tween()
		salida.tween_property(imagen, "modulate:a", 0.0, 0.5)
		await salida.finished

	get_tree().change_scene_to_file(ruta_menu)
