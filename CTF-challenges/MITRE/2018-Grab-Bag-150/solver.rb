require 'RMagick'
require 'pry'

img = Magick::ImageList.new('no1.png').first
pixels = img.get_pixels(0,0,img.columns,img.rows)

for pixel in pixels
  pixel.opacity = 0
end

img.store_pixels(0,0, img.columns, img.rows, pixels)
img.write('output.png')
