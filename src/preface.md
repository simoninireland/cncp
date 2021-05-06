Preface
========

There are plenty of excellent books on network science, from the
deeply technical
{cite}`NewmanNetworksIntroduction,StructureDynamicsNetworks` to the
more accessible {cite}`LinkedBook,BurstsBook`: I've even written one
myself on applications of networks to epidemic modelling
{cite}`em-book`. So why write another?

This book arose from my dissatisfaction with much of the literature on
network science, which arises generally from the fields of mathematics
and statistical physics. Both fields have a written culture that's
terse and to the point, focusing on presenting new results in a
concise and general form. They are generally light on descriptions of
the methods used, and often don't provide much in the way of
background. The normal citation format in the physics literature often
doesn't even include the titles of the papers being referenced, rather
just including authors, journal, and date. Taken together these
features present a formidable learning curve for anyone not deeply
familiar with the concerns and approaches of the field: and how does
one acquire such familiarity in the first place?

As a computer scientist I'm also interested in the methods and
calculations that go into demonstrating and validating the results
presented. Actually, I'm *fascinated* by how one conducts numerical
simulations, and how we make software that's easy for practitioners to
use. These are not common concerns within the network science
community, where there is a distinct lack of common, reusable tooling
and very few signs of modern software engineering practices like
continuous integration, unit testing, automation, and the like -- all
of which are considered essential good practice by computer
scientists. Tooling of this kind itself has a learning curve, and just
as many lack the necessary maths background (but understand
computing), others will not be able to develop or evolve a complex
codebase (but will have the maths to describe how it should
work). This book is intended for both these kinds of scientists.

In writing this book I'm therefore concentrating far more than is
usual on the *mechanics* of network science: not only how do the
systems work and evolve mathematically, but how we explore them
computationally. The rubric is very simple: all the maths has code to
back it up, and all the code has its mathematical underpinnings
explained. In this way I hope to help people to climb the twin
learning curves more quickly and be able to make their own
contributions to network science and its applications.

This book is a work-in-progress, growing slowly as I add explanations
to the work I'm doing. It may grow non-linearly -- very appropriately
-- as I flesh-out the background to material already present.
