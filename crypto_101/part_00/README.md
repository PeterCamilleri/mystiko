# Welcome to Cyrpto 101

This series of lessons is a basic level primer on encryption. The target
audience is programmers curious about how encryption works but not in love
with pages of confusing mathematical scribblings. It is not really solid
enough to use as a basis for those wishing to delve deeply into the field
but may still serve as a starting point for such a path.

Our examination of encryption will look at a number of topics.

- The theory behind how encryption works.
- An examination of actual encryption systems that are deployed in the field.
- A look at some examples of epic failures through the years.
- We will build up a number of simple example encryption system in the ruby
language. The sample code is written to be portable but is tested under
version 2.1.6

Keep in my that this primer will keep things on a basic level. As a result
we will avoid digging into the leading edge of security apparatus. The NSA
most certainly has nothing to fear here.

Finally, it is a goal to keep the tone light and informal.

## Ruby

Let me start by saying that there are a great many excellent programming
languages that could have been used as the basis for this primer. The
language called Ruby has been selected. Why? What desirable attributes
make Ruby the choice here?

- Fun - A primary goal in the design of Ruby is to maximize programmer's joy!
For example, Ruby has very little in the way of ceremonial syntax. You never
have to add lines whose only purpose is to get the compiler out of your hair.
- Fast - No long compile/link phases churning away, wasting your time. True,
Ruby *is* slow in execution compared with language X, but in this context that
kind of slow is not an issue. We are more focused on saving learning and
development time and not CPU clock cycles.
- Cross platform - Working well under Windows, Mac, and Linux.
- Support - Ruby has a thriving and dynamic support community. This takes the
form of vast knowledge bases of questions and answers, a vast library of
software components (gems), and countless books, blogs, videos, and online
references.
- Interactive - It is trivial to execute code from the command line to explore,
learn and debug. Ruby comes with an interactive facility called irb. It is even
easy to create custom interactive facilities.
- Low cost - Ruby is free to download and install.
- Open Source - This is especially important where security is involved.
Code built with closed source tools is always suspect.

Now, I know for a fact that the selection of Ruby immediately raises an issue
in the minds of many. To them, Ruby is synonymous with Rails. The truth is that
nothing could be further from the truth. Let's compare and contrast the two:

- Ruby: a powerful, easy-to-learn, easy-to-use programming language that
supports quick turn-around, modular, component based and object oriented
development,  meta-programming, introspection, and interactive exploration.
It is used to create programs of many sorts, limited only by the
programmer's imagination.

- Rails: a server-side web framework, written in Ruby. It is huge and
intricate and has many strong opinions as to how things need to be done.
It is used to create web pages and web APIs. To emphasize this point, it
is *not* a general purpose programming environment.

None of this should be seen as a put-down of Rails. If a web page is the goal
then it is most likely the best tool for the job. If a study in encryption
techniques is the goal, Ruby without Rails is a far better choice.

## Synopsis

- Part 0 This introduction
- Part 1 Security basics
- Part 2 Basic encryption concepts.
- Part 3 WIP



