set -e
set -x

python app/prepare_tests.py

coverage run -m pytest .
coverage report -m