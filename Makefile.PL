use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Perl::Modern::Moose',
    AUTHOR              => 'Juergen von Brietzke <juergen.von.brietzke@t-online.de>',
    VERSION_FROM        => 'lib/Perl/Modern/Moose.pm',
    ABSTRACT_FROM       => 'lib/Perl/Modern/Moose.pm',
    PL_FILES            => {},
    PREREQ_PM => {
      'English'                      => 0,
      'Hook::AfterRuntime'           => 0,
      'Moose'                        => 0,
      'Moose::Exporter'              => 0,
      'Moose::Util::TypeConstraints' => 0,
      'MooseX::AttributeShortcuts'   => 0,
      'MooseX::DeclareX'             => 0,
      'MooseX::HasDefaults::RO'      => 0,
      'Test::More'                   => 0,
      'version'                      => 0,
      'namespace::autoclean'         => 0,
    },
    BUILD_REQUIRES => {
        'Test::More'          => 0,
        'Test::Perl::Critic'  => 0,
        'Test::Pod'           => 1.14,
        'Test::Pod::Coverage' => 1.04,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Perl-Modern-Moose-*' },
);
