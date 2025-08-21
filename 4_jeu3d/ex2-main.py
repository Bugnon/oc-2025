"""
Raphael Holzer
21 aout 2025
introduction au micro:bit

code démonstrateur avec 10 programs

bouton a : incrémenter le programme
bouton b : executer

0 - afficher un coeur
1 - défiler 'hello'
2 - prononcer 'hello'
3
4
5
6
7
8
9

"""

# Imports go at the top
from microbit import *
import speech

# on commence avec le program 0
p = 0

# Code in a 'while True:' loop repeats forever
while True:
    # choix du programme avec bouton a
    display.show(p)
    if button_a.was_pressed():
        p = p + 1
        if p == 10:
            p = 0

    # le bouton b execute le programme actuel (0..9)
    if button_b.is_pressed():
        if p == 0:
            display.show(Image.HEART)
            sleep(1000)
        elif p == 1:
            display.scroll('hello')
        elif p == 2:
            speech.say('hello')
            

