prefix=""

test $(acpi -a | grep -c on) -eq 0

if [ $? -ne 1 ]; then
	prefix=""
fi

echo -n "$prefix%{F#ffffff}"
acpi -b | grep -o -E -e [0-9]+%
