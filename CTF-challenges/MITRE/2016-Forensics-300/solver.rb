require 'RMagick'

img = Magick::ImageList.new('flag.png').first
pixels = img.get_pixels(0,0,img.columns,img.rows)

for pixel in pixels
  pixel.red = (((pixel.red / 256) % 10) * 28) * 256
  pixel.blue = (((pixel.blue / 256) % 10) * 28) * 256
  pixel.green = (((pixel.green / 256) % 10) * 28) * 256
end

img.store_pixels(0,0, img.columns, img.rows, pixels)
img.write('output.png')