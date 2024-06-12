# WebMonitor Script

This repository contains a simple Bash script that monitors a website and reports its online status. It checks the website at regular intervals and notifies you if the website goes offline or comes back online.

## Prerequisites

Before running the script, make sure you have `curl` installed on your system. You can install it using the following command on most Unix-like operating systems:

```
sudo apt-get install curl
```

## Cloning the Repository

To clone the repository and use the script, run the following command in your terminal:

```
git clone https://github.com/jamacio/WebMonitor.git
```

## Usage

To use the script, navigate to the cloned repository directory and pass two parameters: the URL of the website you want to monitor and the string you expect to find on the webpage.

```
cd WebMonitor
bash WebMonitor.sh "<website_url>" "<string_to_check>"
```

### For example:

```
bash WebMonitor.sh "https://example.com" "Expected Content"
```

The script will then start monitoring the website, checking every 5 seconds for the specified string. If the string is not found, it assumes the site is offline and starts counting the time until the site comes back online.

## Output

The script outputs a progress bar and a message indicating the online status of the website. If the website is offline, it will also show the duration of the downtime.

```
=>
The site has been offline for 5 second(s).
==>
The site has been offline for 10 second(s).
===>
The site has been offline for 15 second(s).
====>
The site has been offline for 20 second(s).
=====>
The site has been offline for 25 second(s).
======>
The site has been offline for 30 second(s).
=======>
The site has been offline for 35 second(s).
========>
The site has been offline for 40 second(s).
=========>
The site has been offline for 45 second(s).
==========>
The site has been offline for 50 second(s).
===========>
The site has been offline for 55 second(s).
============>
The site has been offline for 1 minute(s), and 0 second(s).
=============>
The site has been offline for 1 minute(s), and 5 second(s).
==============>
The site has been offline for 1 minute(s), and 10 second(s).

```
