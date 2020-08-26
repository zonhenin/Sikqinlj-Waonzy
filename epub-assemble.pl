use utf8;

open SRC, "< :encoding(UTF-8)", "tmp/epub.html";
undef $/;
$text=<SRC>;
close SRC;
$/ = "\n";

open SRC, "< :encoding(UTF-8)", "epub-template.html";
undef $/;
$template=<SRC>;
close SRC;
$/ = "\n";

$template=~s/\|\=text\=\|/$text/g;

open OUTPUT, "> :encoding(UTF-8)", 'epub.html';
print OUTPUT $template;

