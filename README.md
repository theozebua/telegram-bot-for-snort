# Telegram Bot For Snort (Intrusion Detection System)

This program is made using bash script to send an alert with telegram's API.


## Installation

Clone repository
```bash
  git clone https://github.com/theozebua/telegram-bot-for-snort.git
```

Snort Installation
```bash
  sudo apt-get install snort -y
```


## Telegram Bot

Create telegram's bot with BotFather and get the bot's token.
And then make a telegram group and make sure you and the bot is inside the group.
And then get your group chat id.
How to get your group chat id?
You can get the list of updates for your bot from telegram api :
```
  https://api.telegram.org/bot[BotToken]/getUpdates
```
Example
```
  https://api.telegram.org/botXXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY/getUpdates
```
Send a random message to your group and then reload the page.
Look at the chat object and you will find your group chat id
```
  {
    "ok": true,
    "result": [
      {
        "update_id": xxxxxxxxx,
        "message": {
          "message_id": xx,
          "from": {
            "id": xxxxxxxxxx,
            "is_bot": false,
            "first_name": "Test",
            "last_name": "Test",
            "username": "test",
            "language_code": "en"
          },
          "chat": {
            "id": -xxxxxxxxxxxxx,
            "title": "Test",
            "type": "supergroup"
          },
          "date": xxxxxxxxxx,
          "text": "Test"
        }
      }
    ]
  }
```


## Configuration

##### Edit snort configuration
```bash
  sudo gedit /etc/snort/snort.conf
```
Search for "ipvar HOME_NET".
Then change the "any" to your device IP Address.
Example : ipvar HOME_NET 192.168.1.1

##### Edit snort debian configuration
```bash
  sudo gedit /etc/snort/snort.debian.conf
```
Search for "DEBIAN_SNORT_HOME_NET".
And set your device IP Address.
Example : DEBIAN_SNORT_HOME_NET="192.168.1.1".

##### Edit alert-bot.sh file
```bash
  cd telegram-bot-for-snort/
  sudo gedit alert-bot.sh
```
Change the username and then fill the chat_id and token variable and save the file.

Before we run the program, we will validate the configuration.
```bash
  sudo snort -T -c /etc/snort/snort.conf -i ens33
```
-i : Your network interface (Maybe yours is gonna be different)

You can check your network interface by running this command
```bash
  ifconfig
```


## Usage

First terminal
```bash
  sudo snort -A console -c /etc/snort/snort.conf -l /var/log/snort/ -i ens33 -d > /home/[username]/logs.txt
```

Second terminal\
Go to telegram-bot-for-snort folder and run the program
```bash
  cd telegram-bot-for-snort
  ./alert-bot.sh
```

And then try to attack your device like ping or something else.
Example
```bash
  ping 192.168.1.1
```


## Screenshots

![Alert](https://github.com/theozebua/telegram-bot-for-snort/blob/main/alert.png)

![Alert Telegram](https://github.com/theozebua/telegram-bot-for-snort/blob/main/alert-telegram.png)

## License

[MIT](https://github.com/theozebua/telegram-bot-for-snort/blob/main/LICENSE.md)
