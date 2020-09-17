# Preface

There are lots of books about network science, ranging from the
popular-science works of Barabási {cite}`Bar03` to the detailed works
of Newman {cite}`New10` and (again) Barabási {cite}`Bar16`. Typically
these are heavy on the mathematical aspects, and are illustrated by
pretty pictures of complex networks of various types. What is left
unexplored (perhaps because it's of less interest to the authors,
perhaps because it's expected to be of less interest to the readers)
is the code needed to replicate the experiments and generate the
graphs and datasets that result.

As a computer scientist, I find this unsatisfactory in two distinct
ways.

At a technical level, the generation and processing of complex
networks is anything but uninteresting to me: it's a fascinating
application of computing techniques based on complex mathematical
ideas. The better we understand these processes, and the easier we
make them to express with computers, the easier it will be for other
scientists to take these ideas and apply them to make new discoveries
about the world.

Any new technology -- microscope, telescope, cloud chamber, particle
accelerator, computer -- is about more than just a new piece of
instrumentation. Each new tool doesn't just help with science: it
changes it, and indeed the scientists who perform it. Each new tools
requires new techniques, often developed by a new generation of
scientists who can see the potential in a new way of thinking that's
suggested or facilitated by the new kit. In this sense, I tend to
think that *the computer is the new microscope*: computers change the
way we do science, but also change the science that we do. If we can
make computational techniques more accessible, we can deepen and
accelerate these processes while discovering new things about computer
science and information.

At an academic level, most of my work takes place in conjunction with
students. It's in the nature of modern science that most students
(actually, most researchers of whatever seniority) have quite
specialised backgrounds. One often encounters amazingly talented
programmers; one often encounters individuals with profound
mathematical understanding; but few combine a deep background in the
appropriate sub-domains of both that they need to be able to take up
network science research. Anyone coming to complex networks therefore
has a problem: it's likely they'll have only part of the background
they'll need, and the other part will be written in a language they
don't understand -- whether that's the language of statistical graph
theory or the language of high-performance computing. That makes for a
steep learning curve.

I can identify personally with this. As a computer scientist, I have
much more maths than average in my background -- but significantly
less of the *right* maths than I need to do the work I currently want
to do. Conversely, my ability to apply computer science to this work
is hampered by unfamiliarity with some of the mathematical concepts
needed to get fully to grips with it. This book arises out of my
journey to fill in the gaps in my mathematical knowledge, and to
deploy the things I *do* know quite a lot about -- programming,
distributed, and high-performance computing -- in order to explore
complex real-world networks. Hopefully it's a journey that will be of
interest to others in a similar position.

When writing about a complex topic it's often hard to find a structure
that works. Tjis seems to be especially true for complex
networks. It's hard to separate the mathematics from the computing:
dealing with one before the other is artificial, but combining them
together can make it harder to get to find what you're looking. I've
addressed this by grouping chapters thematically; by targeting them at
specific problem areas; and by trying to make them self-contained both
mathematically and computationally. Hopefully this will work for you.

Writing about a diverse area also makes it tricky to decide which of
the many topics to include. *Complex networks, complex processes* in
simply reflects my evolving understanding and interests, making no
claim to completeness. I apologise if I've missed out anything you
find to be interesting or important later on.
