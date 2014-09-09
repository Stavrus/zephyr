rvm-deps:
  pkg.installed:
    - names:
      - bash
      - coreutils
      - gzip
      - bzip2
      - gawk
      - sed
      - curl
      - git-core
      - subversion

mri-deps:
  pkg.installed:
    - names:
      - build-essential
      - openssl
      - libreadline6
      - libreadline6-dev
      - curl
      - git-core
      - zlib1g
      - zlib1g-dev
      - libssl-dev
      - libyaml-dev
      - libsqlite3-0
      - libsqlite3-dev
      - sqlite3
      - libxml2-dev
      - libxslt1-dev
      - autoconf
      - libc6-dev
      - libncurses5-dev
      - automake
      - libtool
      - bison
      - subversion
      - ruby

ruby-{{ pillar['ruby']['version'] }}:
  rvm.installed:
    - default: True
    - user: vagrant
    - require:
      - pkg: rvm-deps
      - pkg: mri-deps

sass:
  gem.installed:
    - name: sass
    - user: vagrant
    - version: {{ pillar['sass']['version'] }}
    - require:
      - rvm: ruby-{{ pillar['ruby']['version'] }}

foreman:
  gem.installed:
    - name: foreman
    - user: vagrant
    - require:
      - rvm: ruby-{{ pillar['ruby']['version'] }}

gemset:
  rvm.gemset_present:
    - name: zephyr
    - user: vagrant
    - require:
      - rvm: ruby-{{ pillar['ruby']['version'] }}

bundler_admin:
  cmd.run:
    - name: bundle install
    - cwd: /vagrant/admin
    - user: vagrant
    - require:
      - rvm: ruby-{{ pillar['ruby']['version'] }}

# Rails needs a Javascript runtime for coffeescript
nodejs:
  pkg:
    - installed