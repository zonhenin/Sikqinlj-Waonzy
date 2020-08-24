open SRC, "< :encoding(UTF-8)", "tmp/text.html";
undef $/;
$html=<SRC>;
close SRC;
$/ = "\n";

$html=~s/\<p\>\|\=\=([\w\d-_]+)\=\=\|\<\/p\>/\<div class="zhrr-$1"\>/g;
$html=~s#\<p\>\|\=\-([\w\d-_]+)\-\=\|\</p\>#</div>#g;

open OUTPUT, "> :encoding(UTF-8)", 'tmp/text-styled.html';
print OUTPUT $html;