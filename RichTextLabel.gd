extends RichTextLabel

var score = 0

func _process(delta):
	set_text(str(score, "/10"))