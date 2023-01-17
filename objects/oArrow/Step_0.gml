x += dirX * speed;
y += dirY * speed;

var _dist = point_distance(startPosX, startPosY, x, y);

if(_dist > range)
	instance_destroy(self);