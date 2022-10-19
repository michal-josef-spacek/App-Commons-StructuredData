package App::Commons::StructuredData;

use strict;
use warnings;

use Class::Utils qw(set_params);
use Error::Pure qw(err);
use Getopt::Std;
use Unicode::UTF8 qw(encode_utf8);
use Wikibase::API;
use Wikibase::Datatype::Print::Mediainfo;

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Process parameters.
	set_params($self, @params);

	# Object.
	return $self;
}

# Run.
sub run {
	my $self = shift;

	# Process arguments.
	$self->{'_opts'} = {
		'c' => undef,
		'h' => 0,
		'i' => undef,
	};
	if (! getopts('chi:', $self->{'_opts'}) || $self->{'_opts'}->{'h'}) {
		return $self->_usage;
	}
	my $commons_name = $ARGV[0] || undef;
	if (! defined $commons_name && ! defined $self->{'_opts'}->{'i'}) {
		print STDERR "Missing Wikimedia Commons file name or M id.\n";
		return $self->_usage;
	}
	my $mid = $self->{'_opts'}->{'i'} || undef;

	# Wikibase::API.
	$self->{'_wikibase_api'} = Wikibase::API->new(
		'mediawiki_site' => 'commons.wikimedia.org',
	);

	# Get M Id.
	if (! defined $mid) {
		# TODO
	}

	# Get item.
	my $item = $self->{'_wikibase_api'}->get_item($mid);

	# Print item.
	print encode_utf8(scalar Wikibase::Datatype::Print::Mediainfo::print($item));
	print "\n";
	
	return 0;
}

sub _usage {
	my $self = shift;

	print STDERR "Usage: $0 [-c] [-h] [-i id] [--version] [commons_name]\n";
	print STDERR "\t-c\t\tColor mode.\n";
	print STDERR "\t-h\t\tPrint help.\n";
	print STDERR "\t-t id\t\tMID of file on commons (same as 'M_PAGEID_').\n";
	print STDERR "\t--version\tPrint version.\n";
	print STDERR "\tcommons_name\tFile name on Wikimedia Commons. e.g. ".
		"'Michal from Czechia.jpg'\n";

	return 1;
}

1;


__END__
