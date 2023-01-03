//var currentTime = get_timer() / 1000000;
//var deltaTime = currentTime - previousUpdateTime;
//var frameRate = sprite_get_speed(enemy_sprite);

//if(deltaTime >= frameRate)
//{	
	//image_index++;
	// update the time since last
	//previousUpdateTime = currentTime;
var animationStartIndex = 0;
var animationEndIndex = 0;
switch(enemyState)
{
	case EnemyState.IDLE:
	{
		animationStartIndex = idleAnimationStartIndex;
		animationEndIndex = idleAnimationEndIndex;			
		break;
	}
			
	case EnemyState.ROAM:
	{
		animationStartIndex = walkingAnimationStartIndex;
		animationEndIndex = walkingAnimationEndIndex;
		break; 
	}
		
	default:
		image_index = 0;
		break;
}
	
var temp = ((image_index) % (animationEndIndex));
image_index = max(animationStartIndex, temp);
	
if(inputX > 0 || inputY > 0)
{
	
	if(inputX != 0)
		image_xscale = sign(inputX);
	
	x += inputX * moveSpeed;
	y += inputY * moveSpeed;
}