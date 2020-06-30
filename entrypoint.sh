#!/bin/sh
set -e

cd /app

##
# Map github ref to workspace
ref2env()
{
        case "${GITHUB_REF}" in
        (refs/heads/*)	set -- "${GITHUB_REF##refs/heads/}";;
	(refs/tags/*)	set -- 'tag';;
	(*)		set -- 'unknown';;
        esac

        case "${1}" in
        (${INPUT_PROD:=tag})      set -- 'prod';;
        (${INPUT_QA:=master})	  set -- 'qa';;
        (${INPUT_DEV:=develop}|*) set -- 'dev';;
        esac

        echo "${1}"
}

export DATABRICKS_HOST="https://${INPUT_HOST#https://}"
export DATABRICKS_USERNAME="${INPUT_USERNAME}"
export DATABRICKS_TOKEN="${INPUT_TOKEN}"

if test "${INPUT_DEBUG}" = 'true'; then
	set -x
	: '## Args'
	: "$@"
fi

exec databricks workspace import_dir --overwrite "${INPUT_SOURCE:=./src}" "/${INPUT_WORKSPACE:=$(ref2env)}"
