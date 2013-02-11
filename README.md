dfa_client
==========

A savon-based Client for Googles DoubleClick for Advertisers (DFA) API

https://developers.google.com/doubleclick-advertisers/docs/overview

Installation
------------

DFAClient is available through [Rubygems](http://rubygems.org/gems/dfa_client) and can be installed via:

```
$ gem install dfa_client
```


Introduction
------------

``` ruby
require "dfa_client"

# create a client for your DFA API, optionally specify an API version
dfa = DFAClient.new('v1.19')

# authenticate with DFA
dfa.authenticate(username, password)

# Make a request to DFA, in this case run a report
response = dfa.request('report', :run_deferred_report, {"ReportRequest" => {"queryId" => YOUR_QUERY_ID}})

# response now contains a hash of the API result. optionally, you can specify raw=true to get the the full savon response when you make the call:
response = dfa.request('report', :run_deferred_report, {"ReportRequest" => {"queryId" => YOUR_QUERY_ID}}, true)

```
