#!/usr/bin/python3

import curses
import os
import sys
import subprocess


OPTS = [
    "Terminal",
    "Change wallpaper",
    "Change waybar theme",
    "Change polybar theme",
    "Hyprland settings",
    "Tmux settings",
    "Exit"
]


def set_window_title(title: str):
    sys.stdout.write(f"\33]0;{title}\a")
    sys.stdout.flush()


def print_menu(stdscr, idx: int, opts: [str], max_y: int, max_x: int):
    start_y = max_y // 2 - len(opts) // 2 - 3
    menu_width = 44
    start_x = max_x // 2 - menu_width // 2

    max_height = max_y - start_y - 3
    menu_height = len(opts) if len(opts) <= max_height else max_height

    # Draw a box around the menu options with custom color
    menu_win = curses.newwin(menu_height + 2, menu_width, start_y - 1, start_x)
    menu_win.attron(curses.color_pair(8))  # Set color for box (without background)
    menu_win.box()
    menu_win.attroff(curses.color_pair(2))  # Turn off color after drawing box

    y = 0
    for i in range(len(opts)):
        opt = opts[i]

        if i == idx:
            menu_win.attron(curses.color_pair(1) | curses.A_BOLD)
            menu_win.addstr(y + 1, 1, "  " + opt)
            menu_win.attroff(curses.color_pair(1) | curses.A_BOLD)
        else:
            menu_win.attron(curses.color_pair(2))
            menu_win.addstr(y + 1, 1, "   " + opt)
            menu_win.attroff(curses.color_pair(2))
        y += 1
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
    idx = 0
    sub_idx = 0
    in_sub = False
    stdscr.refresh()
    print_menu(stdscr, idx, OPTS, max_y, max_x)

    stdscr.refresh()

    while True:
        key = stdscr.getch()

        if key == 27:
            break

        elif key == curses.KEY_UP:
            if in_sub:
                sub_idx = 0 if sub_idx == 1 else 1
            else:
                idx = max(0, idx - 1)

        elif key == curses.KEY_DOWN:
            if in_sub:
                sub_idx = 0 if sub_idx == 1 else 1
            else:
                idx = min(len(OPTS) - 1, idx + 1)

    curses.echo()
    curses.nocbreak()
    curses.curs_set(1)


curses.wrapper(main)

