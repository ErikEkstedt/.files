#!/bin/bash

project_url="https://nest.pijul.com/pijul_org/pijul"
tabs=(
  "https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/key-bindings.zsh"
  "https://www.tecmint.com/install-rust-programming-language-in-linux/"
  "https://jneem.github.io/pijul/"
  "https://www.gitbook.com/?utm_source=content&utm_medium=trademark&utm_campaign=libsodium"
  "https://github.com/ssbc/patchwork"
  "https://arxiv.org/pdf/1311.3903.pdf"
  "https://download.libsodium.org/doc/quickstart"
  "https://download.libsodium.org/libsodium/releases/"
  "https://download.libsodium.org/libsodium/releases/"
  "https://ssb.dapp.org/invite-me-please"
  "https://github.com/ssbc/patchwork/releases"
  "https://www.scuttlebutt.nz/getting-started.html"
  "https://en.wikipedia.org/wiki/Discrete_logarithm"
  "https://en.wikipedia.org/wiki/Group_(mathematics)"
  "https://en.wikipedia.org/wiki/Elliptic_curve"
  "https://en.wikipedia.org/wiki/Edwards_curve"
  "https://en.wikipedia.org/wiki/EdDSA"
  "https://en.wikipedia.org/wiki/Curve25519"
  "https://en.wikipedia.org/wiki/SHA-2"
  "https://ssbc.github.io/scuttlebot/"
  "https://obsproject.com/sv"
  "https://www.google.com/search?client=ubuntu&hs=IFL&channel=fs&ei=mX0VXOj-I9H1qwGuk4WYCw&q=sbot+secure+scuttlebot&oq=sbot+secure+scuttlebot&gs_l=psy-ab.3..33i160l2.1288.3539..3671...0.0..0.135.1376.17j1......0....1..gws-wiz.......0j35i39j0i203j0i22i30j0i13i30j0i13i5i30.a-IzaKPZu8U"
  "https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/"
  )


firefox --new-window $project_url
sleep 0.2
echo "Opening tabs in new Firefox instance:"
for url in ${tabs[@]}; do
  echo $url
  firefox --new-tab $url
done
