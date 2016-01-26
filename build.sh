#!/bin/bash

docker build -t=aveltens/tt-rss:updater updater
docker build -t=aveltens/tt-rss:apache apache