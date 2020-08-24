@echo off

pandoc src.txt -o tmp/text.html
perl style.pl

perl web.pl
perl assemble.pl