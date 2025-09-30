"""
TP robot 2

Nom: ...
Classe: ...
Date: ...
No du robot: ...

Dans ce TP vous allez explorer comment
- prog 0 : télécommander le robot et la pince
- prog 1 : télécommander et changer la vitesse
- prog 2 : faire clignoter les 4 LED de façon aléatoire
- prog 4 : faire clignoter les 4 LED de façon régulier
- prog 5 : 4 dessins de noel et une musique
- prog 6 : visuliser un capteur de lumière avec 25 LED
- prog 7 : visuliser deux capteurs de lumière avec 2 barres à 5 LED
- prog 8 : suivre une ligne
"""

from microbit import *
import KitronikMOVEMotor
import music
import radio
import neopixel
import random

robot = KitronikMOVEMotor.MOVEMotor()
robot.move(0, 0)
robot.goToPosition(1, 90)

# le group doit correspondre au kit (1..15)
g = 15
display.scroll(g)
radio.on()
radio.config(group=g)

prog = 0 # programme actuel (0..9)
display.show(prog)

red = (100, 0, 0)
green = (0, 100, 0)
blue = (0, 0, 100)

yellow = (100, 100, 0)
cyan = (0, 100, 100)
magenta = (100, 0, 100)
orange = (100, 50, 0)

black = (0, 0, 0)
white = (100, 100, 100)

colors = (black, red, orange, yellow, green, cyan, blue, magenta, white)

np = neopixel.NeoPixel(pin8, 4)
sleep(1000)
for i in range(4):
    np[i] = black
np.show()

hexa = '0123456789ABCDEF'
v = 4 # vitesse actuelle


def avancer(d):
    # avancer ou reculer de d centimètres
    d0 = 10.3 # distance de calibration
    if d>0:
        robot.move(120, 120, 20)
        robot.move(60, 60, d/d0*1000)
    else:
        robot.move(-120, -120, 20)
        robot.move(-60, -60, -d/d0*1000)

def tourner(a):
    # pivoter un angle a degrés
    d = a / 140 * 1000
    if a>0:
        robot.move(120, -120, 10)
        robot.move(60, -60, d)
    else:
        robot.move(-120, 120, 10)
        robot.move(-60, 60, -d)

def arc(a):
    # arc de cercle de rayon 4 cm
    d = a / 68 * 1000
    if a > 0:
        robot.move(60, 0, d)
    else:
        robot.move(0, 60, -d)

def arc2(a):
    # arc de cercle de rayon 2 cm
    d = a / 230 * 1000
    if a > 0:
        robot.move(120, -60, d)
    else:
        robot.move(-60, 120, -d)

def coeur():
    # coeur de noel
    avancer(4)
    arc2(225)
    tourner(-180)
    arc2(225)
    avancer(4)

def boule():
    # boule de noel
    avancer(5)
    tourner(-90)
    arc2(360)

def lights():
    for i in range(4):
        np[i] = random.choice(colors)
        np.show()

def blink(i, t0, t1, col, col2=black):
    t = running_time()
    if t % t0 < t1:
        np[i] = col
    else:
        np[i] = col2
    np.show()

jingle = ('e5:2', 'e', 'e:4', 
          'e:2', 'e', 'e:4', 
          'e:2', 'g', 'c', 'd', 
          'e:8',
          'f:2', 'f', 'f', 'f',
          'f', 'e', 'e', 'e', 
          'e', 'd', 'd', 'e',
          'd:4', 'g',
          'e:2', 'e', 'e:4', 
          'e:2', 'e', 'e:4', 
          'e:2', 'g', 'c', 'd', 
          'e:8',
          'f:2', 'f', 'f', 'f',
          'f', 'e', 'e', 'e', 
          'g', 'g', 'f', 'd',
          'c:8')

while True:
    # le bouton A incrémente les programmes (0..9)
    if button_a.was_pressed():
        robot.move(0, 0)
        prog = (prog + 1) % 10
        display.show(prog)
        music.pitch(440, 20)

    # faire bouger le robot avec les 4 touches de direction
    # L/R pour pivoter, U/D pour avancer et reculer
    # F1: ouvrir la pince, F2: fermer la pince
    if prog == 0:
        msg = radio.receive()
        if msg:
            display.show(msg)
            if msg == '0':
                robot.move(0, 0)
            elif msg == 'u':
                robot.move(-80, -80)
            elif msg == 'r':
                robot.move(80, -80)
            elif msg == 'l':
                robot.move(-80, 80)
            elif msg == 'd':
                robot.move(80, 80)
            elif msg == '2':
                robot.goToPosition(1, 20)
            elif msg == '1':
                robot.goToPosition(1, 160)

    # pivoter avec R/L
    # avancer avec U, stop avec D
    # changer la vitesse v avec F1/F2
    # afficher la vitesse v sous forme 0..F
    if prog == 1:
        msg = radio.receive()
        if msg:
            if msg == 'u':
                robot.move(v*15, v*15)
            elif msg == 'r':
                robot.move(80, -80)
            elif msg == 'l':
                robot.move(-80, 80)
            elif msg == 'd':
                robot.move(0, 0)
                v = 0     
            elif msg == '1':
                v = (v + 1) % 16
                robot.move(v*15, v*15)  
            elif msg == '2':
                v = (v - 1) % 16
                robot.move(v*15, v*15)
            display.show(hexa[v])

    # 4 lumières aléatoires avec des intervalles aléatoires
    if prog == 2:
        for i in range(4):
            np[i] = random.choice(colors)
            np.show()
            sleep(random.randint(100, 500))
            music.pitch(random.randint(220, 440), 20)

    # 4 lumires clignotatant avec des frequences spécifiques
    if prog == 3:
        blink(0, 1000, 100, red)
        blink(1, 2000, 300, blue)
        blink(2, 1500, 500, cyan, magenta)
        blink(3, 400, 200, orange)

    # dessin et musique de noel
    if prog == 4:
        msg = radio.receive()
        if msg:
            if msg == '0':
                robot.move(0, 0)
            elif msg == 'u':
                coeur()
            elif msg == 'r':
                boule()
            elif msg == 'l':
                arc(360)
            elif msg == 'd':
                arc2(360)
            elif msg == '2':
                music.play(jingle, wait=False, loop=True)
            elif msg == '1':
                music.stop()

    
    # visualiser la valeur du capteur left avec les 25 LED
    if prog == 5:
        left = pin1.read_analog()
        right = pin2.read_analog()
        display.clear()
        for i in range(left*25//1000):
            display.set_pixel(i//5, i%5, 9)
        sleep(100)

    # visualiser les deux capteur de lumière avec 2 barres de 5 LEDS
    if prog == 6:
        left = pin1.read_analog()
        right = pin2.read_analog()
        display.clear()
        for i in range(left//200):
            display.set_pixel(0, i, 9)
        for i in range(right//200):
            display.set_pixel(4, i, 9)
        sleep(100)

    # s'arrêter au bord de la table
    if prog == 7:
        if button_b.is_pressed():
            music.pitch(880, 10)
            robot.move(60, 60)

        left = pin1.read_analog()
        right = pin2.read_analog()
        if left < 100 or right < 100:
            robot.move(0, 0)

    # suivre une ligne
    if prog == 8:
        left = pin1.read_analog()
        right = pin2.read_analog()
        d = (left - right)
        d = d // 20
        robot.move( 5 - d, 5 + d)

    # calibrer la distance pour v = 20, 40, ... 140
    if prog == 9:
        if button_b.is_pressed():
            for v in range(20, 160, 20):
                robot.move(v, v, 500)
                robot.move(-v, -v, 500)
                sleep(1000)
