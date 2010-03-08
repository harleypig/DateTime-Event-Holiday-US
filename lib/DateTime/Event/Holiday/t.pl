#!/usr/bin/perl

use strict;
use warnings;

my %month = (qw(

  January    1
  February   2
  March      3
  April      4
  May        5
  June       6
  July       7
  August     8
  September  9
  October   10
  November  11
  December  12

));

my %day = (qw(

  Sunday    su
  Monday    mo
  Tuesday   tu
  Wednesday we
  Thursday  th
  Friday    fr
  Saturday  sa

));

my %st = (qw(

  First  1
  Second 2
  Third  3
  Fourth 4
  Fifth  5
  Last  -1

));

my $st_rx = join '|', keys %st;

my %holiday = (

  'New Years Day' => 'January 1',
  'Martin Luther King Day' => 'Third Monday in January',
  'Martin Luther King, Jr Birthday' => 'January 15',
  'Super Bowl Sunday' => 'First Sunday in February',
  'Groundhog Day' => 'February 2',
  'Washingtons Birthday (observed)' => 'Third Monday in February',
  'Lincolns Birthday' => 'February 12',
  'Valentines Day' => 'February 14',
  'Susan B. Anthony Day' => 'February 15',
  'Washingtons Birthday' => 'February 22',
  'St. Patricks Day' => 'March 17',
  'Sewards Day' => 'Last Monday in March',
  'Cesar Chavez Day' => 'March 31',
  'April Fools Day' => 'April 1',
  'Emancipation Day' => 'April 16',
  'Confederate Memorial Day' => 'Fourth Monday in April',
  'Earth Day' => 'April 22',
  'Mothers Day' => 'Second Sunday in May',
  'Memorial Day' => 'Last Monday in May',
  'Jefferson Davis Day' => 'First Monday in June',
  'Flag Day' => 'June 14',
  'Fathers Day' => 'Third Sunday in June',
  'Independence Day' => 'July 4',
  'Womens Equality Day' => 'August 26',
  'Labor Day' => 'First Monday in September',
  'Patriot Day' => 'September 11',
  'Citizenship Day' => 'September 17',
  'Leif Erikson Day' => 'October 9',
  'Columbus Day' => 'Second Monday in October',
  'Alaska Day' => 'October 18',
  'Halloween' => 'October 31',
  'Veterans Day' => 'November 11',
  'Thanksgiving Day' => 'Fourth Thursday in November',
  'Pearl Harbor Remembrance Day' => 'December 7',
  'Winter Solstice' => 'December 21',
  'Christmas Eve' => 'December 24',
  'Christmas' => 'December 25',
  'New Years Eve' => 'December 31',

);

my $r1 = "  '%s' => 'RRULE:FREQ=YEARLY;BYMONTH=%d;BYDAY=%d%s', # %s\n";
my $r2 = "  '%s' => 'RRULE:FREQ=YEARLY;BYMONTH=%d;BYMONTHDAY=%d', # %s\n";

for my $h ( keys %holiday ) {

  my $s = $holiday{ $h };

  my @tokens = split /\s+/, $s;

  if ( $s =~ /$st_rx/ ) {

    # (First|Second|Third|Fourth|Fifth|Last) Day in Month
    # { 'bymonth' => numeric Month, 'byday' => 'numeric position short day' }, # _st Day in Month
    printf $r1, $h, $month{ $tokens[3] }, $st{ $tokens[0] }, $day{ $tokens[1] }, $s;

  } else {

    # Month Day
    # { 'bymonth' => numeric Month, 'bymonthday' => Day }, # Month Day
    printf $r2, $h, $month{ $tokens[0] }, $tokens[1], $s;

  }
}

