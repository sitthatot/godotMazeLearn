extends Node2D


signal approve_dfa(approve_text)
var queue = []

func _ready():
	#emit_signal("approve_dfa","From Readyyyyyyyyyyyyyyyyy")
	pass

class node:
	var name:String
	var is_final_state:bool = false
	var transition_inputU:node
	var transition_inputD:node
	var transition_inputL:node
	var transition_inputR:node
	
	func _init(Name: String = "", is_final:bool = false):
		name  = Name
		is_final_state = is_final
	
	func setTransition(transition_InputU:node, transition_InputD:node,transition_InputL:node,transition_InputR:node):
		transition_inputU = transition_InputU
		transition_inputD = transition_InputD
		transition_inputL =transition_InputL
		transition_inputR = transition_InputR
	
class myDFA_L1:
	# defind State 
	var q0 = node.new("q0")
	var q1 = node.new("q1")
	var q2 = node.new("q2")
	var q3 = node.new("q3",true) #final State
	var trap = node.new("trap")
	
	func _init():
		# setState to next State
		q0.setTransition(q0,q0,q0,q1)  # InputU, InputD, InputL, InputR
		q1.setTransition(q1,q2,q0,q1)
		q2.setTransition(q2,trap,q3,q2)
		q3.setTransition(trap,trap,trap,trap)
	
	func determine(input: String):
		var presentState = node.new()
		presentState = q0
		print(presentState.name)
		for i in input:
			if(i == "U"):
				if (presentState.name != presentState.transition_inputU.name):
					presentState = presentState.transition_inputU
					DfaSig.emit_signal("DFA_check","Test TextUUUUUUUU")
					#print("turn UP")
					print(presentState.name)
				else:
					print("StayStill")
					print(presentState.name)
			elif(i == "R"):
				if (presentState.name != presentState.transition_inputR.name):
					presentState = presentState.transition_inputR
					DfaSig.emit_signal("DFA_check","Test TextRRRRRRRR")
					#print("turn Right")
					print(presentState.name)
				else:
					print("StayStill")
					print(presentState.name)
					
			elif(i == "D"):
				if (presentState.name != presentState.transition_inputD.name):
					presentState = presentState.transition_inputD
					DfaSig.emit_signal("DFA_check","Test TextDDDDDDDD")
					#print("turn Down")
					print(presentState.name)
				else:
					print("StayStill")
					print(presentState.name)
			elif(i == "L"):
				if (presentState.name != presentState.transition_inputL.name):
					presentState = presentState.transition_inputL
					DfaSig.emit_signal("DFA_check","Test TextLLLLLLLL")
					#print("turn Left")
					print(presentState.name)
				else:
					print("StayStill")
					print(presentState.name)
		return presentState.is_final_state
# Called when the node enters the scene tree for the first time.	
	
	
func _on_text_input_move_text_submitted(new_text):
	var inpToDFA = myDFA_L1.new()
	var is_complete = inpToDFA.determine(new_text.to_upper())
	print(is_complete)

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


