# Cauchy differentiation
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

import numpy
from manim import *


class Cauchy(Scene):

    F = YELLOW           # function explanation colour
    Integral = RED       # integral explanation colour

    def construct(self):
        # master equation
        eqn = MathTex("f^{(n)}(z)", "=", "\\frac{n!}{2 \\pi i}", "\\oint_C", "\\frac{f(w)}{(w - z)^{n + 1}}", " \\, dw")
        eqn.shift(3 * UP)

        # stack of derivatives explanation
        df1 = MathTex("f'(x) = \\frac{df}{dx}").set_color(self.F)
        df2 = MathTex("f''(x) = \\frac{d^2f}{dx^2}").set_color(self.F)
        df3 = MathTex("\\vdots").set_color(self.F)
        dfn = MathTex("f^{(n)}(x) = \\frac{d^nf}{dx^n}").set_color(self.F)
        df1.next_to(eqn[0], DOWN)
        df2.next_to(df1, DOWN)
        df3.next_to(df2, DOWN)
        dfn.next_to(df3, DOWN)
        df = VGroup(df1, df2, df3, dfn)

        # path integral explanation

        # highlighting frames
        frameF = SurroundingRectangle(eqn[0]).set_color(self.F)
        frameIntegral = SurroundingRectangle(eqn[3]).set_color(self.Integral)

        self.play(Write(eqn))
        self.wait(1)
        self.play(Create(frameF))
        self.wait(1)
        self.play(Write(df1))
        self.wait(1)
        self.play(Write(df2))
        self.wait(1)
        self.play(Write(df3), Write(dfn))
        self.wait(2)
        self.play(FadeOut(df))
        self.wait(1)
        self.play(ReplacementTransform(frameF, frameIntegral))
