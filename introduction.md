# Introduction

This is a book about complex networks and the processes that run over
them.

Complex networks are one of the most exciting developments to have
happened in mathematical and computational modelling in recent
years. Network science provides us with tools for understanding a huge
range of real-world phenomena – phenomena that are often resistant to
other forms of analysis, but that can be studied, varied, experimented
with, and explored using a combination of mathematical analysis and
computer simulation.

We find complex networks everywhere. To pick some areas largely at
random, we find them in **biology** for the study of protein
interaction networks to trace biochemical pathways; in **physics**,
when exploring phase transitions in glasses and other materials; in
**medicine**, where epidemiology increasingly uses complex networks to
model real-world disease outbreaks; in **urban planning** to design
city-wide transport infrastructures resistent to load and attacks; and
in **digital humanities** to model the spread of information in social
media. It probably goes without saying that they are also of intense
interest for **mathematics** and for **computer science**, both in
their own right and as vehicles to deploy advanced mathematical and
computational techniques into other disciplines. It's fair to say that
almost no scientific field (and indeed decreasingly few in the
humanities) are unaffected by network science.


(sec:introduction-history)=
## A brief yet helpful history of network science

Like all scientific fields, network science is a product of a
particular history. It didn't spring fully-formed into how we
encounter it today, but rather evolved through a process of
application, accident, and insight. Application because networks arose
as a way of solving particular problems that were troubling people;
accident because these problems, the order in which they were
encountered, and the tools with which they were addressed were at
least somewhat accidental and dependent on the individuals concerned;
and insight because the major advances came about through unexpected
intuitive leaps of imagination that went beyond simply solving a
problem at hand. When people say that science proceeds steadily and
logically, it's as well to remember that all scientific theories have
histories that guided (and in many cases impeded) their development.

### Leonhard Euler and the Königsberg Bridges

In the early 18th century the citizens of Königsberg (now Kaliningrad)
had a problem. In the middle of their city, the River Pregel divided
to form an island. The river was spanned by seven bridges connecting
the island to the mainland parts of the city. The island and the river
were popular venues for people to stroll, meet, and take the air – and
to discuss whether it was possible to take a walk that crossed each
bridge exactly once. In the manner of these things, the discussion
grew into someting of a frenzy of speculation, with opinion dividing
over whether it was impossible, or whether it was just that no-one had
actually had the ingenuity to find a solution yet. Leonhard Euler, one
of the best-known mathematicians of his (or indeed any other) time,
visited Königsberg in 1735 and became aware of the problem. He solved
it, in the process inventing what became known as graph theory.

![The Königsberg bridges in Euler's time](konigsberg-bridges.png) <br>
(source: [Wikipedia](https://en.wikipedia.org/wiki/File:Konigsberg_bridges.png)).

Euler made two key observations. The first was that the actual
geography of the problem was irrelevant: all that mattered was the
topology of the problem, what was "next to" what, the ways in which
the bridges linked the banks, since the essence of the problem was to
find ways of connecting the ends of the bridges so that one could walk
over all of them. Another way to look at this is that, after crossing
one bridge, a walker is constrained in which bridges he can walk over
next: those with an end on the bank or island on which he is now
standing, and which he hasn't walked over already. In modern
terminology represented each land mass as a node and each bridge as an
edge connecting two nodes. It doesn't matter how big the land masses
are, since a person may walk freely between any pair of bridges on the
same land mass. The geographic problem has been converted into a
problem of networks that can be studied in the abstract.

Euler's second observation was that, since people could move freely
between all the bridges attached to a given land mass, the key to the
problem was how many times a person's path intersected with each land
mass. He reasoned that, since every bridge can be traversed only once,
the only way to avoid being trapped is if each land mass has an even
number of connections – so that if a person can enter, they can always
leave. He realised that there are at most two exceptions to this rule,
for the starting and finishing land masses, where it's possible simply
to leave (or arrive) and therefore not need another link. Phrased in
terms of the network, this converts the problem again from one of
topology to one of node degree: it is possible to cross all bridges
exactly once if the graph has zero or two nodes of odd degree, with
all other being of even degree: otherwise one will get "stuck" in a
node, unable to cross all the bridges.

Looking at the map above, all the nodes – the left bank, right bank,
island, and section of town on the right – all have odd degree, from
which Euler concluded that there is no way for someone to traverse all
the bridges without re-tracing their steps.


### The mathematical analysis of networks

Euler's success led directly to modern network science, not simply
because it allowed problems to be phrased in different ways, but
because it suggested a methodology for solving problems: abstract them
away from their details into the language of networks, and then use
general mathematical tools to manipulate them. Once we have this
abstract language, there are a number of properties of networks in
general that may be of interest:

1. What is the shortest path between two nodes? Or between any two
   nodes?
2. Is it possible to trace a path from one node to another node in the
   graph? Or from a node to every node? How about from every node to
   every other node?
3. Are there edges that, if we remove them, cause a node to become
   unreachable from another node?
4. Of all the edges that could be present in the graph, how many
   actually are present?

The first property is one of finding shortest paths; the second
concerns whether the nodes are reachable and whether the network is
connected; the third concerns the robustness of the network; the
fourth the density of the network. The important point is that all
these properties are topological or graph-theoretic: we don't need to
know what the network represents in order to calculate them.

Conversely, all the properties say something about the phenomenon the
network is modelling. In the case of the Königsberg bridges, for
example, connectedness refers to whether, starting from any land mass,
it is possible to reach any other land mass, while robustness concerns
whether removing a bridge would be disasterous for travel. Any
property we define at the network level may illuminate something at
the problem level, and may even suggest things that we wouldn't have
thought of simply by thinking about the problem alone. Or may not:
it's not clear that density is especially relevant to bridge-building,
since the problem is constrained by all sorts of physical factors that
we've elided in moving to a network representation.

That highlights an important point about modelling. A model is an
abstraction of a real problem, an abstraction necessarily leaves
things out, and it's only by understanding the original problem and
its real-world context that you can decide whether a particular thing
left out is important or not: the network science won't tell you in
and of itself.


### Random networks

Network science developed over the next couple of centuries, but
largely as a branch of pure rather than applied mathematics. While the
tools could be used to study small networks – networks small enough to
be described in full, with all their nodes, edges, and other details
written down – many real-world networks of interest simply aren't like
this. Real-world networks are often big – very big – and are often not
completely known. Without all the detaill classical graph theory is
rather restricted in what it can do.

Things changed in the early 1960's with the arrival into graph theory
of Paul Erdős (pronounced AIR-dish), one of the greatest and most
prolific mathematicians of the 20th century. Erdős realised that if
networks were built using some random process, and were of a
sufficient size, then it would be possible to make general statements
about the properties of the graphs even if one did not have the
complete details – in exactly the same way that statistical physics
can make statements about macroscopic masses of solids and gases
without needing (or being able) to know the exact positions and
momenta of every component molecule. Erdős teamed up with another
talented Hungarian mathematician, Alfred Rényi, to study the
mathematics of these random networks, and produced a series of papers
{cite}`ER59` that essentially answered all the fundamental questions
that they raise.

Random networks of the kind studied by Erdős and Rényi, now known as
ER networks in their honour, are a topic on their own. Despite (or
actually because of) their underlying randomness, they are extremely
well-behaved mathematically.


### Powerlaw networks

