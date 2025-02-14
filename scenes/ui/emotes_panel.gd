extends Panel

@onready var animated_sprite_2d: AnimatedSprite2D = $Emote/AnimatedSprite2D
@onready var emote_idle_timer: Timer = $EmoteIdleTimer

var idle_emote: Array = ["emote_1_idle", "emote_2_smile", "emote_3_ear_wave", "emote_4_blink"]

func _ready() -> void:
	animated_sprite_2d.play("emote_1_idle")
	
	InventoryManager.inventory_changed.connect(on_inventory_changed)
	GameDialogueManager.feed_the_animals.connect(on_feed_animals)
	
func play_emote(animation: String) -> void:
	animated_sprite_2d.play(animation)


func _on_emote_idle_timer_timeout() -> void:
	var index = randi_range(0, 3)
	var emote = idle_emote[index]
	
	animated_sprite_2d.play(emote)
	
func on_inventory_changed() -> void:
	animated_sprite_2d.play("emote_7_excited")
	
func on_feed_animals() -> void:
	animated_sprite_2d.play("emote_6_love_kiss")
