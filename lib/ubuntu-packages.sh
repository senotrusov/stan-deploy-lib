#!/usr/bin/env bash

#  Copyright 2012-2019 Stanislav Senotrusov <stan@senotrusov.com>
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

apt::update() {
  sudo apt-get -o Acquire::ForceIPv4=true update || fail "Unable to apt-get update ($?)"
}

apt::dist-upgrade() {
  sudo apt-get -o Acquire::ForceIPv4=true -y dist-upgrade || fail "Unable to apt-get dist-upgrade ($?)"
}

apt::install() {
  sudo apt-get install -o Acquire::ForceIPv4=true -y "$@" || fail "Unable to apt-get install $* ($?)"
}

apt::autoremove() {
  sudo apt-get -o Acquire::ForceIPv4=true -y autoremove || fail "Unable to apt-get autoremove ($?)"
}

apt::add-key-and-source() {
  local keyUrl="$1"
  local sourceString="$2"
  local sourceName="$3"
  local sourceFile="/etc/apt/sources.list.d/${sourceName}.list"

  curl --fail --silent --show-error "${keyUrl}" | sudo apt-key add -
  test "${PIPESTATUS[*]}" = "0 0" || fail "Unable to get key from ${keyUrl} or import in into apt"

  echo "${sourceString}" | sudo tee "${sourceFile}" || fail "Unable to write apt source into the ${sourceFile}"
}

# in accordance with instructions at https://apt.syncthing.net/
apt::add-syncthing-source() {
  apt::add-key-and-source "https://syncthing.net/release-key.txt" "deb https://apt.syncthing.net/ syncthing stable" "syncthing" || fail "Unable to add syncthing apt source"
}

apt::add-obs-studio-source() {
  sudo add-apt-repository --yes ppa:obsproject/obs-studio || fail "Unable to add-apt-repository ppa:obsproject/obs-studio ($?)"
}
