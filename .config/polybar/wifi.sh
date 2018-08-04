ifname=$(iw dev | grep -P -o '(?<=Interface ).+')

wname=$(iwconfig $ifname | grep -P -o '(?<=ESSID:").+(?=")')

color=$(xrdb -query | grep -P -o '(?<=color4:).+' | tr -d '[:space:]')
echo -n "%{F$color}"
echo -n "$ifname:"

color=$(xrdb -query | grep -P -o '(?<=foreground:).+' | tr -d '[:space:]')
echo -n "%{F$color}"
echo -n "$wname "

signal=$(iwconfig $ifname | grep -o -E -e "[0-9]+\/[0-9]+")
scur=$(echo "$signal" | cut -c -2)
smax=$(echo "$signal" | cut -c 4-)
sperc=$(expr $scur \* 100 / $smax)

echo "- $sperc%"
