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

What does Wikipedia say about encryption?

_In cryptography, encryption is the process of encoding messages or information
in such a way that only authorized parties can read it. Encryption does not of
itself prevent interception, but denies the message content to the interceptor._
(https://en.wikipedia.org/wiki/Encryption)

Let's see a simple, but very common example scenario:

    You wish to make an online purchase with a credit card.
    You have your credit card information.
    The vendor needs that information to process your purchase.
    Criminals must not gain access to that information.

So, keeping an open mind, let's see how this can be done.

#### Use a private communication channel.

The oldest way to keep unauthorized access to information is to only allow
access by authorized users. Secret couriers would carry messages of great
importance. Automated Teller Machines connect to the bank using special leased
line connections that only connect the machine to the bank and nothing else.
In modern times, it was not uncommon for a battle field to be criss crossed
with telegraph and telephone lines. Even homing pigeons have flown to their
roosts with messages attached to their tiny legs.

So what can go wrong? Lots! The secret courier can be bribed or intercepted.
The message can be stolen or switched out with a false message. The wires can
be cut or tapped. Even the poor little pigeons can be blasted out of the sky or
hunted down by enemy (angry?) birds of prey.

In our scenario, a private communication channel is not an option because your
connection to the vendor is over the public Internet and not a private network.

#### Use an obscure communication channel.

Sometimes, designers attempt to secure communications by using an obscure or
undocumented communication method. There's a special name for that kind of
engineering. It's called "bad".

I have no example to show this in action for our sample scenario, because no
one would be foolish enough to try it. Or would they... It seems that there is
an excellent example from history:

_**Epic Failure #1 - The long distance phone network.**_

In a long distance telephone network, phone calls are routed between telephone
company (telco) exchanges. The telco had to send this routing information in
a cost effective and secure manner. The solution arrived at was to use tones
as proxies for the commands and numeric data and send these down the phone line
while it was idle.

To obscure things, the details of the exact pitches and command sequences were
not documented. It was a disaster in the making. First off, details of the
scheme were published followed by an attempt to suppress the information.
This involved literally going to college libraries and ripping out the
offending pages from books. Secondly, anyone could stumble across the tones,
and several did. The most famous being that of a toy whistle given away with a
breakfast cereal that could generate the sound needed to put the distant
exchange into a mode where it would accept commands.

This lead to the rise of the "phone phreak" culture and the infamous blue box
phone hacking device. The security of the long distance phone system was
compromised and the telcos all lost out on some champagne, caviar and lobster.

They did make changes though. Starting with heavy handed legal attacks, the
issue was not resolved until they switched to "out of band signaling". A fancy
way of saying that they began putting their sensitive data onto a private
communications channel. Where it should have been all along.

A look at the interesting blue box is at: ( https://en.wikipedia.org/wiki/Blue_box )

#### Protect the data with Encryption.

So it should be clear by now that data that is encrypted is much more than data
that is merely obscured. So what is required for data to be encrypted?

1) Even given the details of the method of encryption, decoding the message
should be unfeasible for unauthorized parties. For example, the source code
of the encryption program can be publicly published without giving up the
coded messages' contents. If the source code is hidden or proprietary, then to
at least some extent, the designer is relying on obscurity.

1b) The algorithm or program source code should be openly published. This is
a corollary of the first point. Code that is obscure is weak. Open code is
subject to criticism and fault analysis by many talented programmers.
Proprietary code is not and is thus suspect. Quality encryption must _not_ rely
on obscurity.

2) The process of creating the encoded message shall accept two inputs: the
message to be encoded and a encoding key.

3) The process of decoding the encoded message shall also accepts two inputs:
the encoded message and a decoding key.

4) Depending on the method of encryption employed, the encoding and decoding
keys may be the same (symmetrical key encryption) or different (asymmetrical
key encryption).

5) The key used to decode the messages shall be kept secret. The encoding key
may be public unless it is the same as the decoding key. In that case it too
must be kept secret.

## Conclusion

This concludes the first part. Subsequent parts will examine how actual
encryption systems work. All share the five characteristics listed above.

## Homework/Quiz

There is no homework assigned. There will be no quiz on Monday.
