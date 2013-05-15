### Main program

if test -d (/usr/libexec/java_home)
  set -gx JAVA_HOME (/usr/libexec/java_home)
end

if test (/bin/ls $HOME/.ec2/pk-*.pem | /usr/bin/head -1)
  set -gx EC2_PRIVATE_KEY (/bin/ls $HOME/.ec2/pk-*.pem | /usr/bin/head -1)
end

if test (/bin/ls $HOME/.ec2/cert-*.pem | /usr/bin/head -1)
  set -gx EC2_CERT (/bin/ls $HOME/.ec2/cert-*.pem | /usr/bin/head -1)
end

if test -d /usr/local/Library/LinkedKegs/ec2-api-tools/jars
  set -gx EC2_HOME /usr/local/Library/LinkedKegs/ec2-api-tools/jars
end

