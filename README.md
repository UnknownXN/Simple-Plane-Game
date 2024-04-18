# Simple-Plane-Game
## Plane Game
(Super) Simple game with lua that I made for CS50 Games' final assignment. You control a plane or spacecraft that must be navigated through asteroids. Through out the game, you can collect points, (temporary) power ups, and coins. You can also buy permanent power ups in a shop with the coins you collect. There's also a simple boss in the game.
## States
This game has a total of 6 game states.
### StartState
You can choose what you want to do here, if you want to start the game or choose a different spacecraft. 
<img src="/readme_img/start_menu.png" alt="Start" width="600"/>
### CraftSelectState
You can choose the color of your spacecraft here. 
<img src="/readme_img/plane_selection_1.png" alt="Plane Selection" width="300"/> <img src="/readme_img/plane_selection_2.png" alt="Plane Selection" width="300"/>
### PlayState
Where the main gameplay takes place. You dodge asteroids, use power ups, and collect coins and points here. Coins can be used in the shop, while points will give you a live in multiples of a certain amount (say after 10000 points)
<img src="/readme_img/power_up.png" alt="Play" width="600"/>

### BossState
A boss will pop up here. Doesn't have to be in a separate state, but is so anyway so it'll be easier to add more bosses.
<img src="/readme_img/boss.png" alt="Boss" width="300"/> <img src="/readme_img/boss2.png" alt="Boss" width="300"/>

### ShopState 
After collecting a number of coins, you can buy permanent power ups here.
<img src="/readme_img/shop.png" alt="Shop" width="600"/>

### EndState
Displays what you have collected and reached. Your distance traveled, points, and coins.
<img src="/readme_img/end_screen.png" alt="End" width="600"/>

## Features Implemented
I believe that this is of sufficient complexity for this courses final project because it combines and builds upon what this course has thought me over the weeks. 
### Animations
Animations were implemented in a way that doesn't make much sense here (on the power ups), but it was the only way I could've added decent animation, as my sprite art isn't the best. 
There is also parallax scrolling for the background, that makes it look as if it's moving.
### Entity States
The player has 2 distinct states. The fly and reload state. The fly state lets the player shoot bullets, and the reload state, like it's name suggests, doesn't. The shop state isn't actually needed, but is there in case something wants to be added.
### Power Ups
There are 3 temporary power ups and 3 permanent power ups. The temporary power ups spawn through out the play state and can be saved and used by pressing 'enter'. The permanent power ups require coins, and can be acquired in the shop state with them. Each of these permanent power ups can be upgraded to level 3.
### Simple GUI
There is a small GUI menu at the bottom right that displays what power up you have saved. There are also buttons and visual feedback in the PlayerSelectState. 
This isn't much GUI, but has most of the classes that are needed to make a more robust GUI.
### Arcade Mechanics
The game doesn't end and keeps going on forever. It does however, reach a point where there is nothing new. After getting all the upgrades, and beating the one boss. Ideally there would be a lot of bosses.
### Data Driven Design
You can change some (power ups, coin, and buyables in the shop state) of the assets in this file, but not all. It could be expanded to the player.
### Boss AI
I'm pretty happy with the boss AI. Just like other games, there is a 'prepare attack state' that telegraphs the boss is about to attack, just like in most other games. Then there is the actual 'attack state' where he rushes towards you. But it also predicts where you are going to go, depending on your direction. So there is a small window of time where you have to dodge his attack or get damaged. His pattern is simple to learn, but you can also build on it with more attacks.


## Controls
* Use the up, down, left and right keys to move
* Use the space button to shoot bullets
* Use the enter key to use your saved power up and exit the shop state

## Things that could be Implemented (given more time)
Things that I wanted to add, but decided not to for various reasons.
* Particle effects when destroying asteroids
* Textures for asteroids that scale depending on the width and height
* More bosses and boss moves
* Actual background music

## Assets
### Planes from [kikitos animation library](https://github.com/kikito/anim8)
### [Space Background](https://opengameart.org/content/space-background-1) from opengameart.org
### Sound effects for [Bfxr](https://www.bfxr.net/) 




