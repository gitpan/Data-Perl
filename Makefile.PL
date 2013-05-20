
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Base classes wrapping fundamental Perl data types.",
  "AUTHOR" => "Matthew Phillips <mattp\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Data-Perl",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Data::Perl",
  "PREREQ_PM" => {
    "Class::Method::Modifiers" => 0,
    "List::MoreUtils" => 0,
    "List::Util" => 0,
    "Module::Runtime" => 0,
    "Role::Tiny" => 0,
    "Scalar::Util" => 0,
    "parent" => 0,
    "strictures" => 0
  },
  "TEST_REQUIRES" => {
    "Test::Deep" => 0,
    "Test::Fatal" => 0,
    "Test::Output" => 0
  },
  "VERSION" => "0.002007",
  "test" => {
    "TESTS" => "t/*.t t/collection/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



