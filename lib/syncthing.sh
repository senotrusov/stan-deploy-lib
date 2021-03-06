#!/usr/bin/env bash

#  Copyright 2012-2021 Stanislav Senotrusov <stan@senotrusov.com>
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

syncthing::macos::install() {
  brew install syncthing || fail
  brew services start syncthing || fail
}

syncthing::apt::install() {
  # in accordance with instructions at https://apt.syncthing.net/
  apt::add-key-and-source "https://syncthing.net/release-key.txt" "deb https://apt.syncthing.net/ syncthing stable" "syncthing" || fail "Unable to add syncthing apt source"
  apt::update || fail
  apt::install syncthing || fail
  sudo systemctl enable --now "syncthing@${SUDO_USER}.service" || fail
}
