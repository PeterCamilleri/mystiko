# Mystik&oacute;

The word mystik&oacute; is from the Greek language and means secret. Keeping
secrets safe from unauthorized eyes is the very core purpose of encryption.

This gem is only intended for educational purposes and should not be used in
serious data security applications.

Any use for unlawful purposes is strictly forbidden.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mystiko'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mystiko

The mystiko gem itself is found at: ( https://rubygems.org/gems/mystiko )

## Usage

Mystik&oacute; is both a ruby gem and a command line utility. In order to work
with the encryption engine two things must be done:

 - An instance must be created. This is easily done with the new method.
 - Encryption is done with the encrypt method and appropriate parameters.
 - Decryption is done with the decrypt method and appropriate parameters.

The parameters take the form of classical named/hashed parameters. Supported
parameters include:

 - in_str: "value" -- a string of input data.
 - in_file: "name" -- the name of a file of input data. Overrides in_str.
 - key: "value" -- the key to use for processing
 - generator: object -- a seeded, pseudo-random number generator. Overrides key.
 - out_str: "value" -- the string output is appended to this string.
 - out_file: "name" -- the name of a file of output data. Overrides out_str.
 - window: value -- the size, in bytes, of the shuffling window.

The methods encrypt and decrypt both also return the resultant string of data.

The command line utility displays the following message if started with no
arguments or the "--help", "-h", or "-?" options.

    Mystiko version 0.1.0

    Usage summary:

    $ mystiko <options>

    --help,    -h, -?            # Display this help message.
    --encrypt, -e                # Data is to be encrypted.
    --decrypt, -d                # Data is to be decrypted.
    --input,   -i <input data>   # Specify the input data string.
    --read,    -r <file name>    # Specify the input data file name.
    --write,   -w <file name>    # Specify the input data file name.
    --key,     -k <key data>     # Specify the key data string.

    Notes:
     - A command option and a key are always required.
     - Data input defaults to STDIN.
     - Data output defaults to STDOUT.
     - If -r is specified, -i is ignored.
     - String data may be optionally enclosed in " ... "

## Principles of Operation

#### The Vernam Cypher

The mystik&oacute; gem is a modified Vernam cypher. The Vernam cypher works
by taking a stream of input symbols and mapping them to output symbols. This
mapping obscures the original data. The classic approach to this type of cypher
is to have a random string of data of the same length as the plain text data.
The two streams of data are combined using the XOR operation. To recover the
original data, the cypher data is again combined with the random data with the
XOR operation. After one use, the random data is never reused.

This works because the XOR operator exhibits the following identity:

```ruby
(A ^ B ^ B) == A
```
This is the result of the fact that:

```ruby
(X ^ X) == 0
```
and

```ruby
(X ^ 0) == X
```

Excepting "end run" code cracking (getting the data before/after encryption or
getting a copy of the random data) or incompetence (poor quality or reusing the
random data) this code can be shown to be unbreakable.

It is also very cumbersome to use. It requires that both parties have access to
large amounts of high quality random data that can only be used once. It
requires that random data to be kept secret and that these random data remain
synchronized.

#### The Pseudo-Random Shortcut

Given that large quantities of random data are bothersome to deal with, it was
only natural that someone would start taking short-cuts. In this case, the
one-time use random data was replaced by a pseudo-random data generator (PRNG).
This transforms the Vernam cypher from unbreakable to laughably weak. Why?

 - Any PRNG used in this way, requires an initial seed value. This seed value
is effectively the key of the cypher. To crack the code, the attacker only
needs to compute the seed value.
 - Many messages start with a known sequence of bytes. A header if you will.
These known bytes make it possible know what values were generated during the
encryption process. This in turn allows the internal state of the PRNG to be
modeled, greatly reducing the number of seed values that must be tested.
 - Once a sequence of random values is known, it is often easy to determine
what values will follow. At this point, the code is broken.

The problem with the Vernam cypher is that it only maps input symbols to
output symbols. The order of the symbols is not changed. With one-use truly
random data, this is not a problem. Knowledge of a few random values tells
us nothing about the values to follow. With a PRNG, they tell us a very great
deal.

#### The Scrambled Vernam Cypher

To avoid the problems of the classical Vernam cypher, mystik&oacute; makes one
significant change: The Scrambled Vernam Cypher first performs a PRNG
controlled shuffle on the symbols followed by a mapping of input symbols to
output symbols.

To recover data, the Scrambled Vernam Cypher decryption routine performs an
anti-mapping of the symbols back to their original values followed by a
controlled anti-shuffle of the data back to its original order.

This data shuffling denies any would-be attacker knowledge of the order of the
input data. Thus even with standard message headers, the content of the
original message is (hopefully) no longer relevant.

It remains to be seen if this is indeed the case. Comments, ideas,
observations, and thoughts are welcomed. See below for contributing.

#### References

- One time pads and the Vernam cypher https://en.wikipedia.org/wiki/One-time_pad
- Random number generation https://en.wikipedia.org/wiki/Random_number_generation
- The Mersenne twister  https://en.wikipedia.org/wiki/Mersenne_Twister
- The Random library http://ruby-doc.org/core-2.2.0/Random.html
- Testing random number generators https://en.wikipedia.org/wiki/TestU01 and
http://www.iro.umontreal.ca/~simardr/testu01/tu01.html
- Random key generator http://randomkeygen.com/ The 256 bit WEP keys work especially well.

## Contributing

Creating any encryption system is quite an undertaking. For this reason,
any input is most welcomed. There are two basic plans by which this can
be accomplished.

#### Plan A

1. Fork it ( https://github.com/PeterCamilleri/mystiko/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

#### Plan B

Go to the GitHub repository and raise an issue calling attention to some
aspect that could use some TLC or a suggestion or an idea.
