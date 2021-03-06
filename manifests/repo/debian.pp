# Class: jenkins::repo::debian
#
class jenkins::repo::debian
{
  include stdlib

  if $::jenkins::lts  {
    apt::source { 'jenkins':
      location    => 'http://pkg.jenkins-ci.org/debian-stable',
      release     => 'binary/',
      repos       => '',
      key         => 'D50582E6',
      key_source  => 'http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key',
      include_src => false,
      }
    }
  else {
    apt::source { 'jenkins':
      location    => 'http://pkg.jenkins-ci.org/debian',
      release     => 'binary/',
      repos       => '',
      key         => 'D50582E6',
      key_source  => 'http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key',
      include_src => false,
    }
  }

  anchor { 'jenkins::repo::debian::begin': } ->
    Apt::Source['jenkins'] ->
    anchor { 'jenkins::repo::debian::end': }
}



