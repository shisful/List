package My::List;

use Iterator;
use strict;
use warnings;

sub new{
	my $pkg = shift;
	my $hash = {
		iterator => My::Iterator -> new()
	};
	bless $hash,$pkg;
}

sub append{
	my $class = shift;
	my $obj_ref = \@_;
	$class -> {iterator} -> add_obj($obj_ref);
}

sub iterator{
	my $class = shift;
	return $class -> {iterator};
}

1;