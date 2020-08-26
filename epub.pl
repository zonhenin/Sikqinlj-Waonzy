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
	$html=~s#\|\=${lookFor}\=\|#$replace#g;
}
close TR;

open OUTPUT, "> :encoding(UTF-8)", 'tmp/epub.html';
print OUTPUT $html;

print OUTPUT '<h1 style="font-size: 0px;">庄府二楼平面图</h1>';
print OUTPUT '<img src="庄府二楼平面图-r.jpg" alt="庄府二楼平面图" style="width: 100%;"></img>';