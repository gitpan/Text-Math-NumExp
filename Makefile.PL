
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Text::Math::NumExp - Find numeric expressions in text.",
  "AUTHOR" => "Andre Santos <andrefs\@cpan.org>",
  "BUILD_REQUIRES" => {
    "File::Touch" => 0,
    "Test::Deep" => 0,
    "Test::File" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Text-Math-NumExp",
  "EXE_FILES" => [
    "bin/dump_numexp_csv"
  ],
  "LICENSE" => "perl",
  "NAME" => "Text::Math::NumExp",
  "PREREQ_PM" => {
    "Data::Dump" => 0,
    "Exporter" => 0,
    "Lingua::EN::FindNumber" => 0,
    "Safe" => 0,
    "Scalar::Util" => 0,
    "Text::CSV" => 0,
    "base" => 0,
    "feature" => 0,
    "strict" => 0,
    "utf8::all" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.01_12",
  "test" => {
    "TESTS" => "t/*.t"
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



