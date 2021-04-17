@echo off
chcp 65001

perl zstn.pl

pandoc tmp/zstn.txt -o tmp/text.html
perl style.pl
perl assemble.pl
del zstn.html
rename index.html zstn.html

pandoc tmp/src.txt -o tmp/text.html
perl style.pl
perl assemble.pl

pandoc tmp/text-styled.html --epub-embed-font=noto.otf --css epub.css --metadata title=锡庆里往事 --reference-location section -o 锡庆里往事.epub
ebook-convert 锡庆里往事.epub 锡庆里往事——手机.pdf --base-font-size 54
ebook-convert 锡庆里往事.epub 锡庆里往事——平板.pdf --base-font-size 12