It is hard to calculate ip ranges because it invovles decimal-binary conversion and bit subtraction.

This was a TDD exercise to produce some functions that take ip/cidr inputs and return the number of host addresses available.

It is intended to be of use when setting up VPCs.

To carry out tests: $ rspec

To repeat rspec every 2s: $ ./rspec.sh 

To interact with code, clone the repo locally, navigate to root directory: $ irb -r ./ip.rb, then carry out commands like # explain_ip("200.100.10.128/25").

See spec/ip_spec.rb for tests and sample commands
