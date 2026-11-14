
extends Control

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/Boss.tscn")

func _on_how_to_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://HowToPlay.tscn")
