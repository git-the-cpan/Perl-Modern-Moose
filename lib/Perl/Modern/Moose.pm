# ##############################################################################
# # Script     : Perl::Modern::Moose                                           #
# # -------------------------------------------------------------------------- #
# # Copyright  : Frei unter GNU General Public License  bzw.  Artistic License #
# # Authors    : JVBSOFT - Jürgen von Brietzke                   0.001 - 1.000 #
# # Version    : 1.001                                             15.Dez.2015 #
# # -------------------------------------------------------------------------- #
# # Function   : Lädt grundlegende Perl-Moose Module.                          #
# # -------------------------------------------------------------------------- #
# # Language   : PERL 5                                (V) 5.10.xx  -  5.22.xx #
# # Coding     : ISO 8859-15 / Latin-9                         UNIX-Zeilenende #
# # Standards  : Perl-Best-Practices                       severity 1 (brutal) #
# # -------------------------------------------------------------------------- #
# # Pragmas    : namespace::autoclean                                          #
# # -------------------------------------------------------------------------- #
# # Module     : English                                ActivePerl-CORE-Module #
# #              Moose                                                         #
# #              Moose::Exporter                                               #
# #              Moose::Util::TypeConstraints                                  #
# #              ------------------------------------------------------------- #
# #              Hook::AfterRuntime                     ActivePerl-REPO-Module #
# #              MooseX::AttributeShortcuts                                    #
# #              MooseX::DeclareX                                              #
# #              MooseX::HasDefault::RO                                        #
# ##############################################################################

package Perl::Modern::Moose 1.001;

# ##############################################################################

use namespace::autoclean;

use English qw{-no_match_vars};
use Hook::AfterRuntime;
use Moose;
use Moose::Exporter;
use Moose::Util::TypeConstraints;
use MooseX::AttributeShortcuts;
use MooseX::DeclareX;
use MooseX::HasDefaults::RO;

# ##############################################################################

Moose::Exporter->setup_import_methods(also => ['Moose']);

# ##############################################################################

sub init_meta {

   my $class     = shift;
   my %params    = @ARG;
   my $for_class = $params{for_class};
   my $caller    = caller 0;
   my %declarex  = ( keyword => [qw{class extends}],
                     plugins => [qw{private protected public std_constants}],
                     types   => [ -Moose ],
                   );

   Moose->init_meta(@ARG);
   Moose::Util::TypeConstraints->import( { into => $for_class } );
   MooseX::AttributeShortcuts->init_meta(@ARG);
   MooseX::HasDefaults::RO->import( { into => $for_class } );
   $_->setup_for($for_class, %declarex, provided_by => $caller)
      for MooseX::DeclareX->_keywords(\%declarex);
   namespace::autoclean->import( -cleanee => $for_class );
   after_runtime { $for_class->meta->make_immutable };

   return;

}

# ##############################################################################
# #                                  E N D E                                   #
# ##############################################################################
1;
__END__

=head1 NAME

Perl::Modern::Moose - Loading essential Perl Moose modules.


=head1 VERSION

This document describes Perl::Modern::Moose version 1.001


=head1 SYNOPSIS

   use Perl::Modern::Moose;
  
  
=head1 DESCRIPTION

The PERL Moose modules listed below are included in the namespace of the
including module:

   - Moose
   - Moose::Exporter
   - Moose::Util::TypeConstraints
   - MooseX::AttributeShortcuts
   - MooseX::DeclareX
   - MooseX::HasDefaults::RO
   - namespace::autoclean

When you exit the namespace an auto-mix 'meta> make_immutable' is executed.


=head1 INTERFACE 

Contains no routines that are invoked explicitly.


=head2 init_meta

Called automatically when integrating.


=head1 DIAGNOSTICS

none


=head1 CONFIGURATION AND ENVIRONMENT

Perl::Modern::Moose requires no configuration files or environment variables.


=head1 DEPENDENCIES

None.


=head1 INCOMPATIBILITIES

None reported.


=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-perl-modern-moose@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.


=head1 AUTHOR

Juergen von Brietzke  C<< <juergen.von.brietzke@t-online.de> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2015,
Juergen von Brietzke C<< <juergen.von.brietzke@t-online.de> >>.
All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
