class sshroot($ensure='present') {
## Simplifies debug when necessary.
if "$ensure" == 'present' {
  $directory = 'directory'
} else {
  $directory = 'absent'
}

file { '/root/.ssh':
 ensure => "$directory",
 mode => '600',
 recurse => 'true',
 notify => File['/root/.ssh/authorized_keys','/root/.ssh/id_rsa'],
}

file { '/root/.ssh/authorized_keys':
  ensure => "$ensure",
  content => '
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArLMU+JQcG75Tg+JD12zo7fcbCvytfcMcqdLimRAiscp83c1hjeIaP0zmAEDuopUHKwc3zzJOj2omxjZeGelxGCOssY/f4SlhOJmucqdwsWVMwD9mCDfK6kdlHoFKUs2ZR+k7J+hbbsD8b2bD9F209pJXKYmo/LnUcemVes8bPa9Dam5GPXENrzkSmfBznJT1B04ORPzpQ5dNWRJTpo0lk5RGsuzcjZLsLdsg96T6hkrEEZ7RarwdUeXcM6bys9af5/P6A40/iLZ2aBi8SKVmvWUXO3+jQjYoiOyobVYGYYIwUymF1eudyK7faItPc8btpumHQhymfYhfAYs6I9dNmw== ddutta@gmail.com
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtxP3A5vfb2FrLkalrSgN1xfZqth+S5Wznt6vL1TBnUcuNQ5Zvkoa6KBFL/D6YloSOaRUejYeem7bMCNNkFknSh5DIevBzCJ+PmP6pBlsKQYyvKp2xjhGIXf/QlyCcU9DocJynMZ1K2BsZvxyoEIIN/tIhc2XMVV+TaTlgMm1ygZzi/lzYobxhbvPgfIl3gAuoyVJUfY09tKH1byZXgzcB1bNXGc5OiXrjqd9NXjyrnIAayFd2NN0p5SgXG961x9lmdFenGeoiWTZMD0oYA8wFT6KzHuzdiFf6fP6qv9Zwlo76ci5HK1ltqmea8+9yhgKR9zQ5nzMESie4goYffmuWQ== rstarmer@gmail.com
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtmZlsiXwfs7Ngum64u/mXBPHus58p3/w7elfwCMwWy5YoQQSn/vBPYlAsRCNtbSxfr1I8FLteMG4h99Lr+zmsDfmjy9C/yiMNmyy6j6Tx/e7p+Ot4b0o6SD9eyCdCKd9XKR5hdW2xKpYbH/sb3dK587CP277KvSXpcayaLXBYw/Yeb3NK1H6bmzBdi/zXvbFSICAzEMM8D27BQfgVfNyhoT5Yve8aB0aP/Z9Tc7stvWUAw1+HIZnRQI17zAd5Z8QQkLYSLQwRcs5zV10KQ1GZ9vPdMpRrFqgdZbfuT1zPiJ5gayfoJmoGUa4L8Hvq7f0YcQInFpJK15p3MgLw8Y4kQ== starmer@cisco.com
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeS9zlMeXeivRadLQPLkKevr4wgwckKWr7/M2duvAwNNUmksQTwdfgyA9olciY4LAtn1CRFt4eU7gXOkbP9c0iUTvn/R7Rsva29W/NyXAKIF56PEEZ77FHlXyifuOgRiaRHZMz7sbMFsiXhgwwOl/fsA8pCGOo7VZ5Y088Bwcec0xpm8doxgTZoHtBGcskYX3OiAcYr/dJqzvJmtPwTUtjpWlk9pTSrnedxgKh9XKndKEE3ewjsTAmtpAkdw5gdaUCmJMM4U+o86QIxTNy67ITjoFnsNlspxDiTlrPGn8D6Xt4VLWvus8WbeR5Rv9vz+WPHJT0nMnrsG0hnVCDLe2p root@control01
',
  mode => '600',
}

file { '/root/.ssh/id_rsa':
 ensure => "$ensure",
 content => '
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAnkvc5THl3or0WnS0Dy5Cnr6+MIMHJClq+/zNnbrwMDTVJpLE
E8HX4MgPaJXImOCwLZ9QkRbeHlO4FzpGz/XNIlE75/0e0bL2tvVvzclwCiBeejxB
Ge+xR5V8on7joEYmkR2TM+7GzBbIl4YMMDpf37APKQhjqO1WeWNPPAcHHnNMaZvH
aMYE2aB7QRnLJGF9zogHGK/3Sas7yZrT8E1LY6VpZPaU0q53ncYCofVyp3ShBN3s
I7EwJraQJHcOYHWlApiTDOFPqPOkCMUzcuuyE46BZ7DZbKcQ4k5azxp/A+l7eFS1
r7rPFm3keUb/b8/ljxyU9JzJ67BtIZ1Qgy3tqQIDAQABAoIBABr0AeXIrEJLWLX6
PxqCnvdWtR2fgdzHbJ8BeaVMyk76//w0a0yN6gstJWqCboiRYY4zHU3HHgT97k+O
LbaFPOuF93RV5iSAm3+lpObeUMR4pH2dutwGsyHkMzeb8Xg92Z1F8uWZ16Gyk28x
dOvVVLPKz5oGAqol116N6VToQW8OoDqxM1d1zWZThWjya4j5J+vNzYEPoSVVkHjC
4DplDXOhPLe+3gANQBF2l0pdxw03jxGcwNoe3eHWxaQEtZi6tLuK9CxOjioAJ9vx
JpbX+z91hcaXi4Ea+C1m9x3z3rV7BNjc8bpIYCC6DkGnognoNgksK5/x4/e62Qvj
Ahc1Rl0CgYEAyy0MhZgJtzLQ3MYIWhU9EZlptYVpzvwhgOlNlvqaUHd96bD6uM3G
r5QzVdt8PDArfm9i7IqYcynHWXTJlotUkZD9Z1IsIDHnwK0+BxnMrAq2BhPpbZ48
O727AKX5/fhMaMX1J+/SWcfDMU5KYnEGH+ESSuGQ2ZZDVAbc5/mQ7wsCgYEAx3O5
H7WvRqbQFX0RYnuF8qS13FOKYSy9JT8nwKiWbAeNmhAUOo+3ZVQMMx6WungkuJGt
IxdBnodqPGFk+6RlM1ODu0QV3xbqcXPeSpuLq66rWeZALlUGY84hUqkpY9sw68qU
t7oIYgLvFna3zAMeSeF4LpaaJyA0/Ty0BUoO1psCgYEAmtqE9rWAgi6q3fnZl78k
QmupE/7RPD8S0gv/ZRkv0DCiuSB4l63OxzevQLr+n2kfXUhMH3kq5GttUxMeKi2b
kS7u1HbextMCjen8orDZPC8VuOAoQ7IcunPLOZ1HQnii1CA8z+mLa35DmSrQquL2
BgonRQdSvWQ3gK2SZQPjoS0CgYADBaTbbyRNvL9QZAm8ZUS9TXOX+AgTutrO0qsm
hydoUaD6oZ282Wqc9W4N5DvCbYmY5lQqQPL0lPauHYerLG2AHpbTYo+2RqGcwHWw
ybSPEGF2Rj/Ys98Z6gilOPzwj2SpXfNs6TuxSHwY6gmU5MMzuV/ZzNxfFWTYJXBQ
2DNrWwKBgCFDZVuNZhR2n8bE7Tubf5+eQoFuRb7bWR4eG13oQv+YKO9CY53s0C0j
SCkqBNuDUa72Wa2lb6ADkr5647MOuxML/tGYIjaWYgfhBYIXsf6G6OMa4Z1osiT4
1ZGA2Vw0A6hE8LX2g6pROWDMEXdO6lKC2u4lFHL2N5mYyaa67D4a
-----END RSA PRIVATE KEY-----
',
  mode => '600',
}

exec {'user-mod nova':
  path => ['/usr/sbin','/bin'],
  command => 'usermod -s /bin/bash nova',
  unless => 'grep nova /etc/passwd | grep false',
}

file {'/var/lib/nova/.ssh':
  ensure => directory,
  mode => 7700,
  }

file {'/var/lib/nova/.ssh/authorized_keys':
  ensure => present,
  mode => 600,
  content => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeS9zlMeXeivRadLQPLkKevr4wgwckKWr7/M2duvAwNNUmksQTwdfgyA9olciY4LAtn1CRFt4eU7gXOkbP9c0iUTvn/R7Rsva29W/NyXAKIF56PEEZ77FHlXyifuOgRiaRHZMz7sbMFsiXhgwwOl/fsA8pCGOo7VZ5Y088Bwcec0xpm8doxgTZoHtBGcskYX3OiAcYr/dJqzvJmtPwTUtjpWlk9pTSrnedxgKh9XKndKEE3ewjsTAmtpAkdw5gdaUCmJMM4U+o86QIxTNy67ITjoFnsNlspxDiTlrPGn8D6Xt4VLWvus8WbeR5Rv9vz+WPHJT0nMnrsG0hnVCDLe2p root@control'
}

file {'/var/lib/nova/.ssh/id_rsa':
  ensure => present,
  mode => 600,
  content => '
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAnkvc5THl3or0WnS0Dy5Cnr6+MIMHJClq+/zNnbrwMDTVJpLE
E8HX4MgPaJXImOCwLZ9QkRbeHlO4FzpGz/XNIlE75/0e0bL2tvVvzclwCiBeejxB
Ge+xR5V8on7joEYmkR2TM+7GzBbIl4YMMDpf37APKQhjqO1WeWNPPAcHHnNMaZvH
aMYE2aB7QRnLJGF9zogHGK/3Sas7yZrT8E1LY6VpZPaU0q53ncYCofVyp3ShBN3s
I7EwJraQJHcOYHWlApiTDOFPqPOkCMUzcuuyE46BZ7DZbKcQ4k5azxp/A+l7eFS1
r7rPFm3keUb/b8/ljxyU9JzJ67BtIZ1Qgy3tqQIDAQABAoIBABr0AeXIrEJLWLX6
PxqCnvdWtR2fgdzHbJ8BeaVMyk76//w0a0yN6gstJWqCboiRYY4zHU3HHgT97k+O
LbaFPOuF93RV5iSAm3+lpObeUMR4pH2dutwGsyHkMzeb8Xg92Z1F8uWZ16Gyk28x
dOvVVLPKz5oGAqol116N6VToQW8OoDqxM1d1zWZThWjya4j5J+vNzYEPoSVVkHjC
4DplDXOhPLe+3gANQBF2l0pdxw03jxGcwNoe3eHWxaQEtZi6tLuK9CxOjioAJ9vx
JpbX+z91hcaXi4Ea+C1m9x3z3rV7BNjc8bpIYCC6DkGnognoNgksK5/x4/e62Qvj
Ahc1Rl0CgYEAyy0MhZgJtzLQ3MYIWhU9EZlptYVpzvwhgOlNlvqaUHd96bD6uM3G
r5QzVdt8PDArfm9i7IqYcynHWXTJlotUkZD9Z1IsIDHnwK0+BxnMrAq2BhPpbZ48
O727AKX5/fhMaMX1J+/SWcfDMU5KYnEGH+ESSuGQ2ZZDVAbc5/mQ7wsCgYEAx3O5
H7WvRqbQFX0RYnuF8qS13FOKYSy9JT8nwKiWbAeNmhAUOo+3ZVQMMx6WungkuJGt
IxdBnodqPGFk+6RlM1ODu0QV3xbqcXPeSpuLq66rWeZALlUGY84hUqkpY9sw68qU
t7oIYgLvFna3zAMeSeF4LpaaJyA0/Ty0BUoO1psCgYEAmtqE9rWAgi6q3fnZl78k
QmupE/7RPD8S0gv/ZRkv0DCiuSB4l63OxzevQLr+n2kfXUhMH3kq5GttUxMeKi2b
kS7u1HbextMCjen8orDZPC8VuOAoQ7IcunPLOZ1HQnii1CA8z+mLa35DmSrQquL2
BgonRQdSvWQ3gK2SZQPjoS0CgYADBaTbbyRNvL9QZAm8ZUS9TXOX+AgTutrO0qsm
hydoUaD6oZ282Wqc9W4N5DvCbYmY5lQqQPL0lPauHYerLG2AHpbTYo+2RqGcwHWw
ybSPEGF2Rj/Ys98Z6gilOPzwj2SpXfNs6TuxSHwY6gmU5MMzuV/ZzNxfFWTYJXBQ
2DNrWwKBgCFDZVuNZhR2n8bE7Tubf5+eQoFuRb7bWR4eG13oQv+YKO9CY53s0C0j
SCkqBNuDUa72Wa2lb6ADkr5647MOuxML/tGYIjaWYgfhBYIXsf6G6OMa4Z1osiT4
1ZGA2Vw0A6hE8LX2g6pROWDMEXdO6lKC2u4lFHL2N5mYyaa67D4a
-----END RSA PRIVATE KEY-----
'
}

exec {'add No strict host key check':
  path => ['/bin/','/usr/bin','/usr/sbin'],
  command => 'cat >> /etc/ssh/sshd_conf<<EOF
StrictHostKeyChecking no 
UserKnownHostsFile=/dev/null 
EOF
',     
}


}
