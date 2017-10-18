#!/usr/bin/env bash
# https://stackoverflow.com/questions/15407075/how-could-i-use-git-bisect-to-find-the-first-good-commit
# bad: HEAD
# bad: a36b34c4821653e3db3ff24b903265a7750a3397
# bad: a055f240aeda538c656a59e810870e6a2ccc2db7
# bad: a67b66e663d159c219750a5044ccf553c4b21bdb
# bad: 33452dfc6cf891b59d63fa9fe138b18cbce4df81
# good: ghc-8.2.1-release
# good: 3a163aabe7948d382393e9e81f1239f3e06b222b
# good: 2183ac16a98146bb673b5530ca154499a1c6166e
# good: bade356f79d44c9f6e8918a89d9ffac7f5608dbf
# good: c9e4c861c6855e03bd14b182d2173da559e98d85
# good: a520adcce27908c799b64214618cf9b33572dc37
# good: 9afaebefe5e59c8e9632f381bee14aa84b44c955
# good: 5f3d2d3be034e04ba872f2695ab6d7b75de66663
#
# 33452dfc6cf891b59d63fa9fe138b18cbce4df81 is the first bad commit
# commit 33452dfc6cf891b59d63fa9fe138b18cbce4df81
# Author: Simon Peyton Jones <simonpj@microsoft.com>
# Date:   Fri Aug 25 09:22:03 2017 +0100
#
#     Refactor the Mighty Simplifier
#
# git bisect start
# git bisect bad HEAD
# git bisect good ghc-8.2.1-release
# git bisect run test-webapp-template.sh


echo 'test-webapp-template START'
pwd
git describe
make clean

git clean -df
git submodule deinit -f --all
git submodule sync
git submodule update --init
echo 'test-webapp-template STATUS'
git status
git clean -df
git co -- .
git status

cp -v mk/build.mk.sample mk/build.mk
./boot
./configure
make || exit 125

echo 'test-webapp-template CABAL'
(
cd /home/dbushev/projects/4e6/webapp-template-hs && \
cabal --require-sandbox install --with-ghc=/home/dbushev/projects/Aviora/ghc/inplace/bin/ghc-stage2
)

if [ $? -eq 0 ]; then
  echo 'test-webapp-template NOT A BUG'
  exit 1
else
  echo 'test-webapp-template A BUG'
  exit 0
fi
