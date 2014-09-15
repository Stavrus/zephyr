Zephyr
======
[![Build Status](https://travis-ci.org/Stavrus/zephyr.svg)](https://travis-ci.org/Stavrus/zephyr)
[![Code Climate](https://codeclimate.com/github/Stavrus/zephyr/badges/gpa.svg)](https://codeclimate.com/github/Stavrus/zephyr)
[![Test Coverage](https://codeclimate.com/github/Stavrus/zephyr/badges/coverage.svg)](https://codeclimate.com/github/Stavrus/zephyr)

This repository is being used to test tools and services (CI, deploys, etc). Feel free to ignore.

### Setup
Necessary software:

* Vagrant 1.5+
* Vagrant provider (e.g. VirtualBox)
* Saltstack 0.17+

Steps:

1. Setup the VM. `vagrant up`

2. Log into the VM. `vagrant ssh`

3. Navigate to the shared VM folder. `cd /vagrant`

4. Copy and edit the provided .env file `cp .env.example .env`

5. Start the server processes. `foreman start`

### Additional Information

rsync has been enabled in the VM. Use `vagrant rsync-auto` to edit files outside the VM.

The web server is accessible at `localhost:3000` on the host machine.