status="$(curl -Is http://40.114.111.116:3010/ | head -1)"
validate=( $status )
if [ ${validate[-2]} == "200" ]; then
  echo "OK"
else
  echo "NOT RESPONDING"
fi
