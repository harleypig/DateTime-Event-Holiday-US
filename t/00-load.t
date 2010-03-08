#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'DateTime::Event::Holiday::US' ) || print "Bail out!
";
}

diag( "Testing DateTime::Event::Holiday::US $DateTime::Event::Holiday::US::VERSION, Perl $], $^X" );
