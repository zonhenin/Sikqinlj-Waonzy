@echo off
chcp 65001

pandoc src.txt -o tmp/text.html
perl style.pl

perl web.pl
perl assemble.pl

perl epub.pl
pandoc tmp/epub.html --epub-embed-font=BabelStoneHan.ttf --css epub.css --metadata title=锡庆里往事 --reference-location section -o 锡庆里往事.epub
ebook-convert 锡庆里往事.epub 锡庆里往事——手机.pdf --base-font-size 54
ebook-convert 锡庆里往事.epub 锡庆里往事——平板.pdf --base-font-size 12