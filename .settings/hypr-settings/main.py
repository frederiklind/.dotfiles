import curses
import sys
import signal
from ui import UI


def signal_handler(sig, frame):
    sys.exit(0)


def main(stdscr):
    try:
        # Set window title
        sys.stdout.write("\33]0;Settings\a")
        sys.stdout.flush()

        # Do curses setup
        curses.noecho()
        curses.cbreak()
        curses.curs_set(0)
        curses.start_color()
        curses.use_default_colors()

        curses.init_pair(1, curses.COLOR_BLUE, -1)
        curses.init_pair(2, curses.COLOR_RED, -1)
        curses.init_pair(3, curses.COLOR_GREEN, -1)
        curses.init_pair(4, curses.COLOR_YELLOW, -1)
        curses.init_pair(5, curses.COLOR_MAGENTA, -1)
        curses.init_pair(6, curses.COLOR_WHITE, -1)
        curses.init_pair(7, curses.COLOR_CYAN, -1)
        curses.init_pair(8, curses.COLOR_BLACK, -1)

        stdscr.refresh()

        UI(stdscr)

    finally:
        stdscr.clear()
        stdscr.refresh()
        curses.curs_set(1)


signal.signal(signal.SIGINT, signal_handler)

# Start!
curses.wrapper(main)
