package My::Iterator;

use strict;
use warnings;


sub new {
	my $class = shift;
	my $list = shift;
	my $hash = {
        list => $list,
        current => $list->{front_node}
	};
	bless $hash, $class;
}

sub has_next {
	my $self = shift;
	return defined($self->{current}->{next_node});
}

sub next{
	my $self = shift;
	if(defined($self->{current})){
       	my $node = $self->{current};
       	$self->{current} = $node->{next_node};
       	return $node;
	}else{
    	return 0;
	}
}

1;