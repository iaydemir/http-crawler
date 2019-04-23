#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "${DIR}"

if [ ! -f urls.txt ]
then
  read -p "urls.txt does not exist. please add one and try again. Press enter to continue"
  exit 1
fi

echo '' > log.txt

while read LINE; do
  lne=$(curl -o /dev/null --silent --head --write-out '[ %{http_code} ] [ %{url_effective} ]' "$LINE")
  echo " $lne"
  echo $lne >> log.txt
done < ./urls.txt
