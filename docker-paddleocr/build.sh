#!/bin/bash


cd tmp

git init
git remote add origin https://github.com/laxian/shell.git
git config core.sparsecheckout true\n
echo apr/e1/delay-ocr >> .git/info/sparse-checkout
git pull origin dev

mv apr/e1/delay-ocr ..
cd .. && rm -rf tmp

docker build -t paddleocr:0.0.1 .