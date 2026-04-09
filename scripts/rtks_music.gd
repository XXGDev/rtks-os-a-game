extends Panel

@onready var musicList = $Content/ScrollContainer/List

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	musicList.get_node("RTKSAnthem/Play").pressed.connect(func():
		$realTheKINGS_Anthem.play()
		musicList.get_node("RTKSAnthem/Status").text = "Now playing"
	)
	musicList.get_node("RTKSAnthem/Stop").pressed.connect(func():
		$realTheKINGS_Anthem.stop()
		musicList.get_node("RTKSAnthem/Status").text = "Stopped"
	)
	$realTheKINGS_Anthem.finished.connect(func():
		$realTheKINGS_Anthem.play()
	)
	
	musicList.get_node("Disstrack/Play").pressed.connect(func():
		$Disstrack.play(0.5)
		musicList.get_node("Disstrack/Status").text = "Now playing"
	)
	musicList.get_node("Disstrack/Stop").pressed.connect(func():
		$Disstrack.stop()
		musicList.get_node("Disstrack/Status").text = "Stopped"
	)
	$Disstrack.finished.connect(func():
		$Disstrack.play(0.5)
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
