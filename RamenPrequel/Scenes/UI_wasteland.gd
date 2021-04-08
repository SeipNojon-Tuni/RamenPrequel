extends Control

func Strike(name):
	var a=get_node(name)
	a.bbcode_text="[s]"+a.bbcode_text
