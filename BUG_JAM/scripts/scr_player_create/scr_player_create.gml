/// @description player_create(x,y)
/// @param x
/// @param y
function scr_player_create() {
	/*
	**  Usage:
	**      player_create(x,y)
	**
	**  Arguments:
	**      x: x coordinate to create the player in
	**      y: Y coordinate to create the player in
	**
	**  Purpose:
	**      Create the obj_playerparent object
	*/
	var A=instance_create(argument[0], argument[1], obj_playerparent);
	A.MainC=Control;

	return A;



}
