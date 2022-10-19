use strict;
use warnings;

use App::Commons::StructuredData;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($App::Commons::StructuredData::VERSION, 0.01, 'Version.');
