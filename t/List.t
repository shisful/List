package test::List;

use strict;
use warnings;
use base qw(Test::Class);
use Test::More;
use My::List;

sub init : Test(1) {
    new_ok 'My::List';
}

sub append : Tests {
    my $list = My::List->new;
    $list->append("hello");
    is $list->{front_node}->value, "hello";
}

sub iteration : Tests {
    my $list = My::List->new;
    $list->append("hello");
    $list->append([1,2,3,4]);
    my $iter = $list->iterator;
    is $iter->next->value, "hello";
    is_deeply $iter->next->value, [1,2,3,4];
}


__PACKAGE__->runtests;

1;