# any_history
drawing timeline service

## Setup
bundle install
yarn
bin/rake db:migrate

## Usage

### Required environment variables
```
# google client_id for oauth
GOOGLE_APP_ID
# google secret key for oauth
GOOGLE_APP_SECRET
# login allow domain. ex) gmail.com,example.com
LOGIN_ALLOW_DOMAIN_CSV
# oauth callback url base ex) http://localhost:3000
OAUTH_CALLBACK_URL_BASE
```

## Deploy to heroku

```
# heroku first setup
heroku login
heroku create [any application name]
heroku git:remote -a [specific application name]
heroku buildpacks:add --index 1 heroku/nodejs # for yarn

# 下記コマンドで、heroku/nodejsとheroku/rubyがこの順で表示されればOK
heroku buildpacks

# rubyがない場合は、以下のコマンドで追加する
# heroku buildpacks:add --index 2 heroku/ruby
heroku addons:add heroku-postgresql

heroku config:set 環境変数名=セットしたい値
heroku config:set GOOGLE_APP_ID=aaaa
heroku config:set GOOGLE_APP_SECRET=bbbb
heroku config:set LOGIN_ALLOW_DOMAIN_CSV=eeee
heroku config:add TZ=Asia/Tokyo
heroku config:set OAUTH_CALLBACK_URL_BASE=https://xxxxxxxxxxxx
heroku config:set ADMIN_EMAIL=foo@bar.com
heroku config:set BUCKETEER_AWS_ACCESS_KEY_ID=xxx
heroku config:set BUCKETEER_AWS_SECRET_ACCESS_KEY=xxx
heroku config:set BUCKETEER_AWS_REGION=xxx
heroku config:set BUCKETEER_BUCKET_NAME=xxx
```

```
# login heroku user for deploy
heroku login
git push heroku master
heroku run rails db:migrate # if you change migration
```
