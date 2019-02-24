# Impossible Boss Battle 

## How to Run

1. Run preInstal.sh this installs 32 bit libraries that the game needs
1.once it is complete the game will run automatically and should also be fully installed with a icon to re-run 

## How to Solve

1. Start the game and run to hide behind a wall
1. Open gameconqueror and attach to the game
1. Scan for a number equal to your current health and set the Data Type to "Number"
1. One of the values found will be your health, this may take some playing of the game to get a very small list of values. Once you have the value lock it and set it to 100.
1. Play the game and beat the boss now that you are invincible.
1. Once you have beat the game, dump the memory for the process using `gcore -o memory <pid>`
1. Run `strings memory.* | grep <beginning of key>` where <beginning of key> is the part of the key you can see on your screen.
1. Wrap the full key in `MCA{}`

# Flag

MCA{ed3df47e943c1c37c1099bd67e7a2477}