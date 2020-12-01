#!/usr/bin/env python

import os
import time
import random
import argparse
import subprocess

# List of themes and color schemes to choose from
listOfThemes = ['Material-Ocean', "Bloody", "Dribbblish", "DeepCoral", "Gradianto",
                "Lovelace", "NoSleep", "OnePunch", "OutrunDark", "TychoAwake",
                "Vaporwave", "Dark"]
listOfColorSchemes = {"Dribbblish": ['base', 'dark', 'dracula', 'nord-dark', "purple",
                                     'nord-light', 'samourai', 'white', "gruvbox", "horizon"],
                      "Vaporwave": ["NewRetro", "SeaPunk"]}
listOfExtensions = ['dribbblish']


def main(args):

    global listOfThemes, listOfColorSchemes, listOfExtensions
    # Get the current theme and color scheme
    currentTheme = subprocess.check_output(
        'spicetify config current_theme', shell=True)
    currentColorScheme = subprocess.check_output(
        'spicetify config color_scheme', shell=True)
    currentColorScheme = str(currentColorScheme)[
        2:-3] if currentColorScheme.strip() else 'None'
    currentTheme = str(currentTheme)[2:-3]
    colorScheme = None

    if args.theme:
        # Set the theme to the user specified theme
        theme = args.theme
        try:
            if args.scheme and args.scheme in list(listOfColorSchemes.get(args.theme, None)):
                colorScheme = args.scheme
            elif args.theme in list(listOfColorSchemes.keys()):
                colorScheme = random.choice(
                    listOfColorSchemes.get(theme, None))
            else:
                colorScheme = None
        except TypeError:
            pass
    else:
        # Choose a random theme and color scheme from the list and make sure that the same theme is not selected
        theme = currentTheme
        colorScheme = currentColorScheme
        while theme == currentTheme and colorScheme == currentColorScheme:
            theme = random.choice(listOfThemes)
            if theme in list(listOfColorSchemes.keys()):
                colorScheme = random.choice(
                    listOfColorSchemes.get(theme, None))
        if theme not in list(listOfColorSchemes.keys()):
            colorScheme = None

    # Updating the 'extensions' option if previous theme is in extensions list
    if currentTheme.lower() in listOfExtensions:
        os.system(f'spicetify config extensions {currentTheme.lower()}.js-')

    # Applying the randomly selected theme
    os.system(f'spicetify config current_theme {theme}')

    # Updating the 'extensions' option if current theme is in extensions list
    if theme.lower() in listOfExtensions:
        os.system(f'spicetify config extensions {theme.lower()}.js')

    # Updating the color_scheme option if available else set it to ""
    if colorScheme:
        os.system(f'spicetify config color_scheme {colorScheme}')
    else:
        os.system("spicetify config color_scheme ''")

    # Command for the changes to take effect
    os.system('spicetify update')
    # os.system('spicetify restart')
    os.system('clear')

    print_info(currentTheme, currentColorScheme, theme, colorScheme)

    # Sleep for 5 seconds and exit
    # time.sleep(5)


def print_info(currentTheme, currentColorScheme, theme, colorScheme):

    # Print info about the current and previous themes
    print(f'Previous Theme: {currentTheme} \t\tCurrent Theme: {theme}')
    print(f'Previous Color Scheme: {currentColorScheme}', end='\t\t')
    if colorScheme:
        print(f'Current Color Scheme: {colorScheme}')
    else:
        print('Current Color Scheme: None')


if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument('-t', '--theme', dest='theme', default=None, type=str, choices=[
                        'Material-Ocean', "Bloody", "Dribbblish", "DeepCoral", "Gradianto", "Lovelace", "NoSleep", "OnePunch", "OutrunDark", "TychoAwake", "Vaporwave"], help='Change the theme manually')
    parser.add_argument('-s', '--scheme', dest='scheme', default=None, type=str, choices=[
                        'base', 'dark', 'dracula', 'nord-dark', 'nord-light', 'samourai', 'white', 'NewRetro', 'SeaPunk'])
    # parser.print_help()
    args = parser.parse_args()
    main(args)
