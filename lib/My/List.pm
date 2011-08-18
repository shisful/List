package My::List;

use My::Iterator;
use My::Node;
use strict;
use warnings;

sub new {
	my $pkg = shift;
	my $hash = {
	 front_node => undef
	};
	bless $hash,$pkg;
}

sub append {
	my $class = shift;
	my $obj = shift;
    my $new_node = My::Node->new($obj);
    $class->chained($new_node);
    return 1;
}

sub iterator {
	my $self = shift;
	my $iter = My::Iterator->new($self);
	return $iter;
}

sub chained {
    my $class = shift;
    my $new_node = shift;
    if(defined($class->{front_node})){
        my $front_node = $class->{nodes}->[0];
        $front_node->set_next_node($new_node);
        unshift (@{$class->{nodes}},$new_node);
    }else{
        unshift (@{$class->{nodes}},$new_node);
        $class->{front_node} = $new_node;
    }

}

1;