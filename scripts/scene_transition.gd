extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	color_rect.modulate.a = 0
	color_rect.hide()

func change_scene(target_scene: String) -> void:
	ResourceLoader.load_threaded_request(target_scene)
	
	color_rect.show()
	animation_player.play("Fade_In")
	await animation_player.animation_finished
	
	while ResourceLoader.load_threaded_get_status(target_scene) == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		await get_tree().process_frame
		
	var new_scene = ResourceLoader.load_threaded_get(target_scene)
	get_tree().change_scene_to_packed(new_scene)
	
	await get_tree().process_frame
	await get_tree().process_frame
	
	animation_player.play("Fade_Out")
	await animation_player.animation_finished
	color_rect.hide()
