#!/usr/bin/perl

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

