use utf8;

open SRC, "< :encoding(UTF-8)", "tmp/text-styled.html";
undef $/;
$html=<SRC>;
close SRC;
$/ = "\n";

open TR, "< :encoding(UTF-8)", 'trzh';
while (<TR>) {
	chomp;
	@tr=split /\s+/;
	$lookFor=$tr[0];
	$replace=$tr[1];
	$html=~s#\|\=${lookFor}\=\|#<span class="zhrr-st" data-text="$lookFor">$replace</span>#g;
}
close TR;

open OUTPUT, "> :encoding(UTF-8)", 'tmp/web.html';
print OUTPUT $html;