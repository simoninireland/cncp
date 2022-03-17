# Path integrals scene
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


class PathIntegral(ThreeDScene):

    Integral = GREEN      # colout of regular integral
    PathIntegral = RED    # colour of path integral

    def func(self, u, v):
        return numpy.sin(numpy.sqrt(u**2 + v**2))

    def rectangleIntegral(self, t, z):
        x_base, y_base = -0.75, 0.25
        l_long, l_short = 2, 1

        if t < 2:
            x, y = x_base + (t / 2) * l_long, y_base
        elif t < 3 :
            x, y = x_base + l_long, y_base + (t - 2) * l_short
        elif t < 5:
            x, y = x_base + l_long - ((t - 3) / 2) * l_long, y_base + l_short
        else:
            x, y = x_base, y_base + l_short - (t - 5) * l_short
        return (x, y, z(x, y))

    def pathIntegral(self, t, z):
        x_base, y_base = -0.75, 0.25
        l_long, l_short = 2, 1

        x, y = x_base + numpy.sin(TAU * t) * l_long, y_base + numpy.cos(TAU * t) * l_short
        return (x, y, z(x, y))

    def construct(self):
        # the axes
        axes = ThreeDAxes(x_range=[-TAU, TAU], x_length=6)

        # the plot
        surface = Surface(lambda u, v: axes.c2p(u, v, self.func(u, v)),
                          u_range=[-TAU, TAU],
                          v_range=[-TAU, TAU])
        surface.set_style(fill_opacity=0.3)

        # regular integral
        integral = ParametricFunction(lambda t: self.rectangleIntegral(t, lambda x, y: 0),
                                      t_range=[0, 6],
                                      color=self.Integral)
        integralHeight = ParametricFunction(lambda t: self.rectangleIntegral(t, self.func),
                                      t_range=[0, 6],
                                      color=self.Integral)
        integralHeight.set_fill(self.Integral, opacity=0.5)

        # path integral
        path = ParametricFunction(lambda t: self.pathIntegral(t, lambda x, y: 0),
                                  t_range = [0.0, 1.0],
                                  color=self.PathIntegral)
        pathHeight = ParametricFunction(lambda t: self.pathIntegral(t, self.func),
                                        t_range=[0.0, 1.0],
                                        color=self.PathIntegral)

        self.set_camera_orientation(theta=45 * DEGREES, phi=50 * DEGREES)
        self.play(Create(axes))
        self.play(Create(surface))
        self.wait(2)
        self.play(Create(integral, run_time=2))
        self.wait(2)
        self.play(Create(integralHeight, run_time=2))
        self.wait(2)
        self.play(FadeOut(integral, integralHeight))
        self.play(Create(path, run_time=2))
        self.wait(2)
        self.play(Create(pathHeight, run_time=2))
        self.wait(2)
        self.play(FadeOut(path, pathHeight))
        self.wait(2)
