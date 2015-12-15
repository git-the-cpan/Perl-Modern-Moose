use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
   module_name         => 'Perl::Modern::Moose',
   license             => 'artistic2',
   dist_author         => 'Juergen von Brietzke <juergen.von.brietzke@t-online.de>',
   dist_version_from   => 'lib/Perl/Modern/Moose.pm',
   requires => {
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
   add_to_cleanup      => [ 'Perl-Modern-Moose-*' ],
);

$builder->create_build_script();
