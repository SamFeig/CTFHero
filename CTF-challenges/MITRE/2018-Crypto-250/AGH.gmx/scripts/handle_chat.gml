///handle_chat(data)
var data = argument0;






global.numOfPlayers = data[? "players"];
var roomTemp = data[? "room"];
//show_message(string_length(roomTemp))
roomTemp = string_copy(roomTemp,0,32)
aes_string(string(roomTemp) ,"7AA2701864CB9C4F",1,0,1) // 
roomTemp  =state_to_string() //= string_replace_all(state_to_string(),"n","");
roomTemp = string(string_digits(roomTemp))
roomCheck(roomTemp)

//clipboard_set_text(roomTemp)
//6bacb24d0223ef02db5cc16081d87b2a

