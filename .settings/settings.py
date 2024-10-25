#!/usr/bin/python3

import curses
import os
import sys
import subprocess

from options import OPTS_SIDE_MENU

def set_window_title(title: str):
    sys.stdout.write(f"\33]0;{title}\a")
    sys.stdout.flush()

def print_menu(idx: int, opts: [str], menu_win) -> None:
    """
    Print the side menu within the menu_win window.
    Highlights the current option based on idx.
    """
    # Clear only the inside of the window (not the border)
    menu_win.erase()  # Clears the content without affecting the border

    # Print the menu options inside the window
    for i, opt in enumerate(opts):
        if i == idx:
            menu_win.addstr(i + 2, 2, opt, curses.color_pair(2))
        else:
            menu_win.addstr(i + 2, 2, opt, curses.color_pair(1))

    # Refresh the menu window after updating the content
    menu_win.refresh()

def main(stdscr):
    set_window_title("Settings")
    curses.noecho()
    curses.cbreak()
    curses.curs_set(0)
    curses.start_color()
    curses.use_default_colors()

    if curses.has_colors():
        curses.init_pair(1, curses.COLOR_CYAN, -1)
        curses.init_pair(2, curses.COLOR_BLUE, -1)
        curses.init_pair(8, curses.COLOR_BLACK, -1)

    max_y, max_x = stdscr.getmaxyx()
    
    # Create a new window for the side menu (40 columns wide and full height)
    menu_width = 40
    menu_win = curses.newwin(max_y, menu_width, 0, 0)
    
    # Draw the border once, and don't touch it again
    menu_win.box()

    idx = 0
    sub_idx = 0
    in_sub = False
    
    # Initial menu display in the side menu window
    print_menu(idx, OPTS_SIDE_MENU, menu_win)

    while True:
        key = stdscr.getch()

        if key == 27:  # ESC key to exit
            break

        elif key == curses.KEY_UP:
            if in_sub:
                sub_idx = 0 if sub_idx == 1 else 1
            else:
                idx = max(0, idx - 1)
            print_menu(idx, OPTS_SIDE_MENU, menu_win)  # Update menu inside the window

        elif key == curses.KEY_DOWN:
            if in_sub:
                sub_idx = 0 if sub_idx == 1 else 1
            else:
                idx = min(len(OPTS_SIDE_MENU) - 1, idx + 1)
            print_menu(idx, OPTS_SIDE_MENU, menu_win)  # Update menu inside the window

    # Clean up curses settings
    curses.echo()
    curses.nocbreak()
    curses.curs_set(1)

curses.wrapper(main)
