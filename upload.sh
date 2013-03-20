cd `dirname $0`
jekyll
cd _site && rsync -e ssh -avz . simon04:/srv/http/simon04.net-jekyll/
