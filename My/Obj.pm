package Obj;

sub new{
	my $pkg = shift;
	my $hash = {
		obj_ref => shift
	};
	bless $hash,$pkg;
}
sub obj{
	my $class = shift;
	return $class -> {obj_ref};
}
sub value{
	my $class = shift;
	my $obj_ref = $class -> {obj_ref};
	my $obj;

	while(ref $obj_ref eq 'REF'){
		$obj = ${$obj_ref};
	}

	if(ref $obj_ref eq 'SCALAR'){
		return ${$obj_ref};
	}elsif(ref $obj_ref eq 'ARRAY'){
		return @{$obj_ref};
	}elsif(ref $obj_ref eq 'HASH'){
		return %{$obj_ref};
	}else{
		return $obj;
	}
	return 0;
}
1;