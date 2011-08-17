package My::Iterator;

use strict;
use warnings;

my $ini = "ini";
sub new{
	my $pkg = shift;
	my $hash = {
		obj_hash => {},
		next_key_add => "ini",
		next_key_pull => "ini"
	};
	bless $hash,$pkg;
}


sub has_next{
	my $class = shift;
	return exists(${$class -> {obj_hash}}{$class -> get_next_key_pull()});
}

sub add_obj{
	my $class = shift;
	my $obj_ref = shift;
	my $key = $class -> get_next_key_add();

	if(defined $key){
		$class -> {obj_hash} -> {$key} = $obj_ref;
		$class -> set_next_key_add($obj_ref);
		return 1;
	}else{
		return 0;
	}
}
sub next{
	my $class = shift;
	my $obj_ref = $class -> get_next_obj_ref();
	my $obj = My::Obj -> new ($obj_ref);
	return $obj;
}

sub get_next_obj_ref{
	my $class = shift;
	my $key = $class -> get_next_key_pull();
	$class -> set_next_key_pull($class -> {obj_hash} -> {$key});
	return $class -> {obj_hash}{$key};
}

sub get_next{
	my $class = shift;
	my $obj = $class -> get_next_obj_ref();
}

sub set_next_key_add{
	my $class = shift;
	my $next_key = shift;
	$class -> {next_key_add} = $next_key;
	return 1;
}
sub set_next_key_pull{
	my $class = shift;
	$class -> {next_key_pull} = shift;
	return 1;
}

sub get_next_key_add{
	my $class = shift;
	return $class -> {next_key_add};
}
sub get_next_key_pull{
	my $class = shift;
	my $key = $class -> {next_key_pull};
	return $key;
}
1;

package My::Obj;

sub new{
	my $pkg = shift;
	my $hash = {
		obj_ref => shift
	};
	bless $hash,$pkg;
}
sub obj{
	my $class = shift;
	return @{$class -> {obj_ref}};
}
sub value{
	my $class = shift;
	return @{$class -> {obj_ref}};
}
1;