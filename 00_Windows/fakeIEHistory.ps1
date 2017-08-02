1..100 | % {
    [System.Diagnostics.Process]::Start("http://www.randomwebsite.com/cgi-bin/random.pl")
}