use strict;

return sub {
        my $env = shift;
        my $out = '';
        use DateTime;
        my $date = DateTime->now(time_zone => 'Asia/Tokyo');
        my $vars = {
            date   => $date->strftime('%Y/%m/%d %H:%M:%S'),
            server => $env->{HTTP_HOST}
        };
        use Template;
        my $tt = Template->new();
        $tt->process('sample.tt', $vars, \$out) or die $tt->error;
        return [200, ['Content-Type' => 'text/html'], [$out]];
};
