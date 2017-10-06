#!/usr/bin/env python3

from gi.repository import Playerctl, GLib
import time
import sys

MUSIC_ICON = ''
PAUSE_ICON = ''


class PlayerStatus:
    def __init__(self):
        self._player = None
        self._icon = PAUSE_ICON

        self._last_artist = None
        self._last_title = None

    def show(self):
        self._init_player()

        # Wait for events
        main = GLib.MainLoop()
        main.run()

    def _init_player(self):
        while True:
            try:
                self._player = Playerctl.Player()
                self._player.on('metadata', self._on_metadata)
                self._player.on('play', self._on_play)
                self._player.on('pause', self._on_pause)
                self._player.on('exit', self._on_exit)
                break

            except:
                self._print_flush()
                time.sleep(2)

    def _on_metadata(self, player, e):
        if 'xesam:artist' in e.keys() and 'xesam:title' in e.keys():
            self._artist = ', '.join(e['xesam:artist'])
            self._title = e['xesam:title']
            self._print_song

    def _on_play(self, player):
        self._icon = MUSIC_ICON
        self._print_song()

    def _on_pause(self, player):
        self._icon = PAUSE_ICON
        self._print_song()

    def _on_exit(self, player):
        self._init_player()

    def _print_song(self):
        self._print_flush(
            '{}  {} - {}'.format(self._icon, self._artist, self._title))

    """
    Seems to assure print() actually prints when no terminal is connected
    """

    def _print_flush(self, *args, **kwargs):
        print(*args, **kwargs)
        sys.stdout.flush()


PlayerStatus().show()
