use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'DateTime::Event::Holiday::US',
    license             => 'perl',
    dist_author         => q{Alan Young <alansyoungiii@gmail.com>},
    dist_version_from   => 'lib/DateTime/Event/Holiday/US.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'DateTime-Event-Holiday-US-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
