This challenge involves removing a hidden image from another. The encoded image is in the last digit of the RGB values of the primary image
for example, if a coordinate on the given image has R = 232; G = 121; B = 14 then the corresponding colors on the output image would be R = 2; G = 1; B = 4 
These numbers un from 0 - 9 so it would have to be scaled up by some factor. 28 works nice (255/9) = 28.333 

The key is found on Captain Picard's uniform once he is extracted from the flag. 

MCA FLAG = MCA-0173D19F


///////////////SAMPLE SOLVING CODE///////////////////////////////

for(w = 0; w < width; w+=1)
{
for(h = 0; h < height; h+=1)
{
col =  surface_getpixel(serf,w,h) // grab the color at the specified coordinates
r = color_get_red(col); g = color_get_green(col); b = color_get_blue(col); // split color up into rgb
r = r mod 10; g = g mod 10;b = b mod 10; // grab only the last digit from the color value
col = make_color_rgb(round((r)*28),round((g)*28),round((b)*28)) // scale up the tiny number to a larger value 
draw_point_color(w,h,col) // draw the point to a surface
}
}
