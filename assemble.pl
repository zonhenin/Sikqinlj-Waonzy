use utf8;

open SRC, "< :encoding(UTF-8)", "title";
undef $/;
$title=<SRC>;
close SRC;
$/ = "\n";

open SRC, "< :encoding(UTF-8)", "tmp/text-styled.html";
undef $/;
$text=<SRC>;
close SRC;
$/ = "\n";

open SRC, "< :encoding(UTF-8)", "template.html";
undef $/;
$template=<SRC>;
close SRC;
$/ = "\n";

$template=~s/\|\=title\=\|/$title/g;
$template=~s/\|\=text\=\|/$text/g;

open OUTPUT, "> :encoding(UTF-8)", 'index.html';
print OUTPUT $template;

