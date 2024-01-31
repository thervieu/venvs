#!/bin/bash

PYTHON_REQUIREMENTS_FILE=""


deactivate_venv() {
  if [[ "$VIRTUAL_ENV" != "" ]]
  then
    deactivate
  fi
}

# python3.8

PYTHON_REQU_38_FILE=requirements38.txt

update_38_env () {
  _python_requirements_file=$PYTHON_REQU_38_FILE
  PYTHON_REQUIREMENTS_FILE=requirements38.update.txt
  rebuild_38_env
  PYTHON_REQU_38_FILE=$PYTHON_REQU_38_FILE
  python -m pip freeze > ${CUR_VENV_DIR}/$PYTHON_REQU_38_FILE
}

rebuild_38_env () {
  deactivate_venv
  rm -rf ${CUR_VENV_DIR}/.virtualenv38
  setup_38_env
}

setup_38_env () {
  dir=$(basename ${CUR_VENV_DIR})
  virtualenv -p `which python3.8` ${CUR_VENV_DIR}/.virtualenv38/${dir} && source ${CUR_VENV_DIR}/.virtualenv38/${dir}/bin/activate
  python -m pip install --upgrade pip
  python -m pip install -r ${CUR_VENV_DIR}/${PYTHON_REQUIREMENTS_FILE}
}

# python3.10

PYTHON_REQU_310_FILE=requirements310.txt

update_310_env () {
  _python_requirements_file=$PYTHON_REQU_310_FILE
  PYTHON_REQUIREMENTS_FILE=requirements310.update.txt
  rebuild_310_env
  PYTHON_REQU_310_FILE=$_python_requirements_file
  python -m pip freeze > ${CUR_VENV_DIR}/$PYTHON_REQU_310_FILE
}

rebuild_310_env () {
  deactivate_venv
  rm -rf ${CUR_VENV_DIR}/.virtualenv310
  setup_310_env
}

setup_310_env () {
  dir=$(basename ${CUR_VENV_DIR})
  virtualenv -p `which python3.10` ${CUR_VENV_DIR}/.virtualenv310/${dir} && source ${CUR_VENV_DIR}/.virtualenv310/${dir}/bin/activate
  python -m pip install --upgrade pip
  python -m pip install -r ${CUR_VENV_DIR}/${PYTHON_REQUIREMENTS_FILE}
}

# python3.12

PYTHON_REQU_312_FILE=requirements312.txt

update_312_env () {
  _python_requirements_file=$PYTHON_REQU_312_FILE
  PYTHON_REQUIREMENTS_FILE=requirements312.update.txt
  rebuild_312_env
  PYTHON_REQU_312_FILE=$_python_requirements_file
  python -m pip freeze > ${CUR_VENV_DIR}/$PYTHON_REQU_312_FILE
}

rebuild_312_env () {
  deactivate_venv
  rm -rf ${CUR_VENV_DIR}/.virtualenv312
  setup_312_env
}

setup_312_env () {
  dir=$(basename ${CUR_VENV_DIR})
  virtualenv -p `which python3.12` ${CUR_VENV_DIR}/.virtualenv312/${dir}
  source ${CUR_VENV_DIR}/.virtualenv312/${dir}/bin/activate
  python -m pip install --upgrade pip
  python -m pip install -r ${CUR_VENV_DIR}/${PYTHON_REQUIREMENTS_FILE}
}
if [[ ! -f "update_venv.sh" ]]; then
  echo "Sourcing must be done in the base directory"
  return 1
fi

CUR_VENV_DIR=`pwd`

echo "############################################################"
echo "Type 'deactivate' to quit venv"
echo "Type 'update_38_env'  to update python3.8's venv"
echo "Type 'update_310_env' to update python3.10's venv"
echo "Type 'update_312_env' to update python3.12's venv"
echo "############################################################"
