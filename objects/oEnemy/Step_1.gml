
// check if player is within the roaming radius

if(distance_to_object(oCharacter) <= roamMaxRadius)
{
	// we need to change the object to agro mode here
}
else
{
	enemyState = EnemyState.ROAM;
}

switch(enemyState)
{
	case EnemyState.ROAM:
	{
		// set roaming if roaming counter is equal to 0
		if(counter <= 0 )
		{
			var _len = random(roamMaxRadius);
			var _dir = random(360);
		
			// given the distance and the direction, get me the X component
			targetX = x + lengthdir_x(_len, _dir);
			targetY = y + lengthdir_y(_len, _dir);
			
			moveSpeed = roamSpeed;
			
			counter = updateCounterMax;
		}
		else 
		{
			counter--;	
		}
		break;
	}
	
	case EnemyState.AGRO:
	{
		// update movement direction here
		targetX = oCharacter.x;
		targetY = oCharacter.y;
		
		moveSpeed = agroSpeed;
		
		break;	
	}
}

if(point_distance(x, y, targetX, targetY) > moveSpeed)
{
	inputX = clamp(targetX - x, -1, 1);	
	inputY = clamp(targetY - y, -1, 1);
}


