# Questions API

Simple API to retrieve Questions and their answers

## Requirements

* [Ruby](https://www.ruby-lang.org) (2.4.1 used)
* [Rails](http://rubyonrails.org/) (5.1.4 used)
* [Postgresql](https://www.postgresql.org/)

## Install

```
bundle install
rails db:create
rails db:migration
rails db:seed
```

## Configuration

For skip the authentication in development use **environment variables**, therefore is necessary create them. For UNIX users just run `export DISABLE_AUTH=true`, for windows users, follow this [tutorial](https://kb.wisc.edu/cae/page.php?id=24500).

## Usage

### Authentication

This API is authenticated, so for make the requests, it's necessary a tenant's token. With this information, you can make a request this way:

- cURL
```
curl http://localhost:3000/questions -H 'Authorization: Token token="YOUR-API-TOKEN-HERE"'
```

- Parameter (less secure)
```
http://localhost:3000/questions.json?api_token=YOUR-API-TOKEN-HERE
```

### Search

To make a search, you just need to put a `q` parameter on your requests, like `?q=term1,term2,term3`.

## Copyright

Copyright © Jonas Elan 2017. All right reserved.
