use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('App::Commons::StructuredData', 'App::Commons::StructuredData is covered.');
