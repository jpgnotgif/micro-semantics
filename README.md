# Semantics3 API code simulation

<img src="https://github.com/jpgnotgif/micro-semantics/blob/master/micro-semantics-demo.gif" width="600" height="300">

## Requirements
1. Ruby version = 2.4
2. Rails version = 5.0.2

## How to start the application
1. Run bundler
```
bundle install
```

2. Create necessary databases
```
bundle exec rake db:create:all
```

3. Run migrations
```
bundle exec rake db:migrate
```

4. Create .env file for storing Semantics3 API keys
```
echo "API_KEY=<YOUR_API_KEY_HERE>\nAPI_SECRET=<YOUR_API_SECRET_HERE>" >> .env
```

5. Run the server
```
bundle exec rails s
```
