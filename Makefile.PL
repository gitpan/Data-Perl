
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Base classes wrapping fundamental Perl data types.",
  "AUTHOR" => "Matthew Phillips <mattp\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Class::Method::Modifiers" => 0,
    "List::MoreUtils" => 0,
    "List::Util" => 0,
    "Module::Runtime" => 0,
    "Role::Tiny" => 0,
    "Scalar::Util" => 0,
    "Test::Fatal" => 0,
    "Test::Output" => 0,
    "strictures" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Data-Perl",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Data::Perl",
  "PREREQ_PM" => {},
  "VERSION" => "0.002002",
  "test" => {
    "TESTS" => "t/*.t t/collection/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



