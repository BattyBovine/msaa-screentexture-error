extends Node3D

@onready var world_environment : WorldEnvironment = $WorldEnvironment
@onready var post_process_node : MeshInstance3D = $PostProcess
@onready var gobot : MeshInstance3D = $Gobot
@onready var material : StandardMaterial3D = gobot.mesh.surface_get_material(0)


func _on_msaa_toggled(toggled_on:bool) -> void:
	get_viewport().msaa_3d = Viewport.MSAA_2X if toggled_on else Viewport.MSAA_DISABLED


func _on_ssr_toggled(toggled_on:bool) -> void:
	world_environment.environment.ssr_enabled = toggled_on


func _on_post_process_toggled(toggled_on:bool) -> void:
	post_process_node.visible = toggled_on


func _on_metalness_slider_value_changed(value:float) -> void:
	material.metallic = value
