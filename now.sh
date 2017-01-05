#! /bin/sh
#
# Creates a journal entry for today

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`
TIME=`date +%T`
TZ=`date +%Z`

YEARDIR="$DIR/$YEAR"
MONTHDIR="$YEARDIR/$MONTH"
DAYFILE="$MONTHDIR/$DAY.md"

if [ ! -d "$YEARDIR" ]; then
	echo "Creating year directory $YEARDIR"
	mkdir "$YEARDIR"
fi

if [ ! -d "$MONTHDIR" ]; then
	echo "Creating month directory $MONTHDIR"
	mkdir "$MONTHDIR"
fi

if [ ! -f "$DAYFILE" ]; then
	echo "Creating day file $DAYFILE"

	echo "$YEAR-$MONTH-$DAY" > "$DAYFILE"
	echo "==========" >> "$DAYFILE"
	echo "" >> "$DAYFILE"
	echo "Sleep: ?" >> "$DAYFILE"
	echo "" >> "$DAYFILE"
else
	echo "" >> "$DAYFILE"
	echo "" >> "$DAYFILE"
fi

echo "## $TIME $TZ" >> "$DAYFILE"
echo "" >> "$DAYFILE"

if [ -z "$EDITOR" ]; then
	echo "Add an 'editor' variable to your bashrc like:"
else
	`"$EDITOR" "$DAYFILE"`
fi
