
# Ensure front-end has been built before attempting to run
cd "$(dirname "$0")"

if [ ! -d "Public/static/" ]
then
    echo "WARN: Frontend has not yet been built."
    echo "      Build front-end before attempting to run by executing"
    echo "      'build' from the root directory."
    exit 1
fi

source .env

# Some limits will need to be increased in order to successfully build:
ulimit -n 8192
ulimit -u 512
ulimit -v 67108864
ulimit -t 1200

# Run
makeSwift --mode=run "$@"
