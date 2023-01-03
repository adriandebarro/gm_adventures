if(counter <=  0)
{
	// TODO spawn something	
	var deltaX = random_range(-1.0, 1.0);	
	var deltaY = random_range(-1.0, 1.0);

	var actualDeltaX = maxSpawnRadius * deltaX;
	var actualDeltaY = maxSpawnRadius * deltaY;
	
	instance_create_layer(x + actualDeltaX, y + actualDeltaY, "instances", spawnObject);
	counter = spawnInterval;
}
else
{
	counter--;
}
