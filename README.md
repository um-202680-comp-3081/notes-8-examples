# Notes 8 Examples

The two worked examples from *Notes 8 — Functional Testing Strategies and
Frameworks*, set up as a Ruby project with RSpec.

- `lib/book.rb` and `spec/book_spec.rb` — Example: Testing a Book Class
- `lib/thermostat.rb` and `spec/thermostat_spec.rb` — Example: Testing a Thermostat Class

## Running the examples

```shell
bundle install
bundle exec rspec --format documentation
```

To run one file, or the example on one line:

```shell
bundle exec rspec spec/thermostat_spec.rb
bundle exec rspec spec/thermostat_spec.rb:30
```

## Things to try

- Run `bundle exec rspec --order random` a few times. Every example should pass in
  every order.
- Break the code on purpose, run the specs, and see which examples fail. For example,
  in `lib/thermostat.rb`, replace `degrees.between?(MIN, MAX)` with
  `degrees > MIN && degrees < MAX`. Then put it back with `git restore lib/`.
