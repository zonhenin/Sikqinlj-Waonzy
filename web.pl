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
	$replace1=$tr[1];
	$replace2=$tr[2];
	$html=~s#\|\=${lookFor}\=\|#<span class="zhrr-st" data-text="$replace1" data-alt="$replace2">$replace1</span>#g;
}
close TR;

open OUTPUT, "> :encoding(UTF-8)", 'tmp/web.html';
print OUTPUT $html;