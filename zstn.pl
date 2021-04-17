use utf8;

open SRC, "< :encoding(UTF-8)", "src.txt";
undef $/;
$src=<SRC>;
close SRC;
$/ = "\n";

$dst=$src;
$dst=~s#\|\-\-(.)\|(.)\-\-\|#$1#g;

open OUTPUT, "> :encoding(UTF-8)", 'tmp/src.txt';
print OUTPUT $dst;

$dst=$src;
$dst=~s#\|\-\-(.)\|(.)\-\-\|#$2#g;

open ZSTN, "< :encoding(UTF-8)", 'zstn';
while (<ZSTN>) {
	chomp;
	@tr=split /\s+/;
	$lookFor=$tr[0];
	$replace=$tr[1];
	$dst=~s#$lookFor#$replace#g;
}
close ZSTN;

open OUTPUT, "> :encoding(UTF-8)", 'tmp/zstn.txt';
print OUTPUT $dst;