use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Base class and script for processing structured data in Wikimedia Commons.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.05;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
install_script 'bin/commons-structured-data';
license 'bsd';
name 'App-Commons-StructuredData';
perl_version 5.006;
readme_from 'bin/commons-structured-data';
recursive_author_tests('xt');
requires 'Class::Utils' => 0;
requires 'Error::Pure' => 0;
requires 'Getopt::Std' => 0;
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/App-Commons-StructuredData/issues',
resources 'homepage' => 'https://github.com/michal-josef-spacek/App-Commons-StructuredData';
resources 'repository' => 'git://github.com/michal-josef-spacek/App-Commons-StructuredData';
test_requires 'English' => 0;
test_requires 'Error::Pure::Utils' => 0;
test_requires 'Test::LWP::UserAgent' => 0;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
