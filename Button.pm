package Data::HTML::Button;

use strict;
use warnings;

use Error::Pure qw(err);
use List::Util qw(none);
use Mo qw(build default is);
use Mo::utils qw(check_bool check_required);
use Readonly;

Readonly::Array our @DATA_TYPES => qw(plain tags);
Readonly::Array our @ENCTYPES => (
	'application/x-www-form-urlencoded',
	'multipart/form-data',
	'text/plain',
);
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
	default => [],
	ro => 1,
);

has data_type => (
	ro => 1,
);

has disabled => (
	ro => 1,
);

has form => (
	ro => 1,
);

has form_enctype => (
	ro => 1,
);

has form_method => (
	ro => 1,
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
	if (! defined $self->{'autofocus'}) {
		$self->{'autofocus'} = 0;
	}
	check_bool($self, 'autofocus');

	# Check data type.
	if (! defined $self->{'data_type'}) {
		$self->{'data_type'} = 'plain';
	}
	if (none { $self->{'data_type'} eq $_ } @DATA_TYPES) {
		err "Parameter 'data_type' has bad value.";
	}

	# Check disabled.
	if (! defined $self->{'disabled'}) {
		$self->{'disabled'} = 0;
	}
	check_bool($self, 'disabled');

	# Check form_enctype.
	if (defined $self->{'form_enctype'}) {
		if (none { $self->{'form_enctype'} eq $_ } @ENCTYPES) {
			err "Parameter 'form_enctype' has bad value.",
				'Value', $self->{'form_enctype'},
			;
		}
	}

	# Check form_method.
	if (! defined $self->{'form_method'}) {
		$self->{'form_method'} = 'get';
	}
	if (none { $self->{'form_method'} eq $_ } @FORM_METHODS) {
		err "Parameter 'form_method' has bad value.";
	}

	# Check type.
	if (! defined $self->{'type'}) {
		$self->{'type'} = 'button';
	}
	if (none { $self->{'type'} eq $_ } @TYPES) {
		err "Parameter 'type' has bad value.";
	}

	return;
}

1;

__END__
