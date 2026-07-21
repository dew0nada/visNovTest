extends CanvasLayer

@export_category("grouping")
@export var group_ch : ButtonGroup

func set_choices(choices : Dictionary):
	print(choices)
	
	var index = 0
	var btnI = group_ch.get_buttons()
	
	for c in choices.keys():
		print(c)
		btnI[index].text = c
		index += 1 
		
		
		
