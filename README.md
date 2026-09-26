# Notes 8 Examples

The two worked examples from *Notes 8 — Functional Testing Strategies and
Frameworks*, set up as a Ruby project with RSpec.

- `lib/book.rb` and `spec/book_spec.rb` — Example: Testing a Book Class
- `lib/thermostat.rb` and `spec/thermostat_spec.rb` — Example: Testing a Thermostat Class
- `lib/loan.rb` and `spec/loan_spec.rb` — the in-class demo, unfinished (see below)

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

## In-class demo: `Loan`

`lib/loan.rb` describes what a loan is supposed to do in the comment at the top of
the class. `spec/loan_spec.rb` is started but not finished: one example is written,
the rest are listed without a body, and `#fee` has no examples yet. RSpec reports an
example with no body as *pending*, not as a failure.

The finished spec is on the `demo-finished` branch:

```shell
git switch demo-finished
```
