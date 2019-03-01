# Alphaid Bot Ping Command

> Simple ping command for the Alphaid Bot.

## How to install

Ensure you are using Alphaid Bot version that does have Module Loader support for loading modules from the `node_modules` directory, then run the following in the Alphaid's Bot module directory:

```bash
npm i alphaid-bot-ping
```

No configuration required, just go ahead and build the docker image and run the bot.

## How to use

After bot finishes loading, a command `!ping` will be created.

Use the above command and the bot will reply with message, record a time that passed while message has been delivering, and then will edit this message, diplaying a ping.

## QA

### Why CoffeeScript? I thought it's dead!

Why should it be? It is actually pretty simple and nice alternative to JavaScript, when you only need to write a few lines script like this one. For big projects, of course, TypeScript or Flow will suit better.

In this project, actually, I just wanted to show how Alphaid Bot can handle modules even originally written in other languages, but following the simple rules, resulting a good JavaScript.

### What is Alphaid Bot?

Really huge bot (or “engine”) for Discord with really stange architecture and definition of “module.” See [Links](#links).

### Aren't Alphaid Bot modules — git submodules?

This only is half right. Yeah, the Git Submodules that clone to `cogs` directory are counted as the modules, but you can manually install modules the same way without using a Git.

But now I'm going to test and implement loading of npm packages that have required prefix in their name, thus to simplify loading of external dependencies, installing a new modules.

## Requirements

- Messages Flows and PrefixAll modules must be installed
- Alphaid Bot version must support loading npm modules

## Links

- [Alphaid Bot](https://github.com/alphaid-bot/alphaid-bot)
