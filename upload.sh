cd `dirname $0`
jekyll build && cd _site && rsync -e ssh -avz . legner.me:/srv/http/simon04.net-jekyll/
