if(selected and created_sprite == noone){created_sprite = layer_sprite_create("SpriteLevel",600,200,sSCARY);}
if(!selected and created_sprite != noone){if (sBasicTimer("test",60)){layer_sprite_destroy(created_sprite); created_sprite = noone;}}
selected = 0