# Introductory titles
#
# Copyright (C) 2021--2022 Simon Dobson
#
# This file is part of cncp, a network science miscellany
#
# cncp is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# cncp is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with cncp. If not, see <http://www.gnu.org/licenses/gpl.html>.

from manim import *


class Intro(Scene):

    def __init__(self, title = 'An example episode title', subtitle = None):
        super().__init__()
        self._title = title
        self._subtitle = subtitle

    def construct(self):
        # logo
        logo = ImageMobject('./logo.png')
        logo.height=2
        logo.shift(3 * LEFT)

        # series title
        seriesTitle = Text('Complex networks, complex processes', font_size=26)
        seriesTitle.next_to(logo, RIGHT)
        seriesSubtitle = Text('A network science miscellany', slant=ITALIC, font_size=20)
        seriesSubtitle.align_to(seriesTitle, LEFT).shift(0.4 * DOWN)
        seriesGroup = VGroup(seriesTitle, seriesSubtitle)
        seriesGroup.next_to(logo, RIGHT)

        # episode title
        title = Text(self._title, font_size=26)
        if self._subtitle is not None:
            # we have a sub-title, add it to a title group
            subtitle = Text(self._subtitle, slant=ITALIC, font_size=20)
            subtitle.align_to(title, LEFT).shift(0.4 * DOWN)
            title = VGroup(title, subtitle)

        self.play(FadeIn(logo))
        self.play(Create(seriesGroup))
        self.wait(2)

        self.play(logo.animate.scale(0.5).shift(3 * LEFT + 3 * UP),
                  seriesGroup.animate.scale(0.5).shift(5 * LEFT + 3 * UP))

        self.play(Create(title))
        self.wait(2)

        self.play(FadeOut(logo), FadeOut(seriesGroup), FadeOut(title))
        self.wait(3)
