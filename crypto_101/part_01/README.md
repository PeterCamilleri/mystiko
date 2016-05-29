# Welcome to Cyrpto 101

This series of lessons is a basic level primer on encryption. The target
audience is programmers curious about how encryption works but not in love
with pages of confusing mathematical scribblings. It is not really solid
enough to use as a basis for those wishing to delve deeply into the field
but may still serve as a starting point for such a path.

The examination of encryption will look at a number of sources.

- The theory behind how encryption works.
- An examination of actual encryption systems that are deployed in the field.
- A look at some examples of epic failures through the years.
- We will build up a simple example encryption system in the ruby language.

Keep in my that this primer will keep things on a basic level. As a result
we will avoid digging into the leading edge of security apparatus. The NSA
most certainly has nothing to fear here.

Finally, it is a goal to keep the tone light and informal. Furthermore, since
I am not particularly learned, this will _not_ be a learned dissertation.

## Encryption Basics

There are many occasions that require moving and/or storing information in a
secure manner. Some of these include:

- Protecting personal information for customers or citizens.
- Protecting financial information during business transactions.
- Protecting the secrecy during military operations.
- Protecting intellectual property from industrial espionage.
- Protecting the operation of banking systems or power grids.
- Protecting... well you get it. There's a lot that needs protecting.

So, just what does protecting mean in this context? In each case above, there
is information. That information is plainly visible to the originator of the
information. It needs to be made plainly visible to the intended recipient of
that information. It needs to be kept out of the hands of those who are not
authorized to possess or use that information.

Let's see a simple, but very common example scenario:

    You wish to make an online purchase with a credit card.
    You have your credit card information.
    The vendor needs that information to process your purchase.
    Criminals must not gain access to that information.

So, keeping an open mind, let's see how this can be done.

#### Use a private communication channel.

The oldest way to keep unauthorized access to information is to only allow
access by authorized users. Secret couriers would carry messages of great
importance. In modern times, it was not uncommon for a battle field to be criss
crossed with telegraph and telephone lines. Automated Teller Machines connect
to the bank using special leased line connections that only connect the
machine to the bank and nothing else.

In our scenario, this is not an option because your connection to the vendor
is over the public Internet and not a private network.

#### Use an obscure communication channel.


#### Protect the data with Encryption.


## Epic Failure #1 - The long distance phone network.

( https://en.wikipedia.org/wiki/Blue_box )



