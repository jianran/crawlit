#!/usr/bin/perl

#@a1=(0..9);
#for $a (@a1) {
#       print "select * from atp_default_policy_00$a where status = 1 and fare_source = 200008  union all \n";
#}
#@a1=(96..99);
#for $a (@a1) {
#       print "select * from atp_default_policy_0$a where status = 1 and fare_source = 200008  union all \n";
#}
#@a1=(100..127);
#for $a (@a1) {
#       print "select * from atp_default_policy_$a where status = 1 and fare_source = 200008  union all \n";
#}
use JSON;
use LWP::Simple;
use HTML::TreeBuilder::XPath;
use utf8;
use Encode;
use strict;
          
#$html = get("http://stackoverflow.com/questions/tagged/java");
my %data;
my $html = get("http://www.javaworld.com/news");
Encode::_utf8_on($html);
my $tree = new HTML::TreeBuilder::XPath;
$tree->parse( $html );
$tree->eof;
my $items = $tree->findnodes('//h3/a'); 
for my $item ( $items->get_nodelist() ){
        if ($item->attr('href') =~ /^http.*/) { 
                $data{$item->content->[0]} = $item->attr('href');
        } else {
                $data{$item->content->[0]} = "http://www.javaworld.com" . $item->attr('href');
        }
    }
my $html = get("http://mobile.techworld.com/topics/java/");
Encode::_utf8_on($html);
my $tree = new HTML::TreeBuilder::XPath;
$tree->parse( $html );
$tree->eof;
my $items = $tree->findnodes('//h3/a');
for my $item ( $items->get_nodelist() ){
        if ($item->attr('href') =~ /^http.*/) {
                $data{$item->content->[0]} = $item->attr('href');
        } else {
                $data{$item->content->[0]} = "http://mobile.techworld.com" . $item->attr('href');
        }
    }
my $html = get("http://m.infoworld.com/t/java-programming");
Encode::_utf8_on($html);
my $tree = new HTML::TreeBuilder::XPath;
$tree->parse( $html );
$tree->eof;
my $items = $tree->findnodes('//h3/a');
for my $item ( $items->get_nodelist() ){
        if ($item->attr('href') =~ /^http.*/) {
                $data{$item->content->[0]} = $item->attr('href');
        } else {
                $data{$item->content->[0]} = "http://m.infoworld.com" . $item->attr('href');
        }
    }
my $html = get("https://www.java.net/javanews");
Encode::_utf8_on($html);
my $tree = new HTML::TreeBuilder::XPath;
$tree->parse( $html );
$tree->eof;
my $items = $tree->findnodes("//div[\@class='title']/a");
for my $item ( $items->get_nodelist() ){
        if ($item->attr('href') =~ /^http.*/) {
                $data{$item->content->[0]} = $item->attr('href');

