# Mystik&oacute;

The word mystik&oacute; is from the Greek language and means secret. Keeping
secrets safe from unauthorized eyes is the very core purpose of encryption.

The mystik&oacute; gem is a modified Vernam cypher. The classic approach to
this type of cypher is to have a random string of data of the same length as
the plain text data. The two streams of data are combined using the XOR
operation. To recover the original data, the cypher data is again combined with
the random data with the XOR operation. After one use, the random data is
never reused.

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

#### References

- https://en.wikipedia.org/wiki/One-time_pad

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mystiko'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mystiko

The mystiko gem itself will soon be found at: ( https://rubygems.org/gems/mystiko )

## Usage

TODO: Write usage instructions here

## Contributing

Creating a good introduction to encryption is quite an undertaking. For
this reason, any input is most welcomed. There are two basic plans by which
this can be accomplished.

#### Plan A

1. Fork it ( https://github.com/PeterCamilleri/mystiko/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

#### Plan B

Go to the GitHub repository and raise an issue calling attention to some
aspect that could use some TLC or a suggestion or an idea.
