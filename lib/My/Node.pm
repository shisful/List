package My::Node;

use strict;
use warnings;

sub new {
	my $pkg = shift;
	my $hash = {
		obj_ref => shift,
		next_node => undef
	};
	bless $hash,$pkg;
}

sub set_next_node {
    my $class = shift;
    my $next_node = shift;
    $class->{next_node} = $next_node;
    return 1;
}

sub value {
	my $self = shift;
	my $obj = $self -> {obj_ref};
	return $obj;
}
1;