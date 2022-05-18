set -e
set -x

python app/prepare_tests.py

pytest .
