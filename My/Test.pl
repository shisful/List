package My::test;

use strict;
use warnings;
use List;

my $test = My::List->new();
$test->append("hello");
$test->append(1,2,3);
$test->append("hello");



my $iter = $test->iterator;

while ($iter->has_next){
	print $iter->next->value;
}
