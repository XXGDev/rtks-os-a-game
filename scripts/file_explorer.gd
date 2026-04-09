extends Panel

@onready var FileContents = $Content/HSplitContainer/FileContents

func clear_contents():
	for content in FileContents.get_children():
		content.visible = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	FileContents.get_node("files_ThisPC").item_activated.connect(func(index):
		print("got clicked ThisPC! "+str(index))
		match index:
			0: # Desktop
				clear_contents()
				FileContents.get_node("files_ThisPC-Desktop").visible = true
			1: # Documents
				clear_contents()
				FileContents.get_node("noFilesFound").visible = true
			2: # Music
				clear_contents()
				FileContents.get_node("files_ThisPC-Music").visible = true
			3: # RTKS_OS (System)
				clear_contents()
				FileContents.get_node("files_ThisPC-System").visible = true
	)
	
	FileContents.get_node("files_ThisPC-Desktop").item_activated.connect(func(index):
		print("got clicked Desktop! "+str(index))
	)
