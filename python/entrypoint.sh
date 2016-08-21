#!/bin/bash


function enable_virtualenv {
  if [ "$DEBUG" == "1" ]
  then
    if [ ! -f ${PYTHON_BIN} ]
    then
      virtualenv ${VIRT_DIR}
    fi
  fi
}

function install {
  ${PIP_BIN} install -r ${APP_DIR}/${REQ_FILE} --upgrade $@
}

function run {
  source "/runner.sh"
}

function build_and_run {
  enable_virtualenv
  install
  manage migrate
  run
}

function install_and_run {
  enable_virtualenv
  install
  run
}

function python {
  ${PYTHON_BIN} $@
}

function pip {
  ${PIP_BIN} install "$1"

  local requirements_file=''
  if [ "$2" == "--save" ]
  then
    local requirements_file=requirements.txt
  elif [ "$2" == "--save-dev" ]
  then
    local requirements_file=requirements.dev.txt
  fi

  local installed=`${PIP_BIN} freeze | grep "$1"`
  if [ -n "$requirements_file" ] && ! grep -q "$installed" "$requirements_file"
  then
    echo $installed >> ${APP_DIR}/${requirements_file}
    echo "requirements saved in ${requirements_file} file"
  fi
}

function manage {
  python ${APP_DIR}/manage.py $@
}

function pytest {
  ${VIRT_DIR}/bin/py.test $@
}

function before_push {
  ${VIRT_DIR}/bin/pep8 --exclude=.virtualenv,.git,.ropeproject,migrations --filename=*.py . && \
    manage makemessages -l pl -l en && \
    manage compilemessages -l pl -l en
}


$@
