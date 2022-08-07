use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Data::HTML::Button;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::HTML::Button->new(
	'type' => 'button',
);
isa_ok($obj, 'Data::HTML::Button');

# Test.
eval {
	Data::HTML::Button->new(
		'autofocus' => 'bad',
		'type' => 'submit',
	);
};
is($EVAL_ERROR, "Parameter 'autofocus' must be a bool (0/1).\n",
	"Parameter 'autofocus' must be a bool (0/1).");
clean();
