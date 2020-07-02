# Homebus Recorder Deploy

Deploys are done via Capistrano over ssh.

## Setup

```
cd deploy
bundle install
```

Create a target in `config/deploy` patterened after the existing targets.

## Deploy
```
bundle exec target deploy
```
