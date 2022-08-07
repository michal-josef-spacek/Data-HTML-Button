package Data::HTML::Button;

use strict;
use warnings;

use Error::Pure qw(err);
use List::Util qw(none);
use Mo qw(build default);
use Mo::utils qw(check_bool check_required);
use Readonly;

Readonly::Array our @DATA_TYPES => qw(tags);
Readonly::Array our @FORM_METHODS => qw(get post);
Readonly::Array our @TYPES => qw(button reset submit);

our $VERSION = 0.01;

has autofocus => (
	ro => 1,
);

has css_class => (
	ro => 1,
);

has data => (
	ro => 1,
	default => [],
);

has data_type => (
	ro => 1,
	default => 'tags',
);

has disabled => (
	ro => 1,
);

has form => (
	ro => 1,
);

has formenctype => (
	ro => 1,
);

has formmethod => (
	ro => 1,
	default => 'get',
);

has id => (
	ro => 1,
);

has label => (
	ro => 1,
);

has name => (
	ro => 1,
);

has type => (
	ro => 1,
);

has value => (
	ro => 1,
);

sub BUILD {
	my $self = shift;

	# Check autofocus.
	check_bool($self, 'autofocus');

	# Check data type.
	if (none { $self->{'data_type'} eq $_ } @DATA_TYPES) {
		err "Parameter 'data_type' has bad value.";
	}

	# Check disabled.
	check_bool($self, 'disabled');

	# Check formmethod.
	if (none { $self->{'formmethod'} eq $_ } @FORM_METHODS) {
		err "Parameter 'formmethod' has bad value.";
	}

	# Check type.
	check_required($self, 'type');
	if (none { $self->{'type'} eq $_ } @TYPES) {
		err "Parameter 'type' has bad value.";
	}

	return;
}

1;

__END__
