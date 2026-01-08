#!/usr/bin/python3

import curses
import os
import sys
import subprocess


def set_window_title(title: str):
    sys.stdout.write(f"\33]0;{title}\a")
    sys.stdout.flush()


def execute_cmd(idx: int) -> None:
    if idx == 0:
        os.system("shutdown -h now")
    elif idx == 1:
        os.system("reboot")
    elif idx == 2:
        os.system("systemctl hibernate")
    elif idx == 3:
        os.system("pkill -KILL -u $USER")
    elif idx == 4:
        subprocess.run(
            ['$HOME/.dotfiles/scripts/lockscreen.sh'],
            shell=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )
    elif idx == 5:
        curses.exit_curses()


def print_figlet(stdscr, max_y: int, max_x: int, title: [str]) -> None:
    start_y = max_y // 2 - 10
    start_x = max_x // 2 - len(title[0]) // 2
    for i, ln in enumerate(title):
        stdscr.addstr(start_y + i, start_x, ln, curses.color_pair(1) | curses.A_BOLD)
    stdscr.refresh()


def print_menu(stdscr, idx: int, opts: [str], max_y: int, max_x: int):
    start_y = max_y // 2 - len(opts) // 2 + 2
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


def print_sub_menu(stdscr, idx: int, max_y: int, max_x: int, is_sub: bool, title: str = "Are you sure?"):
    start_y = max_y // 2 + 7
    start_x = max_x // 2 - 22

    # Draw a box around the menu options with custom color
    menu_win = curses.newwin(5, 44, start_y - 1, start_x)
    menu_win.attron(curses.color_pair(8))  # Set color for box (without background)
    menu_win.box()
    menu_win.attroff(curses.color_pair(8))  # Turn off color after drawing box

    # Print the title inside the box
    menu_win.addstr(1, 22 - len(title) // 2, title, curses.color_pair(2))

    options = ["Yes", "Cancel"]

    for i in range(2):
        opt = options[i]
        if i == idx:
            menu_win.attron(curses.color_pair(1) | curses.A_BOLD)
            menu_win.addstr(3, 12 + i * 10, f"[ {opt} ]")
            menu_win.attroff(curses.color_pair(1) | curses.A_BOLD)
        else:
            menu_win.attron(curses.color_pair(2))
            menu_win.addstr(3, 12 + i * 10, f"  {opt}  ")
            menu_win.attroff(curses.color_pair(2))

    menu_win.refresh()


def main(stdscr):
    set_window_title("power")
    curses.noecho()
    curses.cbreak()
    curses.curs_set(0)

    # Use terminal's default colors for background
    curses.start_color()
    curses.use_default_colors()

    if curses.has_colors():
        curses.init_pair(1, curses.COLOR_CYAN, -1)
        curses.init_pair(2, curses.COLOR_BLUE, -1)
        curses.init_pair(8, curses.COLOR_BLACK, -1)

    OPTS = [
        "    Shutdown",
        "    Reboot",
        " 󰒲   Hibernate",
        " 󰗽   Log out",
        "    Lock",
        " 󰜺   Cancel"
    ]
    
    TITLE = [
        "__________________       __________________ ",
        "___  __ \\_  __ \\_ |     / /__  ____/__  __ \\",
        "__  /_/ /  / / /_ | /| / /__  __/  __  /_/ /",
        "_  ____// /_/ /__ |/ |/ / _  /___  _  _, _/ ",
        "/_/     \\____/ ____/|__/  /_____/  /_/ |_|  ",
        "                                           "
    ]

    max_y, max_x = stdscr.getmaxyx()
    idx = 0
    sub_idx = 0
    in_sub = False

    print_figlet(stdscr, max_y, max_x, TITLE)
    print_menu(stdscr, idx, OPTS, max_y, max_x)

    stdscr.refresh()

    prev_idx = idx

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

        elif key == curses.KEY_ENTER or key in [10, 13]:
            if in_sub:
                if sub_idx == 1:
                    in_sub = False
                    sub_idx = 0
                    stdscr.clear()
                    print_figlet(stdscr, max_y, max_x, TITLE)
                    print_menu(stdscr, idx, OPTS, max_y, max_x)
                else:  # Execute the selected action
                    execute_cmd(idx)
                    break
            else:
                if idx in [0, 1, 3]:
                    in_sub = True
                    print_sub_menu(stdscr, sub_idx, max_y, max_x, in_sub)
                else:
                    execute_cmd(idx)
                    break

        # Only re-render the menu when the index changes
        if not in_sub and idx != prev_idx:
            print_menu(stdscr, idx, OPTS, max_y, max_x)
            prev_idx = idx

        if in_sub:
            print_sub_menu(stdscr, sub_idx, max_y, max_x, in_sub)

    curses.echo()
    curses.nocbreak()
    curses.curs_set(1)


curses.wrapper(main)
