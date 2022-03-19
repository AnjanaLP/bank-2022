# Bank Tech Test

A challenge to implement the specification given below in order to test OO design
and TDD skills.

Unit tests include test doubles and method stubs to effectively isolate the single class
being tested and feature tests check correct integration behaviour between the
classes. Test coverage is 100%.

The Single Responsibility Principle has been adhered to in all classes and methods. The Account class is responsible for recording the transaction history - I have made sure not to expose the internal array to external modification by returning a copy of the object instead of the actual object itself. The Transaction class is responsible for all the information relating to a single transaction - I have used a method call to set the transaction's credit or debit state instead of it being passed as a parameter in order to limit the number of parameters passed to transaction and allow better encapsulation of the debt/credit state. The Printer class is responsible for formatting an account's transaction history into the specified output style. Dependencies have been injected with defaults provided where appropriate.

## Specification

### Requirements
You should be able to interact with your code via a REPL like IRB or Node.
(You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria
**Given** a client makes a deposit of 1000 on 10-01-2023<br>
**And** a deposit of 2000 on 13-01-2023<br>
**And** a withdrawal of 500 on 14-01-2023<br>
**When** she prints her bank statement<br>
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## How to setup

Clone the repo to your local machine, change into the directory and install the needed gems:
```
$ bundle install
```

To run the test suite:
```
$ rspec
```

## Technologies used
- Ruby
- RSpec
- SimpleCov

## Code example
```
$ irb
3.1.0 :001 > require './lib/account'
 => true

3.1.0 :002 > require './lib/printer'
 => true

3.1.0 :003 > account = Account.new
 => #<Account:0x0000000104c908d8 @transaction_class=Transaction, @transact...

3.1.0 :004 > account.deposit(1000)
 => :credit

3.1.0 :005 > account.deposit(2000)
 => :credit

3.1.0 :006 > account.withdraw(500)
 => :debit

3.1.0 :007 > printer = Printer.new(account)
 => #<Printer:0x00000001086bcc50...  

3.1.0 :008 > puts printer.print_statement
date || credit || debit || balance
19/03/2022 || || 500.00 || 2500.00                             
19/03/2022 || 2000.00 || || 3000.00                            
19/03/2022 || 1000.00 || || 1000.00                            
 => nil            
```
