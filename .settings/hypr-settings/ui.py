import curses

from opts import TABS


class UI(object):

    max_y: int
    max_x: int
    win_tab: "curses.window"
    win: "curses.window"
    y_left: int
    y_right: int


    def __init__(self, stdscr) -> None:
        self.stdscr = stdscr
        max_y, max_x = self.stdscr.getmaxyx()

        self.max_y = max_y
        self.max_x = max_x

        self.y_left = 0
        self.y_right = 0
        
        self.make_wins()

        self.run()


    def make_wins(self) -> None:
        self.stdscr.clear()
        self.win_tab = curses.newwin(1, 35, 10, 25)
        self.win = curses.newwin(self.max_y - 20, self.max_x - 85, 10, 60)
        
        self.win_tab.attron(curses.color_pair(1))
        self.win.attron(curses.color_pair(1))
        self.win_tab.attroff(curses.color_pair(1))
        self.win.attroff(curses.color_pair(1))

        self.render_tabs()
        self.refresh_all()
        self.stdscr.refresh()


    def refresh_all(self) -> None:
        self.win_tab.refresh()
        self.win.refresh()
    

    def adjust_maxyx(self) -> None:
        max_y, max_x = self.stdscr.getmaxyx()
        if (self.max_y, self.max_x) != (max_y, max_x):
            self.max_y = max_y
            self.max_x = max_x
            self.stdscr.clear()
            self.stdscr.refresh()

            self.make_wins()


    def render(self) -> None:
        self.render_box() 
        self.render_tabs()
        self.refresh_all()

    def render_box(self) -> None:
        self.win.attron(curses.color_pair(1))
        self.win.box()
        self.win.attroff(curses.color_pair(1))

    def render_tabs(self) -> None:
        x = 1
        for a, b in enumerate(TABS):
            self.win_tab.addstr(1, x + 2, b)



    def run(self) -> None:
        self.render()
        while True:
            # self.adjust_maxyx()
            key = self.stdscr.getch()
            

            if key == ord("q"):
                break

            self.render()

            
            

        
