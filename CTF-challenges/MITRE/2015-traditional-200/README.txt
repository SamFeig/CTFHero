Implemenation:

I made the video with Windows Movie Maker. I used cat to append the link for the Youtube video on the end of a zip file filled with Doctor Who pictures. I used python SimpleHTTPServer to serve a webpage with the index as the folder containing the zip file. Use the command 'python -m SimpleHTTPServer' while in the directory of the project and then find the webpage at localhost:8000/.

Solution:

Download the zip file. Open it to view or edit in a text editor such as notepad++. A Youtube link can be found at the bottom of the file.

Go to the link found and it will take you to an unlisted Youtube video. This video has some spots where it clearly jumps to another image.

Find all of the images, each which have a sentence in them. The users may notice that these sentences have strange grammatical formatting, and that the first letter of each sentence is one that could be in the flag.

By getting the first character of each image file and arranging them in order of the number of words in the image they came from, you get the flag, which is:

MCA-D3EB706F