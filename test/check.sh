# exit when any command fails
set -e

echo "check files"
ls test/shared/results/reports

iFiles=`ls test/shared/results/reports | grep 'pass' | wc -l`
echo "Files with 'pass': ${iFiles}"

if [ $iFiles -eq 2 ]; then
    echo "all good"
    exit 1
else
    echo "issue detected"
    exit 2
fi