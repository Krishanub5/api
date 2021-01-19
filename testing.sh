status="$(curl -Is http://52.139.201.153:9000/business-2/index.html| head -1)"
validate=( $status )
if [ ${validate[-2]} == "200" ]; then
  echo "OK"
else
  echo "NOT RESPONDING"
fi
